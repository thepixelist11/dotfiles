#!/bin/bash

case $1 in
    w) if [ `echo -e "Clear\nCancel" | wofi --dmenu -L 4 --conf ~/.config/wofi/wofi.conf` == "Clear" ] ; then
            cliphist wipe
       fi
       ;;

    *) cliphist list | wofi --dmenu -I -i -b -a -p " " --conf ~/.config/wofi/wofi.conf | cliphist decode | wl-copy
       ;;
esac
