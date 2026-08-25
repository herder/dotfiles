#!/usr/bin/env sh
#
# name: Open Obsidian vault
# icon: obsidian
# description: Open the Private Sync vault in Obsidian
# keywords: obsidian vault notes knowledge

set -eu

xdg-open "obsidian://open?vault=Private Sync"
