if type bob >/dev/null 2>&1; then
  eval "$(bob complete zsh)"
  PATH=$HOME/.local/share/bob/nvim-bin:$PATH
fi
