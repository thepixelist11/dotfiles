#!/bin/bash

declare ref=$(hyprctl monitors | grep -m1 -oP '[0-9]+x[0-9]+@[0-9.]+' | sed 's/.*@//; s/\..*//')

if [[ "$ref" -lt "240" ]]; then
  hyprctl keyword monitor eDP-2,2560x1600@240,4520x480,1.333333
else
  hyprctl keyword monitor eDP-2,2560x1600@60,4520x480,1.333333
fi

ref=$(hyprctl monitors | grep -m1 -oP '[0-9]+x[0-9]+@[0-9.]+' | sed 's/.*@//; s/\..*//')
echo $ref

