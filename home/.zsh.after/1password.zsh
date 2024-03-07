if ! type op >/dev/null 2>&1; then
sudo $DOTFILES_PATH/install/install_1password.sh
 fi
eval "$(op completion zsh)"; compdef _op op
