volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
if [[ "$volume" -eq "0" ]]; then
  pactl set-sink-volume @DEFAULT_SINK@ 100%
else
  pactl set-sink-volume @DEFAULT_SINK@ 0%
fi
