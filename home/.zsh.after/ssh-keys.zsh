#Add all ssh keys under the keys dir to ssh agent
for i in `gfind ~/.ssh/keys -type f | egrep -v '.pub$'` ; do ssh-add -K $i ; done
