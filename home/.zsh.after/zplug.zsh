export ZPLUG_HOME=$HOME/.zplug
if [ ! -d $ZPLUG_HOME ] ; then 
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi

source $ZPLUG_HOME/init.zsh
