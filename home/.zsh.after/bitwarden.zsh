if type bw >/dev/null ; then
  bwcopy() {
    if hash bw 2>/dev/null; then
      if ! (( ${+BW_SESSION} )); then 
        eval $(bw unlock | grep export | cut -d ' ' -f 2-)
      fi
      bw get item "$(bw list items | jq '.[] | "\(.name) | username: \(.login.username) | id: \(.id)" ' | fzf-tmux | awk '{print $(NF -0)}' | sed 's/\"//g')" | jq '.login.password' | sed 's/\"//g' | xclip -sel clip
    fi
  }

if ! [ -f ~/.zfunc/_bw ] ; then
  echo "Creating autocomplete file for bw"
  eval $(bw completion --shell zsh | tee ~/.zfunc/_bw)
fi

compdef _bw bw
fi
