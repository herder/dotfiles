#Add all ssh keys under the keys dir to ssh agent

function add_key {
   key=$1
#  echo "Add file $1"
   ssh-add -l |grep -q `ssh-keygen -lf $key  | awk '{print $2}'` || ssh-add -K "$key"
}

for i in `gfind ~/.ssh/keys -type f | egrep -v '.pub$'` ; do add_key "$i" ; done


