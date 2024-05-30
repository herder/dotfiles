if ! type op >/dev/null 2>&1; then
  sudo $DOTFILES_PATH/install/install_1password.sh
  source $HOME/.config/op/plugins.sh
  # opam configuration
  [[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
  eval "$(op completion zsh)" 
fi


