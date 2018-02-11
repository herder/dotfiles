# From https://www.reddit.com/r/vim/comments/7wj81e/you_can_get_vim_bindings_in_zsh_and_bash/du0ui58/
autoload -U colors && colors
PS1+='${VIMODE}'
#   '$' for normal insert mode
#   a big red 'I' for command mode - to me this is 'NOT insert' because red
function zle-line-init zle-keymap-select {
    INSERT='%F{yellow}i%f%b '
    NORMAL='%F{blue}n%f%b '
    VIMODE="${${KEYMAP/vicmd/$NORMAL}/(main|viins)/$INSERT}"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

bindkey 'jk' vi-cmd-mode
