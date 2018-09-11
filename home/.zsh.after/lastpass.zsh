
function pwcopy() {
  lpass sync
  local acct=$(lpass ls --long | fzf | awk '{print $(NF-2)}' | sed 's/\]//g')
  if [ ! -z $acct ]; then
    lpass show -c --password "$acct"
  fi
}
