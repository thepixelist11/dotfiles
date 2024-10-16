#!/bin/bash

find "/home/ben/dotfiles/.config/swaync/" | entr -c -s "swaync-client -R & swaync-client -rs"
