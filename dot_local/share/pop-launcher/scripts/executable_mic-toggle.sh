#!/usr/bin/env sh
#
# name: Toggle microphone mute
# icon: audio-input-microphone
# description: Mute/unmute the default input source
# keywords: mic mute unmute microphone

set -eu

pactl set-source-mute @DEFAULT_SOURCE@ toggle
