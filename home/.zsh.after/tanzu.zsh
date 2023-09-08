if ! type tanzu >/dev/null 2>&1 ; then
  sh $DOTFILES_PATH/install/install_tanzu.sh
  tanzu completion zsh > ~/.zfunc/_tanzu
fi
