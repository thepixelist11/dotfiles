#!/bin/bash

# Utility

min() {
  local array=("$@")
  local min=${array[0]}
  for i in "${array[@]}"; do
    if ((i < min)); then
      min=$i
    fi
  done
  echo $min
}

max() {
  local array=("$@")
  local max=${array[0]}
  for i in "${array[@]}"; do
    if ((i > max)); then
      max=$i
    fi
  done
  echo $max
}

# Get resolution and position arrays sorted from left to right horizontally

_res=$(hyprctl monitors | grep -A1 "Monitor" | awk '/Monitor/{getline; sub(/@.*/, "", $1); print $1, $NF}' | awk '{print $1}')
resolutions=($_res)
_pos=$(hyprctl monitors | grep -A1 "Monitor" | awk '/Monitor/{getline; sub(/@.*/, "", $1); print $1, $NF}' | awk '{print $NF}')
positions=($_pos)

combined=()
for i in "${!positions[@]}"; do
  combined+=("${positions[i]}x${resolutions[i]}")
done

sorted_combined=($(echo "${combined[@]}" | tr ' ' '\n' | sort -t'x' -k1,1n))

x_pos=()
y_pos=()
x_res=()
y_res=()

for item in ${sorted_combined[@]}; do
  xp=$(echo "$item" | cut -d'x' -f1)
  yp=$(echo "$item" | cut -d'x' -f2)
  xr=$(echo "$item" | cut -d'x' -f3)
  yr=$(echo "$item" | cut -d'x' -f4)

  x_pos+=("$xp")
  y_pos+=("$yp")
  x_res+=("$xr")
  y_res+=("$yr")
done

# Get bounding box

for i in "${!x_pos[@]}"; do
  x_max[i]=$((x_pos[i] + x_res[i]))
done

for i in "${!y_pos[@]}"; do
  y_max[i]=$((y_pos[i] + y_res[i]))
done

min_x=$(min "${x_pos[@]}")
max_x=$(max "${x_max[@]}")
min_y=$(min "${y_pos[@]}")
max_y=$(max "${y_max[@]}")

bounding_box_width=$((max_x - min_x))
bounding_box_height=$((max_y - min_y))

echo "$bounding_box_width"
echo "$bounding_box_height"

# Split the image

img="$1"
tmp="/tmp/tmp-wallpaper.png"
out_dir="./split-wallpaper"

mkdir "$out_dir"
magick "$img" -resize "${bounding_box_width}x${bounding_box_height}"^ -gravity center -extent "${bounding_box_width}x${bounding_box_height}" "$tmp"

for i in "${!positions[@]}"; do
  magick "$tmp" -crop "${x_res[i]}x${y_res[i]}+${x_pos[i]}+${y_pos[i]}" "$out_dir/out${i}.png"
done

rm "$tmp"
echo "Outputted Wallpapers to ${out_dir}"
