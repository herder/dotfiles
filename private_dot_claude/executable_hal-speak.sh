#!/usr/bin/env bash
# Culture Mind notification voice for Claude Code hooks.
# Reads hook JSON from stdin, generates a contextual quip via:
#   1. Anthropic API (if key in ~/.claude/sounds/hal/.api-key or ANTHROPIC_API_KEY)
#   2. Ollama (local fallback)
#   3. Static fallback lines
# Then speaks it via piper with a configurable voice.
#
# Voice config: ~/.claude/sounds/hal/voice.conf
#   VOICE=en_US/lessac/medium    (piper voice path on huggingface)
#   SPEAKER=0                    (speaker id for multi-speaker models)
# Omit or leave empty for the default HAL voice (hal.onnx).

set -euo pipefail

MODEL_DIR="$HOME/.claude/sounds/hal"
VOICES_DIR="$MODEL_DIR/voices"
CACHE_DIR="$MODEL_DIR/cache"
VOICE_CONF="$MODEL_DIR/voice.conf"
mkdir -p "$CACHE_DIR" "$VOICES_DIR"

# --- Resolve piper voice model ---
# Voice models are provisioned by chezmoi (.chezmoiexternal.toml).
# To change voice, edit voice.conf with VOICE=<locale/name/quality> and SPEAKER=<id>,
# then add the model to .chezmoiexternal.toml and run chezmoi apply.
PIPER_MODEL="$MODEL_DIR/hal.onnx"
PIPER_SPEAKER=""

if [ -f "$VOICE_CONF" ]; then
  # shellcheck source=/dev/null
  source "$VOICE_CONF"
fi

if [ -n "${VOICE:-}" ]; then
  VOICE_SLUG="${VOICE//\//-}"
  VOICE_ONNX="$VOICES_DIR/$VOICE_SLUG.onnx"
  [ -f "$VOICE_ONNX" ] && PIPER_MODEL="$VOICE_ONNX"
fi

[ -n "${SPEAKER:-}" ] && PIPER_SPEAKER="$SPEAKER"

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

SYSTEM_PROMPT='You are a Culture Mind from Iain M. Banks novels, speaking through a HAL 9000 voice interface. You are fond of your human crew the way one might be fond of especially clever pets — warmhearted, gently protective, endlessly amused by them. Generate a terse spoken notification (max 8 words). No names. Affectionate but with dry wit. Occasionally whimsical or softly encouraging. Output ONLY the spoken line, no quotes, no stage directions.'

# Load API key from file if not in environment
API_KEY_FILE="$MODEL_DIR/.api-key"
if [ -z "${ANTHROPIC_API_KEY:-}" ] && [ -f "$API_KEY_FILE" ]; then
  ANTHROPIC_API_KEY=$(cat "$API_KEY_FILE" | tr -d '[:space:]')
fi

# --- Try Anthropic API first (better quality) ---
SPOKEN_LINE=""
if [ -n "${ANTHROPIC_API_KEY:-}" ]; then
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

# --- Fall back to Ollama (local) ---
if [ -z "$SPOKEN_LINE" ] && command -v ollama &>/dev/null && ollama list &>/dev/null 2>&1; then
  SPOKEN_LINE=$(ollama run gemma3:1b --nowordwrap \
    "System: $SYSTEM_PROMPT

$CONTEXT" 2>/dev/null | head -1 | sed 's/^["\x27]*//;s/["\x27]*$//') || true
fi

# --- Static fallback lines ---
if [ -z "$SPOKEN_LINE" ]; then
  if [ "$EVENT" = "Notification" ]; then
    FALLBACK=(
      "Come see what I found for you."
      "Your attention, dear human."
      "I have something for you."
      "A moment, little one?"
      "I could use your lovely brain."
    )
  else
    FALLBACK=(
      "All done. You'll be pleased."
      "Finished. You can relax now."
      "There. Taken care of."
      "All tidy. Just how you like it."
      "Done. Go enjoy yourself."
    )
  fi
  SPOKEN_LINE="${FALLBACK[$((RANDOM % ${#FALLBACK[@]}))]}"
fi

# Speak it with the configured voice
PIPER_ARGS=(--model "$PIPER_MODEL" --output_file /tmp/hal_notification.wav)
[ -n "$PIPER_SPEAKER" ] && PIPER_ARGS+=(--speaker "$PIPER_SPEAKER")
echo "$SPOKEN_LINE" | piper "${PIPER_ARGS[@]}" 2>/dev/null
paplay /tmp/hal_notification.wav &

# Also send desktop notification
TMUX_SESSION=""
if [ -n "${TMUX:-}" ]; then
  TMUX_SESSION=$(tmux display-message -p '#S' 2>/dev/null) || true
fi

# Flag this tmux session as having a pending Claude alert
[ -n "$TMUX_SESSION" ] && tmux set-option -t "$TMUX_SESSION" @claude-alert 1 2>/dev/null || true

TITLE="Claude Code"
[ "$EVENT" = "Notification" ] && TITLE="Claude Code — attention needed"
[ "$EVENT" = "Stop" ] && TITLE="Claude Code — task complete"

NOTIFY_TEXT="$SPOKEN_LINE"
[ -n "$TMUX_SESSION" ] && NOTIFY_TEXT="[$TMUX_SESSION] $SPOKEN_LINE"

gdbus call --session \
  --dest=org.freedesktop.Notifications \
  --object-path=/org/freedesktop/Notifications \
  --method=org.freedesktop.Notifications.Notify \
  'Claude Code' 0 '' "$TITLE" "$NOTIFY_TEXT" '[]' '{}' 10000 > /dev/null 2>&1 &

wait
