if [[ ! -a ~/.pyenv ]]; then
  echo "Did not find pyenv installation, cloning..."
  git clone git@github.com:pyenv/pyenv.git ~/.pyenv
fi
if [[ ! -a ~/.pyenv/plugins/pyenv-virtualenv ]]; then
  echo "Did not find pyenv-virtualenv installation, cloning..."
  git clone git@github.com:pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"
#
# if which pyenv > /dev/null; then 
#   source <(pyenv init -)
#   # export PATH="$HOME/.pyenv/shims/:${PATH}"
# fi
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
#
# #Strip comments and empty lines from output - breaks completion otherwise
# if [[ ! -a ~/.zfunc/_pip ]]; then
# pip completion --zsh | grep -v completion | sed '/^[[:space:]]*$/d' > ~/.zfunc/_pip
# fi
#
# compctl -K _pip_completion pip3
# compctl -K _pip_completion pip
