#!/usr/bin/env bash

if [[ ! -d ~/.sdkman ]]; then
  echo "Installing sdkman!"
  curl -s "https://get.sdkman.io" | bash
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
  for i in java kotlin springboot gradle; do
    echo "Installing $i"
    yes | sdk install $i
  done
fi

if [[ ! -d ~/.pyenv ]]; then
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  eval "$(pyenv init --)"
fi

if [[ ! -d ~/.fzf ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

if ! type n >/dev/null 2>&1; then
  curl -L https://bit.ly/n-install | bash
  n latest
fi

if ! type rustup >/dev/null 2>&1; then
  curl https://sh.rustup.rs -sSf | sh
  . "$HOME/.cargo/env"
fi

if ! type tailscale >/dev/null 2>&1; then
  curl -fsSL https://tailscale.com/install.sh | sh
fi

[ -d $HOME/.config/nvim ] || git clone https://github.com/LazyVim/starter ~/.config/nvim
case "$(uname -s)" in
Darwin)
  # Install for macos - not supported
  "Can't install 1password on Macos yet"
  ;;
Linux)
  # Install for linux
  type 1password >/dev/null 2>&1 && exit

  if type apt >/dev/null 2>&1; then
    echo "Installing 1password"
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
    sudo apt-get update
    sudo apt-get install 1password -y
  fi

  if type pacman >/dev/null 2>&1; then
    if ! type yay >/dev/null 2>&1; then
      echo "Install yay"
      sudo pacman -Syu
      sudo pacman -S --needed base-devel git
      git clone https://aur.archlinux.org/yay.git ~/yay/
      cd ~/yay/
      yes | makepkg -si
      rm -rf ~/yay
    fi
    yes | yay -S 1password 1password-cli
  fi
  ;;
*)
  echo "Unsupported OS - can't install 1password"
  exit 1
  ;;
esac
