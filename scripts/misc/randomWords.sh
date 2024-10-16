#!/bin/bash

response=$(curl -s -X 'GET' 'https://random-word-api.herokuapp.com/word?number=10')
parsedList=$(echo "$response" | jq -r '.[]' | paste -sd ', ' -)
echo "$parsedList" | wl-copy
