#!/bin/bash

WORKSPACE="special:magic"
WIDTH=800
HEIGHT=300
COMMAND="tty-clock -s -c -t -C 3"

hyprctl dispatch exec "[workspace $WORKSPACE silent] kitty --class floating-terminal -e $COMMAND"

sleep 0.5

hyprctl keyword windowrulev2 "float, class:floating-terminal"
hyprctl keyword windowrulev2 "size $WIDTH $HEIGHT, class:floating-terminal"
hyprctl keyword windowrulev2 "center, class:floating-terminal"
