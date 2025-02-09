export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export PATH="$$GOENV_ROOT/shims:${PATH}"

if [[ ! -a ~/.goenv ]]; then
  echo "Did not find goenv installation, cloning..."
  git clone git@github.com:syndbg/goenv.git $GOENV_ROOT
fi

if which goenv > /dev/null; then 
  source <(goenv init -)
  export PATH="$GOROOT/bin:$PATH"
  export PATH="$PATH:$GOPATH/bin"
fi

if ! type go >/dev/null 2>&1; then
  goenv install latest
  goenv versions | xargs goenv global
fi

if which goenv-virtualenv-init > /dev/null; then eval "$(goenv virtualenv-init -)"; fi
