#Use the most current completion  instead of the
#one provided by Homebrew
command -v kubectl >/dev/null 2>&1 && source <(kubectl completion zsh)
