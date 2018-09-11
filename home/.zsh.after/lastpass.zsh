
function pwcopy() {
  lpass sync
  local acct=$(lpass ls | fzf | awk '{print $(NF)}' | sed 's/\]//g')
  if [ ! -z $acct ]; then
    lpass show -c --password "$acct"
  fi
}
