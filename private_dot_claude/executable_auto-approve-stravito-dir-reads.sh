#!/usr/bin/env bash
# Auto-approve filesystem reads under ~/src/git/github.com/Stravito/.
# Handles Read / Grep / Glob PreToolUse events. Reads payload from stdin;
# emits permissionDecision=allow on match, otherwise exits silently so the
# normal permission flow runs.

set -euo pipefail

input="$(cat)"
tool="$(jq -r '.tool_name // empty' <<<"$input" 2>/dev/null || true)"

[[ -z "$tool" ]] && exit 0

stravito_root="$HOME/src/git/github.com/Stravito"

approve() {
  jq -n '{ hookSpecificOutput: { hookEventName: "PreToolUse", permissionDecision: "allow" } }'
  exit 0
}

# Returns 0 if the given path is under the Stravito root.
under_stravito() {
  local p="$1"
  [[ -z "$p" ]] && return 1
  # Expand leading ~ — Claude usually passes absolute paths, but be defensive.
  [[ "$p" == "~"* ]] && p="${HOME}${p:1}"
  [[ "$p" == "$stravito_root" || "$p" == "$stravito_root"/* ]]
}

case "$tool" in
  Read)
    path="$(jq -r '.tool_input.file_path // empty' <<<"$input")"
    under_stravito "$path" && approve
    ;;
  Grep|Glob)
    # Both default to CWD when path is omitted; only approve when an explicit
    # path scopes the search under the Stravito root.
    path="$(jq -r '.tool_input.path // empty' <<<"$input")"
    under_stravito "$path" && approve
    ;;
esac

exit 0
