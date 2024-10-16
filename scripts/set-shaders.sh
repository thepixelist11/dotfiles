#!/bin/bash

SHADER_CONFIG_FILE="/home/ben/.config/hypr/hyprland/shaders.conf"
SHADER_LIST_DIR="/home/ben/.config/hypr/shaders"
SHADER_NONE_STRING="none"
SHADER_OPTS=$(find "$SHADER_LIST_DIR")
SHADER_OPTS+="""
$SHADER_NONE_STRING"""

SHADER_FILE=$(echo "$SHADER_OPTS" | wofi --show dmenu -i -I -b -a -p " " --conf ~/.config/wofi/wofi.conf --style ~/.config/wofi/style.css)

if [[ "$SHADER_FILE" = "$SHADER_NONE_STRING" ]]; then
  echo """
  # Automatically Generated. Do Not Edit.

  # No shader active.
  """ > "$SHADER_CONFIG_FILE"
else
  echo """
  # Automatically Generated. Do Not Edit.

  decoration {
    screen_shader = $SHADER_FILE
  }
  """ > "$SHADER_CONFIG_FILE"
fi
