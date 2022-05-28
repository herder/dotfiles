BREW_HOME=~/src/git/github.com/Homebrew/brew

test -d $BREW_HOME && eval $($BREW_HOME/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
