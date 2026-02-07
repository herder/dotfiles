#!/usr/bin/env bash
#
# Bootstrap script for setting up a fresh machine with chezmoi dotfiles.
# Handles the chicken-and-egg problem: 1Password must be installed and
# authenticated before chezmoi can apply (templates use onepasswordRead).
#
# Usage: curl -fsSL https://raw.githubusercontent.com/herder/dotfiles/main/bootstrap.sh | bash

set -euo pipefail

# --- OS Detection ---

detect_os() {
  case "$(uname -s)" in
    Linux)
      if command -v apt >/dev/null 2>&1; then
        echo "linux-apt"
      elif command -v pacman >/dev/null 2>&1; then
        echo "linux-pacman"
      else
        echo "Unsupported Linux distribution (need apt or pacman)" >&2
        exit 1
      fi
      ;;
    Darwin)
      echo "macos"
      ;;
    *)
      echo "Unsupported OS: $(uname -s)" >&2
      exit 1
      ;;
  esac
}

OS="$(detect_os)"
echo "Detected OS: $OS"

# --- 1Password Installation ---

install_1password() {
  if command -v 1password >/dev/null 2>&1 && command -v op >/dev/null 2>&1; then
    echo "1Password and CLI already installed."
    return
  fi

  echo "Installing 1Password and CLI..."

  case "$OS" in
    linux-apt)
      curl -sS https://downloads.1password.com/linux/keys/1password.asc \
        | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
      echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' \
        | sudo tee /etc/apt/sources.list.d/1password.list
      sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
      curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol \
        | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
      sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
      curl -sS https://downloads.1password.com/linux/keys/1password.asc \
        | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
      sudo apt-get update
      sudo apt-get install -y 1password 1password-cli
      ;;
    linux-pacman)
      if ! command -v yay >/dev/null 2>&1; then
        echo "Installing yay..."
        sudo pacman -Syu --noconfirm
        sudo pacman -S --needed --noconfirm base-devel git
        git clone https://aur.archlinux.org/yay.git ~/yay/
        (cd ~/yay/ && yes | makepkg -si)
        rm -rf ~/yay
      fi
      yes | yay -S 1password 1password-cli
      ;;
    macos)
      if ! command -v brew >/dev/null 2>&1; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv 2>/dev/null)"
      fi
      brew install --cask 1password
      brew install 1password-cli
      ;;
  esac
}

install_1password

# --- 1Password Login ---

echo ""
echo "============================================"
echo " 1Password Setup"
echo "============================================"
echo ""
echo "After signing in, enable:"
echo "  Settings -> Developer -> SSH Agent"
echo ""

start_1password_login() {
  if op account list 2>/dev/null | grep -q .; then
    echo "1Password already signed in."
    return
  fi

  if [ -n "${DISPLAY:-}" ] || [ -n "${WAYLAND_DISPLAY:-}" ]; then
    echo "Opening 1Password GUI... Please sign in."
    1password &>/dev/null &
    echo "Waiting for you to sign in via the GUI..."
    while ! op account list 2>/dev/null | grep -q .; do
      sleep 2
    done
    echo "1Password sign-in detected."
  else
    echo "No display detected, using CLI sign-in..."
    eval "$(op signin)"
  fi
}

start_1password_login

# --- Wait for 1Password SSH Agent ---

wait_for_ssh_agent() {
  local sock
  case "$OS" in
    macos)
      sock="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
      ;;
    linux-apt|linux-pacman)
      sock="$HOME/.1password/agent.sock"
      ;;
  esac

  echo "Waiting for 1Password SSH agent socket..."
  local attempts=0
  while [ ! -S "$sock" ]; do
    attempts=$((attempts + 1))
    if [ $attempts -ge 60 ]; then
      echo "Timed out waiting for SSH agent socket at: $sock" >&2
      echo "Make sure SSH Agent is enabled in 1Password Developer settings." >&2
      exit 1
    fi
    sleep 2
  done

  export SSH_AUTH_SOCK="$sock"
  echo "SSH agent socket found. Verifying..."

  if ssh-add -l >/dev/null 2>&1; then
    echo "SSH agent is working."
  else
    echo "Warning: SSH agent socket exists but no keys listed yet."
    echo "This is normal if you haven't added SSH keys to 1Password."
  fi
}

wait_for_ssh_agent

# --- Install zsh ---

install_zsh() {
  if command -v zsh >/dev/null 2>&1; then
    echo "zsh already installed."
  else
    echo "Installing zsh..."
    case "$OS" in
      linux-apt)
        sudo apt-get install -y zsh
        ;;
      linux-pacman)
        sudo pacman -S --noconfirm zsh
        ;;
      macos)
        brew install zsh
        ;;
    esac
  fi
}

install_zsh

# --- Set default shell to zsh ---

set_default_shell() {
  local current_shell
  current_shell="$(getent passwd "$USER" 2>/dev/null | cut -d: -f7 || dscl . -read /Users/"$USER" UserShell 2>/dev/null | awk '{print $2}')"

  if [ "$current_shell" = "$(which zsh)" ]; then
    echo "Default shell is already zsh."
    return
  fi

  echo "Setting default shell to zsh..."
  chsh -s "$(which zsh)"
}

set_default_shell

# --- Install chezmoi ---

install_chezmoi() {
  if command -v chezmoi >/dev/null 2>&1; then
    echo "chezmoi already installed."
    return
  fi

  echo "Installing chezmoi..."
  local bin_dir="$HOME/.local/bin"
  mkdir -p "$bin_dir"
  sh -c "$(curl -fsSL https://get.chezmoi.io)" -- -b "$bin_dir"
  export PATH="$bin_dir:$PATH"
}

install_chezmoi

# --- chezmoi init --apply ---

echo ""
echo "============================================"
echo " Applying dotfiles with chezmoi"
echo "============================================"
echo ""

chezmoi init --apply herder/dotfiles

echo ""
echo "============================================"
echo " Bootstrap complete!"
echo "============================================"
echo ""
echo "You may want to restart your shell or log out and back in"
echo "for all changes to take effect."
