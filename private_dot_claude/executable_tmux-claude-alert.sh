#!/usr/bin/env bash
# Jump to tmux sessions with pending Claude Code alerts.
# Bound to prefix + c in tmux.conf.
set -euo pipefail

# Collect sessions where @claude-alert is "1"
alerting=()
for session in $(tmux list-sessions -F '#S' 2>/dev/null); do
  val=$(tmux show-option -t "$session" -v @claude-alert 2>/dev/null) || true
  [ "$val" = "1" ] && alerting+=("$session")
done

case ${#alerting[@]} in
  0)
    tmux display-message "No Claude alerts"
    ;;
  1)
    tmux set-option -t "${alerting[0]}" -u @claude-alert
    tmux switch-client -t "${alerting[0]}"
    ;;
  *)
    # Build a tmux display-menu with one entry per alerting session
    menu_args=()
    for session in "${alerting[@]}"; do
      menu_args+=("$session" "" "run-shell 'tmux set-option -t \"$session\" -u @claude-alert; tmux switch-client -t \"$session\"'")
    done
    tmux display-menu -T "Claude Alerts" "${menu_args[@]}"
    ;;
esac
