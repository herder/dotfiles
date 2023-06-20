#Use the most current completion  instead of the
#one provided by Homebrew

if type kubectl >/dev/null; then
  source <(kubectl completion zsh)
fi
