#!/bin/bash

OUT_START="$(mktemp)"
URL_START="$(curl -Ls -o "$OUT_START" -w %{url_effective} https://en.wikipedia.org/wiki/Special:Random)"
TITLE_START="$(cat $OUT_START | grep "title" | head -n 1 | sed -n 's|<title>\(.*\) - Wikipedia</title>|\1|p')"

OUT_END="$(mktemp)"
URL_END="$(curl -Ls -o "$OUT_END" -w %{url_effective} https://en.wikipedia.org/wiki/Special:Random)"
TITLE_END="$(cat $OUT_END | grep "title" | head -n 1 | sed -n 's|<title>\(.*\) - Wikipedia</title>|\1|p')"

echo "$TITLE_START -> $TITLE_END"

sleep 1
echo "3"
sleep 0.5
echo "2"
sleep 0.5
echo "1"
sleep 0.5
echo "GO"

firefox "$URL_START" &

# Timer
start_time=$(date +%s)
elapsed_time=0
running=true

format_time() {
    local total_seconds=$1
    local minutes=$(((total_seconds % 3600) / 60))
    local seconds=$((total_seconds % 60))

    echo "$TITLE_START -> $TITLE_END"
    printf "%02d:%02d\n" $minutes $seconds
}

while $running; do
    current_time=$(date +%s)
    elapsed_time=$((current_time - start_time))

    clear
    format_time $elapsed_time

    if read -t 0.1 -n 1; then
        running=false
    fi
done

clear
echo "$TITLE_START -> $TITLE_END"
echo "Race Complete in $current_time"
