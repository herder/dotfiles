# dotfiles

Chezmoi-managed dotfiles for Linux (apt/pacman) and macOS.

## Fresh machine setup

```bash
curl -fsSL https://raw.githubusercontent.com/herder/dotfiles/main/bootstrap.sh | bash
```

This handles the chicken-and-egg problem: 1Password must be installed and authenticated before chezmoi can apply (templates use `onepasswordRead`). The script:

1. Detects OS (apt / pacman / macOS+Homebrew)
2. Installs 1Password + CLI
3. Walks through sign-in and waits for SSH agent
4. Installs zsh, sets it as default shell
5. Installs chezmoi and runs `chezmoi init --apply`

## What's managed

**Shell**: zsh with [antidote](https://getantidote.github.io/) plugin manager, [starship](https://starship.rs/) prompt, [atuin](https://atuin.sh/) history, [fzf](https://github.com/junegunn/fzf), [zoxide](https://github.com/ajeetdsouza/zoxide)

**Editor**: Neovim (via [bob](https://github.com/MordechaiHadad/bob)), [LazyVim](https://www.lazyvim.org/) config, `.ideavimrc` for JetBrains

**Terminal**: [wezterm](https://wezfurlong.org/wezterm/), tmux ([gpakosz/.tmux](https://github.com/gpakosz/.tmux))

**Dev tools**: SDKMAN (JVM), n (Node), Rust/cargo, Docker, AWS CLI, kubectl, k9s, helm, tilt, dive, eksctl

**Fonts**: IosevkaTerm, JetBrainsMono, CascadiaCode (Nerd Fonts)

**Security**: 1Password SSH agent, YubiKey, [keyd](https://github.com/rvaiya/keyd) (caps→esc)

## Machine detection

Chezmoi config (`.chezmoi.toml.tmpl`) sets feature flags based on hostname:

| Hostname   | personal | work | laptop | headless |
|------------|----------|------|--------|----------|
| `sobchak`  | yes      | no   | no     | no       |
| `lebowski` | yes      | yes  | yes    | no       |
| `ubuntu`   | yes      | no   | no     | yes      |

Unknown hosts get interactive prompts. Flags control which packages, configs, and secrets are applied.

## Re-applying

After making changes locally:

```bash
chezmoi apply
```
