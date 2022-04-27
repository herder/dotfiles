#zmodload zsh/zprof

setopt inc_append_history
setopt share_history

#Ensure zgen is present
#
[ -d $HOME/.zgen ] || git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

#Load zgen (https://github.com/tarjoilija/zgen )
source "${HOME}/.zgen/zgen.zsh"

# Create init script if it doesn't exist

if ! zgen saved; then

  zgen prezto editor key-bindings 'vi'
  zgen prezto editor dot-expansion 'yes'
  zgen prezto tmux:auto-start local 'yes'
  zgen prezto '*:*' case-sensitive 'no'
  zgen prezto '*:*' color 'yes'
  zgen prezto ssh-agent forwarding 'yes'

  zgen prezto
  #Zprezto plugins
  #

  zgen prezto utility
  zgen prezto environment

  zgen prezto archive
  zgen prezto command-not-found
  zgen prezto completion
  zgen prezto autosuggestions
  zgen prezto directory
  zgen prezto docker

  zgen prezto editor vi
  zgen prezto emacs
  zgen prezto fasd
  zgen prezto git
  zgen prezto gnu-utility
  zgen prezto gpg
  zgen prezto history
  zgen prezto history-substring-search
  zgen prezto homebrew
  zgen prezto python
  zgen prezto ruby
  zgen prezto spectrum
  zgen prezto ssh
  zgen prezto syntax-highlighting
  zgen prezto terminal
  zgen prezto tmux

  zgen load willghatch/zsh-hooks
  
  zgen load junegunn/fzf shell
  zgen load Aloxaf/fzf-tab plugin
  zgen load johanhaleby/kubetail
  zgen load matthieusb/zsh-sdkman
  zgen load zsh-users/zsh-completions
  zgen load zpm-zsh/clipboard

  zgen oh-my-zsh plugins/node

  zgen save

fi

autoload -Uz add-zsh-hook

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
# Customize to your needs...
# Load any user customizations prior to load
# #
if [ -d $HOME/.zsh.before/ ]; then
  if [ "$(/bin/ls -A $HOME/.zsh.before/)" ]; then
    for config_file ($HOME/.zsh.before/*.zsh) source $config_file
  fi
fi

if [ -d $HOME/.zsh.after/ ]; then
  if [ "$(/bin/ls -A  $HOME/.zsh.after/)" ]; then
    for config_file ($HOME/.zsh.after/*.zsh) source $config_file
  fi
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.zgen/Aloxaf/fzf-tab/fzf-tab.zsh ] && source ~/.zgen/Aloxaf/fzf-tab/fzf-tab.zsh

eval "$(starship init zsh)"
#zprof

compinit -i

autoload -U edit-command-line
zle -N edit-command-line 
bindkey -M vicmd v edit-command-line


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
