#!/bin/bash

if [[ -z "$1" ]]; then
  TEMPLATE="cli"
else
  TEMPLATE="$1"
fi

npm init -y
npm install typescript --save-dev

cp -r "$HOME/scripts/tsInit/templates/$TEMPLATE/." "."

echo "TypeScript project initialized successfully."

