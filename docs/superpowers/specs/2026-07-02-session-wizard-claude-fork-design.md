# Vendored session-wizard fork with live Claude descriptions

Date: 2026-07-02

## Problem

Sessions are renamed to fold each Claude pane's task into a ` [ … ]` suffix on
the session name (commit 1d182d4, `tmux-claude-desc`). This lets the switcher and
`list-sessions` show what each session is doing — but it introduces **spaces and
`[ ] |` characters into session names**, which `tmux-session-wizard` was never
built to tolerate (it derives names from directory basenames, normalising all
whitespace to dashes). Concretely, in the plugin's `bin/t`:

- Selecting an existing session runs `SESSION=$(awk '{print $1}')`, which grabs
  only the first word of the name (`platform`, not `platform [Fix upload…]`).
  Switching then relies on tmux prefix-matching to recover the full name — which
  is *ambiguous* when two sessions share a base (e.g. two `platform` worktrees)
  and fails outright.
- The "hide current session" filter `grep -v " $(#S):"` treats the `[ … ]` in the
  current name as a regex character class, so it silently stops matching and the
  current session leaks into the picker.
- The `t <dir>` create/reuse path uses `has-session -t=<name>` (exact match). Once
  a session is renamed, the exact-match key no longer exists, so session-wizard
  creates a **duplicate** session instead of reusing the existing one.

## Goal

Find a Claude session among many via a fuzzy picker that shows each session's
current task, while keeping session names clean, stable, and machine-parseable —
the RDBMS model: `session_id` is the immutable key, the task text is display-only.

## Non-goals

- Descriptions in the status line or bare `tmux ls` (picker-only — decision "(a)").
- Fixing session-wizard's basename-collision on *create* (`@session-wizard-mode`
  defaults to `directory`; two `platform` worktrees map to one name). Pre-existing
  upstream behavior, out of scope.
- Replacing session-wizard's zoxide directory-reuse machinery — we keep it.

## Design

### Single source of truth, zero derived state

The **per-pane `@claude_desc` option** is the only stored fact. Everything else is
computed on demand when the picker opens. No session renames, no session-scoped
option, no cleanup hook. A closed pane's option dies with the pane, so a stale
description is structurally impossible.

### Components

**1. `tmux-claude-desc` — reduced to two verbs**
(`dot_local/bin/executable_tmux-claude-desc`)

- `capture`: read this pane's title → clean → set per-pane `@claude_desc`
  (unset for the `claude:` placeholder). *Unchanged behavior.*
- `clear`: unset this pane's `@claude_desc`. *Unchanged behavior.*
- **Delete** `refresh`, `refresh_all`, `refresh_one`, `base_of`, and the
  aggregate/truncate/join helpers — the rename mechanism is gone. Aggregation and
  truncation move into the picker (display concern).

The `~/.claude/settings.json` hooks that invoke `capture` / `clear` are unchanged.

**2. Vendored fork of tmux-session-wizard**
(chezmoi: `dot_local/share/tmux-session-wizard/{bin/executable_t,src/helpers.sh}`
→ `~/.local/share/tmux-session-wizard/bin/t` + `src/helpers.sh`)

Faithful copy of upstream `27medkamal/tmux-session-wizard`, kept as a small,
auditable diff so re-syncing upstream is copy + reapply. Three changes to `bin/t`
(no-argument / FZF path only):

- **Session-list build**: replace the single `list-sessions -F "…"` with a loop
  that, per session, aggregates its panes' `@claude_desc` (dedup + per-item
  truncate + join — logic ported out of the old `tmux-claude-desc`). Sessions with
  no Claude desc keep the stock `#{session_windows} window(s)` text, so ordinary
  sessions look normal.
- **Hidden id column**: emit each session row as `<session_id>\t<name: desc>`.
  fzf shows and searches only column 2 (`--delimiter=$'\t' --with-nth=2..`); the id
  rides along invisibly. zoxide directory rows have no leading id.
- **Selection dispatch**: if the chosen row's field 1 matches `^\$[0-9]+$` →
  `switch-client -t <id>` / `attach -t <id>` (space-proof, collision-proof).
  Otherwise it is a zoxide path → upstream create logic, untouched. This also
  replaces the buggy `grep -v " #S:"` current-session filter with an id-based
  exclusion (`#{session_id}` of the current session).

Sort-by-`session_last_attached` and the zoxide-query append are preserved.

**3. `dot_tmux.conf.tmpl`**

- Remove: `set -g @plugin '27medkamal/tmux-session-wizard'`, `set -g
  @session-wizard 'a'`, the `window-layout-changed` refresh hook, and `bind T`.
- Add: `bind a display-popup -w 80% -h 40% -E
  '~/.local/share/tmux-session-wizard/bin/t'` (same key and popup ergonomics as
  upstream's default binding).
- `prefix s` stays stock `choose-tree` (unchanged).

### Data flow

```
Claude hook → pane title → tmux-claude-desc capture → per-pane @claude_desc
                                                              │
prefix a → forked bin/t ── per session: aggregate panes' @claude_desc ──┘
         → fzf shows "name: task…" (id hidden in col 1)
         → select → switch-client -t $session_id     (existing session)
                  → zoxide path → new-session          (typed/queried directory)
```

## Testing

- **Aggregation/truncation** (pure shell): feed known pane `@claude_desc` values
  for a synthetic session and assert the joined/truncated display string (dedup,
  per-item cap, ellipsis, empty → stock `N window(s)`).
- **Switch dispatch** (interactive): open the popup, pick a Claude session, confirm
  it lands on the right session even with two sharing a base name.
- **Create path** (interactive): type/query a directory, confirm a new session is
  created and reused on the second invocation (name stays clean).
- **Regression**: confirm `has-session -t=<name>` reuse works (no duplicate
  sessions), and resurrect save/restore round-trips names unchanged.

## Loose ends (noted, not blocking)

- The already-cloned `~/.tmux/plugins/tmux-session-wizard` lingers until
  `prefix + alt-u` (TPM clean). Harmless; remove manually or leave it.
- `@session-wizard-mode` basename-collision on create — see Non-goals.
