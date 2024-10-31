#!/bin/bash

START_INDEX=2
SPECIFIC_INDEX=6

COLOR_FILE="$HOME/.cache/wal/colors-rgb"
R="0"
G="0"
B="0"

if [[ -f "$COLOR_FILE" ]]; then
  LENGTH=$(cat "$COLOR_FILE" | wc -l)

  if [[ -z "$SPECIFIC_INDEX" ]]; then
    for i in $(seq "$START_INDEX" "$LENGTH"); do
      COLOR_STRING=$(cat "$COLOR_FILE" | head -n "$i" | tail -n -1)
      R=$(("$R" + $(echo "$COLOR_STRING" | cut -d ',' -f1)))
      G=$(("$G" + $(echo "$COLOR_STRING" | cut -d ',' -f2)))
      B=$(("$B" + $(echo "$COLOR_STRING" | cut -d ',' -f3)))
    done
    R=$(("$R" / "$LENGTH"))
    G=$(("$G" / "$LENGTH"))
    B=$(("$B" / "$LENGTH"))
  else
    COLOR_STRING=$(cat "$COLOR_FILE" | head -n "$SPECIFIC_INDEX" | tail -n -1)
    R=$(echo "$COLOR_STRING" | cut -d ',' -f1)
    G=$(echo "$COLOR_STRING" | cut -d ',' -f2)
    B=$(echo "$COLOR_STRING" | cut -d ',' -f3)
  fi

  echo "$R,$G,$B" | ~/scripts/wallpaper/color-identifier.py
fi
