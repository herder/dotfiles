eval "`pip3 completion --zsh`"

compctl -K _pip_completion pip3
compctl -K _pip_completion pip
