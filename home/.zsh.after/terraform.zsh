export PATH=~/.tfenv/bin:$PATH

if [ ! -d ~/.tfenv ] ; then 
  echo "Installing tfenv and terraform"
 git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
 tfenv install
 tfenv use
fi

alias tf=terraform
