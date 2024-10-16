#!/bin/bash

killall hyprpaper
hyprpaper &
sleep 1

default_directory="/home/ben/wallpaper"
monitors=$(hyprctl monitors | grep Monitor | awk '{print $2}')
input_path="$1"

if [ -n "$input_path" ]; then
  if [ -f "$input_path" ]; then
    background="$input_path"
  elif [ -d "$input_path" ]; then
    background=$(ls "$input_path"/*.png | shuf -n 1)
  else
    echo "The specified path is neither a file nor a directory."
    exit 1
  fi
else
  if [ -d "$default_directory" ]; then
    background=$(ls "$default_directory"/*.png | shuf -n 1)
  else
    echo "Default directory $default_directory does not exist."
    exit 1
  fi
fi

if [ ! -z "$(ps -e | grep waypaper)" ]; then
  swww img "$background"
  # This was for Hyprpaper
  # hyprctl hyprpaper unload all
  # hyprctl hyprpaper preload "$background"
  # for monitor in $monitors; do
  #   hyprctl hyprpaper wallpaper "$monitor, $background"
  # done
fi

wal -i "$background"

echo "$background" > "/home/ben/scripts/wallpaper/last_wallpaper"

wpg_files=$(wpg -l)
for file in $wpg_files; do
  wpg -d $file
done
wpg -a "$background"
wpg -s "$(wpg -l)"

cp ~/.cache/wal/colors-hyprland ~/.config/hypr/hyprland/colors.conf
pywal-discord -p ~/.config/WebCord/Themes

~/scripts/wallpaper/updateWofi.sh
~/scripts/wallpaper/updateStarship.sh
~/scripts/wallpaper/updateHyprlock.sh

swaync-client -R
swaync-client -rs

pywalfox update
