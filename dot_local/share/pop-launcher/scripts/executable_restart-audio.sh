#!/usr/bin/env sh
#
# name: Restart audio stack
# icon: audio-card
# description: Restart PipeWire + WirePlumber (fixes the usual PipeWire weirdness)
# keywords: audio pipewire wireplumber restart sound

set -eu

systemctl --user restart wireplumber pipewire pipewire-pulse
