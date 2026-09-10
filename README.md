# dotfiles

[chezmoi](https://www.chezmoi.io/)-managed dotfiles. The exercised target is **Pop!_OS 24.04
with COSMIC** on x86_64; `bootstrap.sh` and `packages.yaml` carry pacman and Homebrew paths
too, but almost every script is gated on `osid == linux-pop` and the other two are not
regularly tested.

## Fresh machine setup

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/herder/dotfiles/main/bootstrap.sh)
```

Process substitution, not `curl | bash`: the script and everything it runs (chezmoi's config
prompts, chsh, apt, rustup, ssh) must have the terminal on stdin. chezmoi treats a non-TTY
stdin as an ephemeral headless machine and `promptBoolOnce` remembers that answer. The script
re-attaches `/dev/tty` if you forget, but cannot do so from a non-interactive context.

What it does, in order:

1. Installs `git`, `curl`, `gpg` if missing, then 1Password and its CLI from the 1Password
   apt repo.
2. Opens the 1Password app and waits for sign-in. In the app, enable **both**
   Settings → Developer → *Integrate with 1Password CLI* and *Use the SSH agent*. The
   script tells you every 30 s which one it is still waiting on.
3. Proves `op read` works on the first item chezmoi's config template needs, and waits until
   the SSH agent actually offers a key — `chezmoi apply` clones a private repo over SSH.
4. Installs zsh and makes it the login shell.
5. Installs chezmoi to `~/.local/bin` and runs `chezmoi init --apply herder/dotfiles`
   (HTTPS clone; a `personal` machine flips origin to SSH during apply).

Expect an hour or more: sdkman installs six JVM SDKs, Ollama pulls a model, fonts and an icon
theme download. sudo re-prompts when its timestamp lapses. If a script fails, chezmoi stops at
that script and names it; fix and re-run `chezmoi apply` — `run_once` state is only recorded
on success, so re-running is safe.

## Machine flags

`.chezmoi.toml.tmpl` asks these once (`promptBoolOnce`, answers persist in
`~/.config/chezmoi/chezmoi.toml`) and everything else keys off them:

| Flag | Gates |
|---|---|
| `ephemeral` | containers/VMs/codespaces: skips chsh, keyd, fonts, desktop apps; auto-true when stdin is not a TTY |
| `headless` | no display: skips fonts, icon theme, Mattermost, Ollama, piper, Obsidian |
| `personal` | personal secrets and tools: SSH origin, crontab, Dropbox, JetBrains Toolbox, iFi audio rules |
| `work` | Stravito tooling: AWS CLI/VPN, eksctl, sops, stravinfra, gh-standup, work git identity; also prompts for GitHub project owner/number/username |
| `laptop` | Keybase autostart removal, Thunderbolt-dock udev rule |
| `keybase` | opt-in Keybase install; KBFS is a known suspend-wedger, so it is never installed by default |

To change an answer: edit `chezmoi.toml`, or delete it and re-run `chezmoi init`. Work
tooling that must never exist on a personal machine is additionally excluded via
`.chezmoiignore` under `{{ if not .work }}`.

## What's managed

**Shell** — zsh rehomed to `~/.config/zsh` (`ZDOTDIR`), [antidote](https://getantidote.github.io/)
plugins from `dot_zsh_plugins.txt`, zsh-vi-mode, [starship](https://starship.rs/),
[atuin](https://atuin.sh/) (self-hosted sync, credentials from 1Password), fzf, zoxide,
direnv. `dot_zsh.before/` and `dot_zsh.after/` hold per-topic snippets.

**Terminal** — [wezterm](https://wezfurlong.org/wezterm/); tmux with an own `dot_tmux.conf.tmpl`
(tpm, tmux-resurrect) and hooks that fold each Claude Code pane's task into the `prefix+s`
session picker and survive resurrect save/restore (`tmux-claude-desc`, `tmux-resurrect-*`).

**Editor** — Neovim via [bob](https://github.com/MordechaiHadad/bob), a LazyVim-based config in
`private_dot_config/nvim`, `.ideavimrc` for JetBrains.

**Desktop (COSMIC)** — panel, background, compositor and custom shortcuts under
`private_dot_config/cosmic`; [pop-launcher](https://github.com/pop-os/launcher) scripts and a
curated web-search plugin under `dot_local/share/pop-launcher`; Wonderbrushed icon theme;
`sudo-askpass` graphical prompt.

**Audio (PipeWire/WirePlumber)** — bit-perfect route for the iFi USB DAC, SOFA-based
headphone spatializer, EQ and speaker auto-gain filter chains, dock/DAC device rules, and a
udev-triggered `reset-ifi-audio`.

**Dev tools** — SDKMAN (JVM), n (Node), rustup + cargo-binstall with a tool list in
`packages.yaml`, uv, Docker Compose, AWS CLI, kubectl, k9s, helm, tilt, dive, act, pack,
trivy, just, tfenv, CircleCI CLI, gh, beads (`bd`), opencode. Binaries come from GitHub
releases as chezmoi externals (`.chezmoiexternal.toml.tmpl`), apt packages from
`.chezmoidata/packages.yaml`.

**Fonts** — IosevkaTerm, JetBrainsMono, CascadiaCode (Nerd Fonts).

**Security** — 1Password SSH agent (`IdentityAgent` in `~/.ssh/config`), SSH commit signing,
YubiKey (`libpam-u2f`, `yubikey-luks`), [keyd](https://github.com/rvaiya/keyd) caps→esc on
every Linux machine. All secrets are `onepasswordRead` template calls; nothing secret is in
the repo.

**Personal scripts** in `~/.local/bin` (`dot_local/bin/`):

| Script | Purpose |
|---|---|
| `task`, `task-*` | task management against the Obsidian vault (`add/list/done/edit/sync/tickle/priority/tui`, GitHub status refresh) |
| `daily-note` | open/create today's Obsidian daily note |
| `gh-standup` | Mon–Fri systemd timer: summarises yesterday's GitHub activity and DMs it on Slack (work only) |
| `claude-whose-pr` | which Claude Code session owns a PR, via worktree lock files |
| `remind` | desktop notification at a future time via `at(1)` |
| `audio-switch`, `monitor-switch`, `kbd-layout` | fzf sink/source switcher, DDC/CI input switching, current xkb layout |
| `update-all` (`bin/`) | `chezmoi update`, then apt, toolchains, plugin managers, cargo/npm/gh extensions, Ollama models |

## Layout and conventions

- `.chezmoiscripts/` — OS-agnostic run scripts; `.chezmoiscripts/linux/` — Linux-only.
  `run_once_*` run once per content hash; `run_onchange_*` re-run when their rendered content
  changes, which is how weekly refreshes work (`# weekly-tick: {{ div (now | unixEpoch) 604800 }}`).
  **A non-zero exit from any script aborts the whole apply**, so scripts are `set -euo pipefail`
  and idempotent.
- `run_onchange_before_install-basic-packages` runs before anything else and only installs
  distro packages. Anything needing rust, gh or a display belongs in an `after` script.
- `~/.claude` is **not** managed here. It is a separate checkout of `herder/claude-private`,
  cloned once by `run_once_install_claude_private` and thereafter owned by its own hooks.
- `docs/superpowers/specs/` holds design notes for the larger pieces (the tmux/Claude session
  picker).
- Commits go straight to `main`; there is no PR flow for this repo.

## Day to day

```bash
chezmoi apply          # after editing the source tree
chezmoi diff           # what would change
update-all             # pull + apply, then update everything that has an updater
chezmoi cd             # into ~/.local/share/chezmoi
```
