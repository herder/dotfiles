if which pyenv > /dev/null; then 
  eval "$(pyenv init -)"; 
#  export PATH="$HOME/.pyenv/shims/:${PATH}"
fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
