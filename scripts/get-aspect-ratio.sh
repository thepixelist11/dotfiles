#!/bin/bash
resolution=$(hyprctl monitors | grep -A 1 "$1" | tail -n 1 | cut -d "@" -f1 | tr -d "\t")

width=$(echo "$resolution" | cut -d 'x' -f 1)
height=$(echo "$resolution" | cut -d 'x' -f 2)

if [[ -n "$width" && -n "$height" ]]; then
    gcd() {
        if [[ $2 -eq 0 ]]; then
            echo $1
        else
            gcd "$2" "$(($1 % $2))"
        fi
    }

    divisor=$(gcd "$width" "$height")

    aspect_width=$((width / divisor))
    aspect_height=$((height / divisor))

    echo "${aspect_width}:${aspect_height}"
fi

