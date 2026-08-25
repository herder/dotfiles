#!/usr/bin/env sh
#
# name: Empty trash
# icon: user-trash
# description: Permanently delete everything in the trash
# keywords: trash empty delete bin

set -eu

gio trash --empty
