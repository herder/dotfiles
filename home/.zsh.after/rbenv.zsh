if [ ! -d ~/.rbenv/ ] ; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
fi

eval "$(~/.rbenv/bin/rbenv init - zsh)"

for i in ruby-build rbenv-gem-rehash; do 
  if [ ! -d "$(rbenv root)/plugins/$i" ] ; then 
    echo "Installing $i for rbenv..."
    git clone https://github.com/rbenv/$i.git "$(rbenv root)"/plugins/$i
  fi
done
