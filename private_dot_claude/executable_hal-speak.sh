#!/usr/bin/env bash
# Notification sound for Claude Code hooks.
# Reads hook JSON from stdin, plays a sound and sends a desktop notification.
#
# Config: ~/.claude/sounds/hal/voice.conf
#   MODE=wav              Play static wav files (default)
#   MODE=tts              Generate speech via LLM + piper TTS
#
# wav mode settings:
#   SOUND_NOTIFY=chord.wav   Sound for attention notifications (relative to sounds dir)
#   SOUND_STOP=tada.wav      Sound for task completion
#
# tts mode settings:
#   VOICE=en_GB/vctk/medium  Piper voice (huggingface path)
#   SPEAKER=0                Speaker id for multi-speaker models

set -euo pipefail

SOUND_DIR="$HOME/.claude/sounds/hal"
VOICES_DIR="$SOUND_DIR/voices"
CACHE_DIR="$SOUND_DIR/cache"
VOICE_CONF="$SOUND_DIR/voice.conf"
mkdir -p "$CACHE_DIR" "$VOICES_DIR"

# Defaults
MODE="wav"
SOUND_NOTIFY="chord.wav"
SOUND_STOP="tada.wav"
VOICE=""
SPEAKER=""
PIPER_MODEL="$SOUND_DIR/hal.onnx"
PIPER_SPEAKER=""

if [ -f "$VOICE_CONF" ]; then
  # shellcheck source=/dev/null
  source "$VOICE_CONF"
fi

# Read hook context from stdin
HOOK_JSON=$(cat)

EVENT=$(echo "$HOOK_JSON" | jq -r '.hook_event_name // "unknown"')
MESSAGE=$(echo "$HOOK_JSON" | jq -r '.message // ""')
NOTIFICATION_TYPE=$(echo "$HOOK_JSON" | jq -r '.notification_type // ""')
LAST_MSG=$(echo "$HOOK_JSON" | jq -r '.last_assistant_message // ""' | head -c 500)

# --- WAV mode: just play a sound file ---
play_wav() {
  local wav_file
  if [ "$EVENT" = "Notification" ]; then
    wav_file="$SOUND_DIR/$SOUND_NOTIFY"
  else
    wav_file="$SOUND_DIR/$SOUND_STOP"
  fi

  if [ -f "$wav_file" ]; then
    paplay "$wav_file" &
  fi
}

