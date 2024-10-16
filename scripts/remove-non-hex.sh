#!/bin/bash

if [ -p /dev/stdin ]; then
    input_string=$(cat -)
else
    input_string="$1"
fi
hex_string=$(echo "$input_string" | tr -d -c '0-9A-Fa-f' | tr 'a-f' 'A-F')
echo "$hex_string"
