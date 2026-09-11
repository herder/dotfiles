if [ -d ~/.tfenv ]; then
  PATH=$PATH:~/.tfenv/bin
fi
# ~/.tfenv is a chezmoi git-repo external, so config placed there is untracked.
# CONFIG_DIR holds use-gpgv and the installed versions; ROOT stays the clone.
export TFENV_CONFIG_DIR="$HOME/.config/tfenv"
alias tf=terraform
