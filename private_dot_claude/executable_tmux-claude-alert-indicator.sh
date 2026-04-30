#!/usr/bin/env bash
# tmux status-bar indicator for pending Claude Code alerts.
# Outputs a styled pill (matching catppuccin/Kanagawa pill style) if any
# tmux session has @claude-alert=1, otherwise nothing.
#
# The @claude-alert flag is set by ~/.claude/hal-speak.sh on Notification/Stop
# hooks, and cleared by prefix+c (tmux-claude-alert.sh) or by switching into
# the alerting session (client-session-changed hook in tmux.conf).
set -euo pipefail

count=0
for session in $(tmux list-sessions -F '#S' 2>/dev/null); do
  val=$(tmux show-option -t "$session" -v @claude-alert 2>/dev/null) || true
  [ "$val" = "1" ] && count=$((count + 1))
done

[ "$count" -eq 0 ] && exit 0

printf '#[fg=#{@thm_surface_0},bg=default]█#[fg=#{@thm_red},bg=#{@thm_surface_0}] 󰂚 #[fg=#{@thm_fg},bg=#{@thm_surface_0}]%d #[fg=#{@thm_surface_0},bg=default]█ ' "$count"
