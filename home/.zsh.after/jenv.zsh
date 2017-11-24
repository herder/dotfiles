eval "$(jenv init - zsh)"
for i in maven gradle groovy scala lein springboot ; do
  [ -L $HOME/.jenv/plugins/$i ] || jenv enable-plugin $i
done
