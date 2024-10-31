#!/bin/bash

echo "A copy of myself has been created ;)"

last_number=$(echo "$0" | grep -oP '\d+' | tail -n 1)
number=$((last_number + 1))
name=$(echo "$0" | sed 's/\([0-9]*\)[^0-9]*$/\n&/' | sed 's/[0-9]*$//' | head -n 1)

cp "$0" "${name}${number}.sh"
rm "$0"
