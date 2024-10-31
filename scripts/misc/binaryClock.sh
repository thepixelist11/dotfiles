#!/bin/bash

TIME=$(date +%T)
HOUR=$(echo "$TIME" | cut -d ":" -f1)
MINUTE=$(echo "$TIME" | cut -d ":" -f2)
SECOND=$(echo "$TIME" | cut -d ":" -f3)

HOUR_BIN=$(printf "%06s" "$(echo "obase=2; $HOUR" | bc)" | tr ' ' '0')
MINUTE_BIN=$(printf "%06s" "$(echo "obase=2; $MINUTE" | bc)" | tr ' ' '0')
SECOND_BIN=$(printf "%06s" "$(echo "obase=2; $SECOND" | bc)" | tr ' ' '0')

function replace_bin_chars() {
  echo "$1" | tr "1" "$2" | tr "0" " "
}

replace_bin_chars "$HOUR_BIN" "#"
replace_bin_chars "$MINUTE_BIN" "#"
replace_bin_chars "$SECOND_BIN" "#"
