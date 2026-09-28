if type fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
  export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --glob '!{.git,Caches,node_modules}/*' 2>/dev/null"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_CTRL_T_OPTS="--select-1 --exit-0"
fi
