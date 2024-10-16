#!/bin/bash

WAL_COLORS="$HOME/.cache/wal/colors.css"
WOFI_CONFIG="$HOME/.config/wofi/style.css"

BACKGROUND=$(grep -e '--color0:' "$WAL_COLORS" | cut -d ' ' -f 2)
FOREGROUND=$(grep -e '--color15:' "$WAL_COLORS" | cut -d ' ' -f 2)
COLOR1=$(cat $WAL_COLORS | grep -e '--color1:' | awk -F ': ' '{print $2}' | tr -d ' ;')
COLOR2=$(cat $WAL_COLORS | grep -e '--color2:' | awk -F ': ' '{print $2}' | tr -d ' ;')
COLOR3=$(cat $WAL_COLORS | grep -e '--color3:' | awk -F ': ' '{print $2}' | tr -d ' ;')
COLOR4=$(cat $WAL_COLORS | grep -e '--color4:' | awk -F ': ' '{print $2}' | tr -d ' ;')
COLOR5=$(cat $WAL_COLORS | grep -e '--color5:' | awk -F ': ' '{print $2}' | tr -d ' ;')
COLOR6=$(cat $WAL_COLORS | grep -e '--color6:' | awk -F ': ' '{print $2}' | tr -d ' ;')
COLOR7=$(cat $WAL_COLORS | grep -e '--color7:' | awk -F ': ' '{print $2}' | tr -d ' ;')
COLOR8=$(cat $WAL_COLORS | grep -e '--color8:' | awk -F ': ' '{print $2}' | tr -d ' ;')
COLOR9=$(cat $WAL_COLORS | grep -e '--color9:' | awk -F ': ' '{print $2}' | tr -d ' ;')
COLOR10=$(cat $WAL_COLORS | grep -e '--color10:' | awk -F ': ' '{print $2}' | tr -d ' ;')
COLOR11=$(cat $WAL_COLORS | grep -e '--color11:' | awk -F ': ' '{print $2}' | tr -d ' ;')
COLOR12=$(cat $WAL_COLORS | grep -e '--color12:' | awk -F ': ' '{print $2}' | tr -d ' ;')
COLOR13=$(cat $WAL_COLORS | grep -e '--color13:' | awk -F ': ' '{print $2}' | tr -d ' ;')
COLOR14=$(cat $WAL_COLORS | grep -e '--color14:' | awk -F ': ' '{print $2}' | tr -d ' ;')

cat > "$WOFI_CONFIG" <<EOL
/* NOTE: Automatically Generated. Do not edit. */

* {
    all: initial;
    font-size: 14px;
    font-family: "Hack Nerd Font";
}

window {
    font-size: 16px;
    font-family: "Hack Nerd Font";
    font-weight: 300;
    background-color: rgba(0, 0, 0, 0.93);
    opacity: 0.8;
    color: white;
    border-radius: 5px;
    border-width: 8px;
}

#entry:selected {
    background: linear-gradient(90deg, $COLOR10, $COLOR11);
}

#entry {
    padding-left: 1em;
    padding-right: 0.5em;
    padding-top: 0.25em;
    padding-bottom: 0.25em;
}

#text {
    padding-left: 0.75em;
}

#input {
    background-color: rgba(0, 0, 0, 0.9);
    border: none;
    border-radius: 5px;
    margin: 5px;
    padding: 10px;
}

#input>image.left {
    -gtk-icon-transform: scaleX(0);
}
EOL
