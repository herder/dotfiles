if ! type circleci >/dev/null 2>&1 ; then
  echo "Installing CircleCI..."
  curl -fLSs https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh | DESTDIR=$HOME/.local/bin bash
  circleci completion zsh > ~/.zfunc/_circleci
fi