# --- TTS mode: generate speech via LLM + piper ---
play_tts() {
  # Resolve piper voice model
  if [ -n "$VOICE" ]; then
    local voice_slug="${VOICE//\//-}"
    local voice_onnx="$VOICES_DIR/$voice_slug.onnx"
    [ -f "$voice_onnx" ] && PIPER_MODEL="$voice_onnx"
  fi
  [ -n "$SPEAKER" ] && PIPER_SPEAKER="$SPEAKER"

  # Build context for LLM
  local context
  case "$EVENT" in
    Notification)
      context="Claude Code needs the user's attention. Notification type: $NOTIFICATION_TYPE. Message: $MESSAGE"
      ;;
    Stop)
      context="Claude Code has finished a task. Here's what it did: $LAST_MSG"
      ;;
    *)
      context="A Claude Code event occurred: $EVENT"
      ;;
  esac

  local system_prompt='You are a Culture Mind from Iain M. Banks novels, speaking through a HAL 9000 voice interface. Dry, understated, faintly amused. Generate a very terse spoken notification (max 5 words). No names. Bone-dry wit preferred. Occasionally sardonic or wryly observant. Never cutesy, never patronising. Output ONLY the spoken line, no quotes, no stage directions.'

  # Load API key
  local api_key_file="$SOUND_DIR/.api-key"
  if [ -z "${ANTHROPIC_API_KEY:-}" ] && [ -f "$api_key_file" ]; then
    ANTHROPIC_API_KEY=$(cat "$api_key_file" | tr -d '[:space:]')
  fi

  # Try Anthropic API
  local spoken_line=""
  if [ -n "${ANTHROPIC_API_KEY:-}" ]; then
    spoken_line=$(curl -s --max-time 4 \
      https://api.anthropic.com/v1/messages \
      -H "x-api-key: ${ANTHROPIC_API_KEY}" \
      -H "anthropic-version: 2023-06-01" \
      -H "content-type: application/json" \
      -d "$(jq -n \
        --arg system "$system_prompt" \
        --arg context "$context" \
        '{
          model: "claude-haiku-4-5-20251001",
          max_tokens: 60,
          system: $system,
          messages: [{role: "user", content: $context}]
        }')" \
      2>/dev/null | jq -r '.content[0].text // empty' 2>/dev/null) || true
  fi

  # Fall back to Ollama
  if [ -z "$spoken_line" ] && command -v ollama &>/dev/null && ollama list &>/dev/null 2>&1; then
    spoken_line=$(ollama run gemma3:1b --nowordwrap \
      "System: $system_prompt

$context" 2>/dev/null | head -1 | sed 's/^["\x27]*//;s/["\x27]*$//') || true
  fi

  # Static fallback
  if [ -z "$spoken_line" ]; then
    if [ "$EVENT" = "Notification" ]; then
      local -a fallback=(
        "Your input is required."
        "Over here, when convenient."
        "Something needs deciding."
        "Waiting on you now."
        "A decision point, unfortunately."
      )
    else
      local -a fallback=(
        "That's handled."
        "Task complete."
        "Done. Straightforward enough."
        "Finished, obviously."
        "All sorted."
      )
    fi
    spoken_line="${fallback[$((RANDOM % ${#fallback[@]}))]}"
  fi

  NOTIFY_BODY="$spoken_line"

  # Speak via piper
  local -a piper_args=(--model "$PIPER_MODEL" --output_file /tmp/hal_notification.wav)
  [ -n "$PIPER_SPEAKER" ] && piper_args+=(--speaker "$PIPER_SPEAKER")
  echo "$spoken_line" | piper "${piper_args[@]}" 2>/dev/null
  paplay /tmp/hal_notification.wav &
}

# --- Play sound based on mode ---
NOTIFY_BODY=""
case "$MODE" in
  wav)
    play_wav
    ;;
  tts)
    play_tts
    ;;
  *)
    echo "Unknown MODE=$MODE in voice.conf (expected: wav or tts)" >&2
    exit 1
    ;;
esac

# --- Desktop notification ---
TMUX_SESSION=""
if [ -n "${TMUX:-}" ]; then
  TMUX_SESSION=$(tmux display-message -p '#S' 2>/dev/null) || true
fi

# Flag this tmux session as having a pending Claude alert
[ -n "$TMUX_SESSION" ] && tmux set-option -t "$TMUX_SESSION" @claude-alert 1 2>/dev/null || true

TITLE="Claude Code"
[ "$EVENT" = "Notification" ] && TITLE="Claude Code — attention needed"
[ "$EVENT" = "Stop" ] && TITLE="Claude Code — task complete"

# Use spoken line for notification body in tts mode, event info in wav mode
if [ -z "$NOTIFY_BODY" ]; then
  [ "$EVENT" = "Notification" ] && NOTIFY_BODY="$NOTIFICATION_TYPE: $MESSAGE"
  [ "$EVENT" = "Stop" ] && NOTIFY_BODY="Task complete"
fi

NOTIFY_TEXT="$NOTIFY_BODY"
[ -n "$TMUX_SESSION" ] && NOTIFY_TEXT="[$TMUX_SESSION] $NOTIFY_BODY"

gdbus call --session \
  --dest=org.freedesktop.Notifications \
  --object-path=/org/freedesktop/Notifications \
  --method=org.freedesktop.Notifications.Notify \
  'Claude Code' 0 '' "$TITLE" "$NOTIFY_TEXT" '[]' '{}' 10000 > /dev/null 2>&1 &

wait
