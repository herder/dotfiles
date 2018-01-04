if which pyenv > /dev/null; then 
  eval "$(pyenv init -)"; 
  export PATH="$HOME/.pyenv/shims/:${PATH}"
fi
