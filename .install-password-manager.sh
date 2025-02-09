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

if ! type pacman >/dev/null 2>&1; then
  "This is not an Arch Linux install - bailing out"
  exit
fi

if [[ ! -d ~/.pyenv ]]; then
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  eval $(pyenv init --)

fi
if ! type n >/dev/null 2>&1; then
  curl -L https://bit.ly/n-install | bash
  n latest
fi

if ! type yay >/dev/null 2>&1; then
  echo "Install yay"
  sudo pacman -Syu
  sudo pacman -S --needed base-devel git
  git clone https://aur.archlinux.org/yay.git ~/yay/
  cd ~/yay/
  yes | makepkg -si
  rm -rf ~/yay
fi

type 1password >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
  # Install for macos - not supported
  "Can't install 1password on Macos yet"
  ;;
Linux)
  # Install for linux
  yes | yay -S 1password 1password-cli
  ;;
*)
  echo "Unsupported OS - can't install 1password"
  exit 1
  ;;
esac
