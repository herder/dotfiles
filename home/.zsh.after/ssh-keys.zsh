#Add all ssh keys under the keys dir to ssh agent

function add_key {
#  echo "Add file $1"
  ssh-add -K "$1"
}

for i in `gfind ~/.ssh/keys -type f | egrep -v '.pub$'` ; do add_key "$i" ; done


