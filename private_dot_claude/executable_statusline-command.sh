#!/bin/sh
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')

PWD="$cwd" STARSHIP_SHELL="" starship prompt --path "$cwd" 2>/dev/null | sed 's/%{%}//g' | tr -d '\n'
