# # Setup fzf
[[ -f ~/.fzf.zsh ]] && . ~/.fzf.zsh

if type fzf >/dev/null 2>&1; then
  FZF_HOME="/usr/share/fzf"
# # ---------
# BREW_HOME=$(brew --prefix)
# if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
#   export PATH="$PATH:$BREW_HOME/opt/fzf/bin"
# fi
#
# # Auto-completion
# # ---------------
[[ $- == *i* ]] && source "$FZF_HOME/completion.zsh" 2> /dev/null
#
# # Key bindings
# # ------------
source "$FZF_HOME/key-bindings.zsh"
#
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --glob '!{.git,Caches,node_modules}/*' 2>/dev/null"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--select-1 --exit-0"
#export FZF_COMPLETION_TRIGGER=''
#
fi
