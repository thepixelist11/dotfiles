#!/bin/bash

host="https://api.chucknorris.io"

print_usage() {
  printf """
Usage: chuck-norris [OPTIONS]

chuck-norris will output a Chuck Norris joke.

 -c, Set categories
 -l, List categories

  """
}

print_joke() {
  if [[ -z "$1" ]]; then
    curl -sS -XGET "${host}/jokes/random" | jq '.value' | tr -d '\\"'
  else
    curl -sS -XGET "${host}/jokes/random?category=$1" | jq '.value' | tr -d '\\"'
  fi
}

list_categories() {
  curl -sS -XGET "${host}/jokes/categories" | jq -r '.[]' | tr ' ' '\n'
}

while getopts 'c:l' flag; do
  case "${flag}" in
    c) print_joke "$OPTARG"
       exit 0;;
    l) list_categories
       exit 0;;
    h) print_usage && exit 0 ;;
    *) print_usage && exit 1 ;;
  esac
done

shift $((OPTIND - 1))

print_joke
