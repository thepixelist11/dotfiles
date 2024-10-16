#!/bin/bash

get_player() {
  playerctl metadata | awk 'NR==1 {print $1}'
}

player_name=$(playerctl metadata --format '{{playerName}}')
player_status=$(playerctl status)

if [[ "$player_name" == "spotube" ]]; then
  song_info=$(playerctl metadata --format '{{title}}   󰓇   {{artist}}')
elif [[ "$player_name" == "firefox" ]]; then
  song_info=$(playerctl metadata --format '{{title}}   󰈹   {{artist}}')
elif [[ "$player_name" == "mpd" ]]; then
  song_info=$(playerctl metadata --format '{{title}}   󰎆   {{artist}}')
elif [[ "$player_name" == "chromium" ]]; then
  song_info=$(playerctl metadata --format '{{title}}   󰊯   {{artist}}')
fi

echo "$song_info"
