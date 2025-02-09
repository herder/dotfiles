if type just >/dev/null 2>&1; then
  rm -f ~/.zfunc/_just
  just --completions zsh > ~/.zfunc/_just
fi
