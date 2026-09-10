# dotfiles

Chezmoi-managed dotfiles for Linux (apt/pacman) and macOS.

## Fresh machine setup

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/herder/dotfiles/main/bootstrap.sh)
```

Process substitution, not `curl | bash`: the script and everything it runs (chezmoi's
config prompts, chsh, apt, rustup, ssh) must have the terminal on stdin. The script
re-attaches `/dev/tty` itself if you forget, but it cannot do that from a non-interactive
context.

In the 1Password app, enable **both** Settings → Developer → *Integrate with 1Password
CLI* and *Use the SSH agent*. The script waits for each and says which one it is missing.

This handles the chicken-and-egg problem: 1Password must be installed and authenticated before chezmoi can apply (templates use `onepasswordRead`). The script:

1. Detects OS (apt / pacman / macOS+Homebrew)
2. Installs 1Password + CLI
3. Walks through sign-in, proves `op read` works, waits for the SSH agent to offer a key
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

All hosts are prompted on first `chezmoi init` (`promptBoolOnce`, so answers stick): ephemeral,
headless, personal, work, laptop, and **keybase** (opt-in; KBFS is a known suspend-wedger on
laptops). Flags control which packages, configs, and secrets are applied. To change an answer
later, edit `~/.config/chezmoi/chezmoi.toml` or delete it and re-run `chezmoi init`.

## Re-applying

After making changes locally:

```bash
chezmoi apply
```
