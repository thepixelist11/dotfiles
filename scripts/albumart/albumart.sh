#!/bin/bash

get_metadata() {
    key=$1
    playerctl metadata | grep "$key" | awk '{print $NF}' 2>/dev/null
}

get_player() {
  playerctl metadata | awk 'NR==1 {print $1}'
}

trackid=$(get_metadata "length")
player=$(get_player)
img_dir="/home/ben/scripts/albumart/images"

if [[ "$player" == *"spotube"* ]]; then
    url=$(get_metadata "mpris:artUrl")
    name=$(basename $url)
    img_path_jpg="$img_dir/$name.jpg"
    img_path_png="$img_dir/$name.png"

    if [ ! -f "$img_path_png" ]; then
        curl -o "$img_path_jpg" -s "$url"
        magick "$img_path_jpg" "$img_path_png"
        rm -f "$img_path_jpg"
    fi

    echo "$img_path_png"
else
    echo ""
fi
