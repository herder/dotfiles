# zmodload zsh/zprof
# zprof

autoload -U compinit && compinit

setopt inc_append_history
setopt share_history

# Customize to your needs...
# Load any user customizations prior to load
# #
if [ -d $HOME/.zsh.before/ ]; then
  if [ "$(/bin/ls -A $HOME/.zsh.before/)" ]; then
    for config_file ($HOME/.zsh.before/*.zsh) source $config_file
  fi
fi

# https://github.com/jeffreytse/zsh-vi-mode#configuration-function 

function zvm_config() {
	ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
}

#Ensure zgen is present
#
[ -d $HOME/.zgen ] || git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"


#Load zgen (https://github.com/tarjoilija/zgen )
source "${HOME}/.zgen/zgen.zsh"

# Create init script if it doesn't exist

if ! zgen saved; then

  zgen prezto editor key-bindings 'vi'
  # zgen prezto editor dot-expansion 'yes'
  zgen prezto tmux:auto-start local 'yes'
  # zgen prezto '*:*' case-sensitive 'no'
  # zgen prezto '*:*' color 'yes'
  zgen prezto ssh-agent forwarding 'yes'

  zgen prezto
  #Zprezto plugins
  #

  zgen prezto environment

  # zgen prezto utility

  # zgen prezto archive
  zgen prezto command-not-found
  # zgen prezto docker

  # zgen prezto editor vi
  # zgen prezto emacs
  # zgen prezto git
  # zgen prezto gnu-utility
  # zgen prezto gpg
  # zgen prezto history
  # zgen prezto history-substring-search
  # zgen prezto homebrew
  # zgen prezto python
  # zgen prezto ruby
  # zgen prezto spectrum
  zgen prezto ssh
  # zgen prezto syntax-highlighting
  # zgen prezto terminal
  zgen prezto tmux
  # zgen prezto Aloxaf/fzf-tab plugin

  # zgen load willghatch/zsh-hooks
  
  zgen load junegunn/fzf shell
  # zgen load johanhaleby/kubetail
  zgen load matthieusb/zsh-sdkman
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions
  zgen load zpm-zsh/clipboard

  # zgen oh-my-zsh plugins/node

  # https://github.com/so-fancy/diff-so-fancy/blob/master/pro-tips.md#zsh-plugin-providing-diff-so-fancy
  zgen load zdharma-continuum/zsh-diff-so-fancy

  zgen load jeffreytse/zsh-vi-mode
  zgen save

fi

# autoload -Uz add-zsh-hook
autoload -U edit-command-line
zle -N edit-command-line 

# ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE
# Append a command directly
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh'
'[ -f ~/.zgen/Aloxaf/fzf-tab/fzf-tab.zsh ] && source ~/.zgen/Aloxaf/fzf-tab/fzf-tab.zsh'
)


export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.zgen/Aloxaf/fzf-tab/fzf-tab.zsh ] && source ~/.zgen/Aloxaf/fzf-tab/fzf-tab.zsh


# compinit
# bashcompinit



if [ -d $HOME/.zsh.after/ ]; then
  if [ "$(/bin/ls -A  $HOME/.zsh.after/)" ]; then
    for file in $HOME/.zsh.after/*.zsh; do 
      source $file; 
    done
  fi
fi

# TODO: this does not work when sourcing from ~/.zsh.after/*.zsh - why is that?
complete -C $(which aws_completer) aws

complete -o nospace -C $HOME/.tfenv/versions/$(tfenv version-name)/terraform terraform
compdef tf=terraform

compinit
autoload -U +X bashcompinit && bashcompinit

KEYTIMEOUT=1
eval "$(starship init zsh)"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

