#!/bin/bash

curl -sS http://localhost:11434/api/generate -d "{
  \"model\": \"ttsai\",
  \"prompt\": \"$1\",
  \"stream\": false,
  \"options\": {\"num_predict\": 64}
}" | jq .response

