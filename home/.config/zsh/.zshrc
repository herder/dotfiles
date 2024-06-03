# zprof
# zmodload zsh/zprof
#
setopt inc_append_history
setopt share_history
setopt extended_glob

#
# Load any user customizations prior to load
if [ -d $HOME/.zsh.before/ ]; then
  if [ "$(/bin/ls -A $HOME/.zsh.before/)" ]; then
    for config_file ($HOME/.zsh.before/*.zsh) source $config_file
  fi
fi


# Autoload functions you might want to use with antidote.
# ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
# if [[ -d $ZFUNCDIR ]]; then
#   fpath=($ZFUNCDIR $fpath)
#   autoload -Uz $fpath[1]/*(.:t)
# fi

# Source zstyles you might use with antidote.
[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

# Clone antidote if necessary.
[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote

# Create an amazing Zsh config using antidote plugins.
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

# Append a command directly
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh'
'[ -f ~/.zgen/Aloxaf/fzf-tab/fzf-tab.zsh ] && source ~/.zgen/Aloxaf/fzf-tab/fzf-tab.zsh'
)

# If autin is installed, enable it.
if command -v atuin &> /dev/null; then
    # Note: Since zsh-vi-mode lazy-loads keybinds, it will overwrite
    # Some of the keybinds set by atuin. The following creates a 'callback'
    # that loads atuin after zsh-vi-mode has applied all keymaps.
    function my_init() {
        eval "$(atuin init zsh --disable-up-arrow)"
    }
    zvm_after_init_commands+=(my_init)
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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

