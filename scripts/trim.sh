#!/bin/bash

var=$*
var="${var#"${var%%[![:space:]]*}"}"
var="${var%"${var##*[![:space:]]}"}"
echo -n "$var"
