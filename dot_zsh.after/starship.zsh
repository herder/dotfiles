# Auto-refresh prompt on idle so cross-terminal changes (e.g. git branch)
# show up without waiting for the next command.
# TMOUT sends SIGALRM after N seconds of idle; TRAPALRM intercepts it
# to redraw the prompt instead of exiting the shell.
TMOUT=5
TRAPALRM() {
  # Only reset prompt if a line editor is active (avoids errors in scripts
  # or during command execution).
  if [[ -o zle ]]; then
    zle reset-prompt
  fi
}
