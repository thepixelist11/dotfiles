#!/bin/bash

find ~/wallpaper -type f \( -iname '*.jpg' -o -iname '*.jpeg' \) -exec sh -c 'for img; do magick "$img" "${img}.png" && rm "$img"; done' sh {} +
if [[ "$1" = "true" ]]; then
  find ~/wallpaper/animated -type f \( -iname '*.mp4' \) -exec sh -c 'for img; do magick -delay 1 -loop 0 "$img" "${img}.gif" && rm "$img"; done' sh {} +
fi
