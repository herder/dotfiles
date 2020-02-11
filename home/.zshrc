# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#Ensure zgen is present
#
[ -d $HOME/.zgen ] || git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

#Load zgen (https://github.com/tarjoilija/zgen )
source "${HOME}/.zgen/zgen.zsh"

# Create init script if it doesn't exist

if ! zgen saved; then
  zgen load romkatv/powerlevel10k powerlevel10k

  zgen prezto editor key-bindings 'vi'
  zgen prezto editor dot-expansion 'yes'
  zgen prezto tmux:auto-start local 'yes'
  zgen prezto '*:*' case-sensitive 'no'
  zgen prezto '*:*' color 'yes'
  zgen prezto ssh-agent forwarding 'yes'

  zgen prezto
  #Zprezto plugins
  #

  zgen prezto environment

  zgen prezto archive
  zgen prezto autosuggestions
  zgen prezto command-not-found
  zgen prezto completion
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
  zgen prezto utility

  zgen load willghatch/zsh-hooks
  
  zgen load zsh-users/zsh-syntax-highlighting.git
  zgen load zsh-users/zsh-history-substring-search.git
  zgen load tarruda/zsh-autosuggestions.git

  zgen load junegunn/fzf shell

  zgen save

fi

autoload -Uz add-zsh-hook

# Customize to your needs...
# Load any user customizations prior to load
# #
if [ -d $HOME/.zsh.before/ ]; then
  if [ "$(ls -A $HOME/.zsh.before/)" ]; then
    for config_file ($HOME/.zsh.before/*.zsh) source $config_file
  fi
fi


if [ -d $HOME/.zsh.after/ ]; then
  if [ "$(ls -A $HOME/.zsh.after/)" ]; then
    for config_file ($HOME/.zsh.after/*.zsh) source $config_file
  fi
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k]} )) || p10k finalize
