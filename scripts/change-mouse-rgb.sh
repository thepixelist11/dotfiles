#!/bin/bash

#  Name: n/a
#  Report Rate: 1000Hz
#  Resolutions:
#    0: 400dpi
#    1: 2400dpi (active) (default)
#    2: 100dpi (disabled)
#    3: 100dpi (disabled)
#    4: 100dpi (disabled)
#  Button: 0 is mapped to 'button 1'
#  Button: 1 is mapped to 'button 2'
#  Button: 2 is mapped to 'button 3'
#  Button: 3 is mapped to 'button 4'
#  Button: 4 is mapped to 'button 5'
#  Button: 5 is mapped to 'resolution-alternate'
#  Button: 6 is mapped to macro '↕KEY_F'
#  Button: 7 is mapped to macro '↓KEY_LEFTCTRL ↕KEY_W ↑KEY_LEFTCTRL'
#  Button: 8 is mapped to 'second-mode'
#  Button: 9 is mapped to 'wheel-right'
#  Button: 10 is mapped to 'wheel-left'
#  LED: 0, depth: rgb, mode: breathing, color: 228cf8, duration: 2500, brightness: 255
#  LED: 1, depth: rgb, mode: breathing, color: 228cf8, duration: 2500, brightness: 255

DPI=2400

ID=$(ratbagctl list | cut -d ":" -f1)
LED_COUNT=$(($(ratbagctl "$ID" info | grep "Number of Leds" | cut -d ":" -f2 | awk '{$1=$1};1') - 1))
COLOR="$1"

ratbagctl --nocommit "$ID" profile active set 1

for i in $(seq 0 "$LED_COUNT"); do
  ratbagctl --nocommit "$ID" led "$i" set mode breathing
  ratbagctl --nocommit "$ID" led "$i" set brightness 255
  ratbagctl --nocommit "$ID" led "$i" set color "$COLOR"
  ratbagctl --nocommit "$ID" led "$i" set duration $((2500 + 500 * i))
done

ratbagctl --nocommit "$ID" button 0 action set button 1
ratbagctl --nocommit "$ID" button 1 action set button 2
ratbagctl --nocommit "$ID" button 2 action set button 3
ratbagctl --nocommit "$ID" button 3 action set button 4
ratbagctl --nocommit "$ID" button 4 action set button 5
ratbagctl --nocommit "$ID" button 5 action set special 'resolution-alternate'
ratbagctl --nocommit "$ID" button 6 action set macro 'KEY_F'
ratbagctl --nocommit "$ID" button 7 action set macro '+KEY_LEFTCTRL' 'KEY_W' '-KEY_LEFTCTRL'
ratbagctl --nocommit "$ID" button 8 action set key 'KEY_F24'
ratbagctl --nocommit "$ID" button 9 action set special 'wheel-right'
ratbagctl --nocommit "$ID" button 10 action set special 'wheel-left'

ratbagctl --nocommit "$ID" rate set 1000
ratbagctl "$ID" dpi set "$DPI"
