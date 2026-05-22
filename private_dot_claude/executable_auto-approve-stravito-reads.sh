#!/usr/bin/env bash
# Auto-approve read-only gh / GitHub-API calls scoped to the Stravito org.
# Reads PreToolUse hook payload from stdin; emits permissionDecision=allow on
# match, otherwise exits silently so the normal permission flow runs.

set -euo pipefail

input="$(cat)"
command="$(jq -r '.tool_input.command // empty' <<<"$input" 2>/dev/null || true)"

[[ -z "$command" ]] && exit 0

approve() {
  jq -n '{ hookSpecificOutput: { hookEventName: "PreToolUse", permissionDecision: "allow" } }'
  exit 0
}

read_verbs='view|list|diff|status|log|logs|download|checks'
read_nouns='pr|issue|run|release|workflow|repo|search|browse|cache'

# gh <noun> <read-verb> ... with --repo Stravito/... OR repos/Stravito/... in the args
if echo "$command" | grep -qE "gh (${read_nouns}) (${read_verbs})\b"; then
  if echo "$command" | grep -qE -- '(--repo[= ]+Stravito/|\bStravito/)'; then
    approve
  fi
fi

# gh api reads against repos/Stravito or orgs/Stravito, only if no write method
if echo "$command" | grep -qE 'gh api[^|;&]*\b(repos|orgs)/Stravito\b'; then
  if ! echo "$command" | grep -qE -- '-X +(POST|PUT|PATCH|DELETE)|--method +(POST|PUT|PATCH|DELETE)'; then
    approve
  fi
fi

# curl GETs against api.github.com paths under Stravito
if echo "$command" | grep -qE 'curl[^|;&]*api\.github\.com/(repos|orgs)/Stravito\b'; then
  if ! echo "$command" | grep -qE -- '-X +(POST|PUT|PATCH|DELETE)|--data|-d +'; then
    approve
  fi
fi

exit 0
