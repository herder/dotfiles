if type bw >/dev/null ; then

  unlock_bw() {
    eval $(bw unlock | grep export | cut -d ' ' -f 2-)
  }

bwcopy() {
  if hash bw 2>/dev/null; then
    if ! (( ${+BW_SESSION} )); then 
      unlock_bw
    fi
    bw get item "$(bw list items | jq '.[] | "\(.name) | username: \(.login.username) | id: \(.id)" ' | fzf-tmux | awk '{print $(NF -0)}' | sed 's/\"//g')" | jq '.login.password' | sed 's/\"//g' | xclip -sel clip
  fi
}

bwssh() {
  if hash bw 2>/dev/null; then
    if ! (( ${+BW_SESSION} )); then 
      unlock_bw
    fi
    bw get item "$(bw list items --folderid 3adf97b7-4f1f-40ad-b025-ac5b009a00df | jq '.[] | "\(.name) | notes: \(.notes) | id: \(.id)" ' | fzf-tmux | awk '{print $(NF -0)}' | sed 's/\"//g')" | jq '.fields[] | select(.name=="Passphrase") | .value' | sed 's/\"//g' | xclip -sel clip
  fi
}

if ! [ -f ~/.zfunc/_bw ] ; then
  echo "Creating autocomplete file for bw"
  eval $(bw completion --shell zsh | tee ~/.zfunc/_bw)
fi

compdef _bw bw
fi
