function pwcopy() {
  lpass sync
  local acct=$(lpass ls --long | fzf | sed -E 's/^.*id: ([0-9]*)\].*/\1/')
  if [ ! -z $acct ]; then
    lpass show -c --password "$acct"
  else
    echo "Aborted"
  fi
}
