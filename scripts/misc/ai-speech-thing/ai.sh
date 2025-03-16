#!/bin/bash

mpv $(~/scripts/misc/ai-speech-thing/audio.js "$(~/scripts/misc/ai-speech-thing/text.sh "$1")")
