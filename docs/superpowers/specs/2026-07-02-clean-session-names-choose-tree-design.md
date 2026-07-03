# Clean session names + Claude task in choose-tree

Date: 2026-07-02 (revised 2026-07-03: dropped the session-wizard fork in favor of
native `choose-tree`)

## Problem

Sessions are renamed to fold each Claude pane's task into a ` [ … ]` suffix on the
session name (commit 1d182d4, `tmux-claude-desc`). This makes the switcher show
what each session is doing — but it puts **spaces and `[ ] |` characters into
session names**, which `tmux-session-wizard` cannot tolerate (it derives names from
directory basenames, normalising whitespace to dashes). The damage:

- Selecting an existing session: `SESSION=$(awk '{print $1}')` grabs only the first
  word, so the switch relies on ambiguous tmux prefix-matching (two `platform`
  worktrees → fails).
- The current-session filter `grep -v " $(#S):"` reads `[ … ]` as a regex character
  class and silently stops matching.
- **Create/reuse** (`t <dir>` → `has-session -t=<name>`, exact match): once a session
  is renamed, the exact key no longer exists, so session-wizard creates a
  **duplicate** instead of reusing the open session. This is the one that hurts,
  because creating sessions from a directory is the primary use of session-wizard.

## Goal

See each session's current Claude task when selecting a session, while keeping
session names **clean, stable, directory-derived** so session-wizard's create/reuse
works correctly. Use the native `choose-tree` UI (bound to `prefix s`) — no custom
picker, no plugin fork.

## Key decisions

- **Selection** happens via native `choose-tree` (`prefix s`). **Creation** stays
  with session-wizard (`prefix a`, zoxide directory jump) — untouched.
- Descriptions surface **only** in the `choose-tree` picker (decision "(a)"): not in
  the status line or bare `tmux ls`.
- The task is shown from a **session-scoped** option aggregating *all* the session's
  Claude panes — not `#{pane_title}`, which would only reflect whichever pane is
  active and would go blank whenever a shell pane has focus.

## Non-goals

- Forking / vendoring session-wizard (earlier plan, dropped — native choose-tree
  makes it unnecessary).
- Descriptions in the status line or bare `tmux ls`.
- session-wizard's basename-collision on *create* (`@session-wizard-mode` =
  `directory`; two `platform` worktrees map to one name). Pre-existing, out of scope.

## Design

### Source of truth

Per-pane `@claude_desc` remains the atom (set by `tmux-claude-desc capture` from the
pane title). A **session-scoped `@claude_session_desc`** is the derived aggregate the
picker reads. Distinct option names avoid any pane-vs-session scope ambiguity.

### Components

**1. `tmux-claude-desc` — retarget the write from name to session option**
(`dot_local/bin/executable_tmux-claude-desc`)

- `capture` / `clear`: unchanged — set / unset this pane's `@claude_desc`.
- `refresh_one`: keep the existing aggregate/dedup/per-item-truncate/join logic, but
  **replace `rename-session -t <sid> "<base><suffix>"` with `set-option -t <sid>
  @claude_session_desc "<suffix>"`** (store the ` [ … ]` string; empty → set `""`).
  Delete `base_of` and all base-name parsing — there is no name to preserve or strip
  anymore.
- `refresh_all` and the `capture`/`clear` tails call the same retargeted
  `refresh_one`. The `window-layout-changed` refresh hook and `bind T` stay: the
  session aggregate is derived state, so a closed pane still needs a recompute to
  drop its contribution.
- `~/.claude/settings.json` hooks (call `capture` / `clear`) need no change.

**2. `dot_tmux.conf.tmpl` — rebind `prefix s`**

Replace the stock `choose-tree` binding with:

```tmux
bind s choose-tree -Zs -F '#{?session_format,#{session_name}#{@claude_session_desc},#{?window_format,#{window_index}:#{window_name}#{window_flags},#{pane_title}}}'
```

`-s` (sessions collapsed) makes the session line the primary view; the
`#{?session_format,…}` conditional decorates only session lines and leaves
window/pane lines (when expanded) rendering their own name/title. Exact format to be
tuned interactively.

The `window-layout-changed` hook and `bind T` (refresh) are retained (see above).
session-wizard config (`@plugin`, `@session-wizard 'a'`) is **unchanged**.

### Data flow

```
Claude hook → pane title → tmux-claude-desc capture → per-pane @claude_desc
                    → refresh_one aggregates the session's panes
                    → set-option @claude_session_desc " [task | task…]"   (NOT rename)

prefix s → choose-tree -Zs -F '… #{@claude_session_desc} …'  → select → switch
prefix a → session-wizard (clean names) → has-session -t=<name> reuse works → no dupes
```

### What this fixes

Session names revert to clean directory keys, so session-wizard's `has-session
-t=<name>` reuse succeeds (no duplicate sessions) and resurrect round-trips names
unchanged. The task text still shows in the selection UI, aggregated across all
Claude panes in a session.

## Testing

- **Aggregation/truncation** (pure shell): feed known per-pane `@claude_desc` values
  for a synthetic session; assert the joined/truncated `@claude_session_desc` (dedup,
  per-item cap, ellipsis, empty → `""`).
- **choose-tree render** (interactive, the one unverified assumption): confirm
  `choose-tree -F` expands `#{@claude_session_desc}` on session lines and that
  window/pane lines still look right when expanded. Fallback if session user options
  don't expand in tree context: `#{pane_title}` (active-pane only, proven to resolve).
- **session-wizard regression** (interactive): `t <dir>` into an already-open project
  reuses its session instead of creating a duplicate; resurrect save/restore keeps
  names clean.

## Loose ends (noted, not blocking)

- Per-pane `@claude_desc` and session `@claude_session_desc` are intentionally
  distinct option names.
- `@session-wizard-mode` basename-collision on create — see Non-goals.
