if status --is-interactive
  abbr --add --global be 'vim $DOTFILES_PATH/Brewfile'
  abbr --add --global con 'sshrc -A '
  abbr --add --global gfc 'clone'
  abbr --add uv "vim -c 'set nomore' -c 'PlugUpdate' -c 'qa!'"
end
