#!/bin/bash

POWER_STATE=$(cat "/sys/class/power_supply/ACAD/online")

if [ "$POWER_STATE" -eq 1 ]; then
cat <<EOF > /home/ben/.config/hypr/hyprland/power.conf
\$refRate = 240
\$blurPasses = 4
\$shadows = on
EOF
else
cat <<EOF > /home/ben/.config/hypr/hyprland/power.conf
\$refRate = 60
\$blurPasses = 0
\$shadows = off
EOF
fi

