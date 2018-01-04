if which pyenv > /dev/null; then 
  echo "HEJ"; 
  eval "$(pyenv init -)"; 
  export PATH="$HOME/.pyenv/shims/:${PATH}"
fi
