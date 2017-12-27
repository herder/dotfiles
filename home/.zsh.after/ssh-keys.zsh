#Add all ssh keys under the keys dir to ssh agent
which gfind && gfind ~/.ssh/keys -type f -regex '.*sa$\|.*\.pem$' -exec ssh-add -K {} \;
