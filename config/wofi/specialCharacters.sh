#!/bin/bash

CHAR_FILE="$HOME/.config/wofi/characters"

CHOICE=$(cat "$CHAR_FILE" | wofi --dmenu -p "Select Character" -I -i -b -a --width 400 --height 300 --style $HOME/.config/wofi/style.css --conf ~/.config/wofi/wofi.conf)
CHAR=$(echo "$CHOICE" | awk '{print $1}')

echo -n "$CHAR" | wl-copy

wtype "$CHAR"
