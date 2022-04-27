if type brew > /dev/null 2>&1 ; then
local BREW_PREFIX=$(brew --prefix)
 fpath=($BREW_PREFIX/share/zsh-completions $fpath)
fi
