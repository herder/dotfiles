# zprof
# zmodload zsh/zprof

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

# Append a command directly
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh'
'[ -f ~/.zgen/Aloxaf/fzf-tab/fzf-tab.zsh ] && source ~/.zgen/Aloxaf/fzf-tab/fzf-tab.zsh'
)

# History settings - stolen from Zprezto
#
HISTFILE="${HISTFILE:-${ZDOTDIR:-$HOME}/.zsh_history}"
HISTSIZE=10000
SAVEHIST=$HISTSIZE

setopt BANG_HIST              # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt HIST_VERIFY            # Do not execute immediately upon history expansion.
setopt HIST_BEEP              # Beep when accessing non-existent history.

# oh-my-zsh
#

if [ ! -d ~/.oh-my-zsh ]; then
 git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi

ZSH_TMUX_AUTOSTART=true

plugins=(
  aws
  command-not-found
  gh
  gradle
  helm
  httpie
  kind
  docker
  kubectl
  kubectx
  mvn
  postgres
  pyenv
  ripgrep
  snap
  spring
  starship
  systemd
  sdk
  skaffold
  tig
  terraform
  tmux
  vi-mode
  zoxide
)

zstyle ':omz:update' mode auto

source ~/.oh-my-zsh/oh-my-zsh.sh
# Create init script if it doesn't exist

if ! zgen saved; then

  # zgen prezto editor key-bindings 'vi'
  # zgen prezto editor dot-expansion 'yes'
  # zgen prezto tmux:auto-start local 'yes'
  # zgen prezto '*:*' case-sensitive 'no'
  # zgen prezto '*:*' color 'yes'
  # zgen prezto ssh-agent forwarding 'yes'

  # zgen prezto
  #Zprezto plugins
  #

  # zgen prezto environment
  # zgen prezto utility


  # zgen prezto archive
  # zgen prezto command-not-found
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
  # zgen prezto ssh
  # zgen prezto syntax-highlighting
  # zgen prezto terminal
  # zgen prezto tmux
  # zgen prezto Aloxaf/fzf-tab plugin

  # zgen load willghatch/zsh-hooks
  
  zgen load jeffreytse/zsh-vi-mode

  zgen load junegunn/fzf shell
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions
  zgen load zpm-zsh/clipboard

  # zgen oh-my-zsh plugins/node


  # https://github.com/so-fancy/diff-so-fancy/blob/master/pro-tips.md#zsh-plugin-providing-diff-so-fancy
  # zgen load zdharma-continuum/zsh-diff-so-fancy
  zgen save

fi


# autoload -Uz add-zsh-hook
# autoload -U edit-command-line
# zle -N edit-command-line 

# ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
#
ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_NEX


export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

if [ -d $HOME/.zsh.after/ ]; then
  if [ "$(/bin/ls -A  $HOME/.zsh.after/)" ]; then
    for file in $HOME/.zsh.after/*.zsh; do 
      source $file; 
    done
  fi
fi
# TODO: this does not work when sourcing from ~/.zsh.after/*.zsh - why is that?

# complete -C $(which aws_completer) aws

complete -o nospace -C $HOME/.tfenv/versions/$(tfenv version-name)/terraform terraform
compdef tf=terraform

# compinit
# autoload -U +X bashcompinit && bashcompinit

# eval "$(starship init zsh)"

# Make yanking in zsh-vim-mode use system clipboard:
# https://github.com/jeffreytse/zsh-vi-mode/issues/19#issuecomment-1268057812
#
my_zvm_vi_yank() {
  zvm_vi_yank
  echo -en "${CUTBUFFER}" | cbread
}

my_zvm_vi_delete() {
  zvm_vi_delete
  echo -en "${CUTBUFFER}" | cbread
}

my_zvm_vi_change() {
  zvm_vi_change
  echo -en "${CUTBUFFER}" | cbread
}

my_zvm_vi_change_eol() {
  zvm_vi_change_eol
  echo -en "${CUTBUFFER}" | cbread
}

my_zvm_vi_put_after() {
  CUTBUFFER=$(cbprint)
  zvm_vi_put_after
  zvm_highlight clear # zvm_vi_put_after introduces weird highlighting for me
}

my_zvm_vi_put_before() {
  CUTBUFFER=$(cbprint)
  zvm_vi_put_before
  zvm_highlight clear # zvm_vi_put_before introduces weird highlighting for me
}

zvm_after_lazy_keybindings() {
  zvm_define_widget my_zvm_vi_yank
  zvm_define_widget my_zvm_vi_delete
  zvm_define_widget my_zvm_vi_change
  zvm_define_widget my_zvm_vi_change_eol
  zvm_define_widget my_zvm_vi_put_after
  zvm_define_widget my_zvm_vi_put_before

  zvm_bindkey visual 'y' my_zvm_vi_yank
  zvm_bindkey visual 'd' my_zvm_vi_delete
  zvm_bindkey visual 'x' my_zvm_vi_delete
  zvm_bindkey vicmd  'C' my_zvm_vi_change_eol
  zvm_bindkey visual 'c' my_zvm_vi_change
  zvm_bindkey vicmd  'p' my_zvm_vi_put_after
  zvm_bindkey vicmd  'P' my_zvm_vi_put_before
}

if [[ $(uname) = "Darwin" ]]; then
  on_mac_os=0
else
  on_mac_os=1
fi

cbread() {
  if [[ $on_mac_os -eq 0 ]]; then
    pbcopy
  else
    xclip -selection primary -i -f | xclip -selection secondary -i -f | xclip -selection clipboard -i
  fi
}

cbprint() {
  if [[ $on_mac_os -eq 0 ]]; then
    pbpaste
  else
    if   x=$(xclip -o -selection clipboard 2> /dev/null); then
      echo -n $x
    elif x=$(xclip -o -selection primary   2> /dev/null); then
      echo -n $x
    elif x=$(xclip -o -selection secondary 2> /dev/null); then
      echo -n $x
    fi
  fi
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

