export PATH=~/.tfenv/bin:$PATH

if [ ! -d ~/.tfenv ] ; then 
  echo "Installing tfenv and terraform"
 git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
 tfenv install
 tfenv use
fi

complete -o nospace -C $HOME/.tfenv/versions/$(tfenv version-name)/terraform terraform
alias tf=terraform
