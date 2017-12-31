if which rbenv > /dev/null; then 
  eval "$(rbenv init -)"; 
  export PATH="$HOME/.rbenv/shims:${PATH}"
fi
