#!/bin/bash

killall hyprpaper
hyprpaper &
sleep 1

default_directory="/home/ben/wallpaper"
monitors=$(hyprctl monitors | grep Monitor | awk '{print $2}')
input_path="$1"

# setup
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

ext="${background##*.}"

killall mpvpaper

# set the background
# if [ ! -z "$(ps -e | grep waypaper)" ]; then
  if [[ "$ext" = "mp4" ]]; then
    mpv_args="--no-audio --loop --vf=cropdetect"
    hyprctl monitors | grep -oP '(?<=Monitor )\S+' | while read -r monitor; do
      mpvpaper -vs -o "$mpv_args" "$monitor" "$background" &
    done
    ffmpeg -y -i "$background" -vf "select=eq(n\,0)" -q:v 3 /tmp/bg.png
    background="/tmp/bg.png"
  else
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "$background"
    for monitor in $monitors; do
      hyprctl hyprpaper wallpaper "$monitor, $background"
    done
  fi
# fi

wal -i "$background"

echo "$background" > "/home/ben/scripts/wallpaper/last_wallpaper"

# wpg
wpg_files=$(wpg -l)
for file in $wpg_files; do
  wpg -d $file
done
wpg -a "$background"
wpg -s "$(wpg -l)"

# hyprland and discord
cp ~/.cache/wal/colors-hyprland ~/.config/hypr/hyprland/colors.conf
pywal-discord -p ~/.config/WebCord/Themes

# various update scripts
~/scripts/wallpaper/updateWofi.sh
~/scripts/wallpaper/updateStarship.sh
~/scripts/wallpaper/updateHyprlock.sh

# ckb-next
ckb-next --mode "$(~/scripts/wallpaper/getGeneralColor.sh)"

# update mouse
~/scripts/change-mouse-rgb.sh $(cat ~/.cache/wal/colors | head -n 6 | tail -n -1 | cut -d '#' -f2)

# kvantum
cp -f ~/.cache/wal/pywal.kvconfig ~/.config/Kvantum/pywal/pywal.kvconfig
cp -f ~/.cache/wal/pywal.svg ~/.config/Kvantum/pywal/pywal.svg

# reset swaync
swaync-client -R
swaync-client -rs

# pywalfox
pywalfox update
