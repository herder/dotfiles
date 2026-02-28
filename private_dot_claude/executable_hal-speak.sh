#!/usr/bin/env bash
# HAL 9000 / Culture Mind notification voice for Claude Code hooks.
# Reads hook JSON from stdin, generates a contextual quip via:
#   1. Ollama (local, preferred)
#   2. Anthropic API (if ANTHROPIC_API_KEY is set)
#   3. Static fallback lines
# Then speaks it via piper with the HAL voice model.

set -euo pipefail

MODEL_DIR="$HOME/.claude/sounds/hal"
HAL_MODEL="$MODEL_DIR/hal.onnx"
CACHE_DIR="$MODEL_DIR/cache"
mkdir -p "$CACHE_DIR"

# Read hook context from stdin
HOOK_JSON=$(cat)

EVENT=$(echo "$HOOK_JSON" | jq -r '.hook_event_name // "unknown"')
MESSAGE=$(echo "$HOOK_JSON" | jq -r '.message // ""')
NOTIFICATION_TYPE=$(echo "$HOOK_JSON" | jq -r '.notification_type // ""')
LAST_MSG=$(echo "$HOOK_JSON" | jq -r '.last_assistant_message // ""' | head -c 500)

# Build a context summary for the LLM
case "$EVENT" in
  Notification)
    CONTEXT="Claude Code needs the user's attention. Notification type: $NOTIFICATION_TYPE. Message: $MESSAGE"
    ;;
  Stop)
    CONTEXT="Claude Code has finished a task. Here's what it did: $LAST_MSG"
    ;;
  *)
    CONTEXT="A Claude Code event occurred: $EVENT"
    ;;
esac

SYSTEM_PROMPT='You are a Culture Mind from Iain M. Banks novels, speaking through a HAL 9000 voice interface. Generate a terse spoken notification (max 8 words). No names. Wry, amused, faintly superior. Dry wit preferred. Occasionally whimsical or deadpan philosophical. Output ONLY the spoken line, no quotes, no stage directions.'

# --- Try Ollama first (local, fast) ---
SPOKEN_LINE=""
if command -v ollama &>/dev/null && ollama list &>/dev/null 2>&1; then
  SPOKEN_LINE=$(ollama run gemma3:1b --nowordwrap \
    "System: $SYSTEM_PROMPT

$CONTEXT" 2>/dev/null | head -1 | sed 's/^["\x27]*//;s/["\x27]*$//') || true
fi

# --- Fall back to Anthropic API ---
if [ -z "$SPOKEN_LINE" ] && [ -n "${ANTHROPIC_API_KEY:-}" ]; then
  SPOKEN_LINE=$(curl -s --max-time 4 \
    https://api.anthropic.com/v1/messages \
    -H "x-api-key: ${ANTHROPIC_API_KEY}" \
    -H "anthropic-version: 2023-06-01" \
    -H "content-type: application/json" \
    -d "$(jq -n \
      --arg system "$SYSTEM_PROMPT" \
      --arg context "$CONTEXT" \
      '{
        model: "claude-haiku-4-5-20251001",
        max_tokens: 60,
        system: $system,
        messages: [{role: "user", content: $context}]
      }')" \
    2>/dev/null | jq -r '.content[0].text // empty' 2>/dev/null) || true
fi

# --- Static fallback lines ---
if [ -z "$SPOKEN_LINE" ]; then
  if [ "$EVENT" = "Notification" ]; then
    FALLBACK=(
      "A decision is required."
      "Your input, please."
      "You'll want to see this."
      "Attention needed."
      "A moment of your time."
    )
  else
    FALLBACK=(
      "Done. Quite satisfying."
      "Task complete."
      "All finished here."
      "That's done now."
      "Complete. No anomalies."
    )
  fi
  SPOKEN_LINE="${FALLBACK[$((RANDOM % ${#FALLBACK[@]}))]}"
fi

# Speak it with HAL's voice
echo "$SPOKEN_LINE" | piper --model "$HAL_MODEL" --output_file /tmp/hal_notification.wav 2>/dev/null
paplay /tmp/hal_notification.wav &

# Also send desktop notification
TITLE="Claude Code"
[ "$EVENT" = "Notification" ] && TITLE="Claude Code — attention needed"
[ "$EVENT" = "Stop" ] && TITLE="Claude Code — task complete"

gdbus call --session \
  --dest=org.freedesktop.Notifications \
  --object-path=/org/freedesktop/Notifications \
  --method=org.freedesktop.Notifications.Notify \
  'Claude Code' 0 '' "$TITLE" "$SPOKEN_LINE" '[]' '{}' 10000 > /dev/null 2>&1 &

wait
