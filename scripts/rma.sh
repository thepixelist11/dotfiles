#!/bin/bash

pattern=''
output=''

print_usage() {
  printf """
Usage: rma [OPTIONS] [input-file]

rma (remove after) will remove all text in a file after the first
instance of a specific regex pattern.

 -o, Specify the output file rather than overwriting the input.
 -p, The regex pattern to match with.
 -h, Show this help message.

  """
}

while getopts 'o:p:h' flag; do
  case "${flag}" in
    p) pattern="${OPTARG}" ;;
    o) output="${OPTARG}" ;;
    h) print_usage && exit 0 ;;
    *) print_usage
      exit 1 ;;
  esac
done

shift $((OPTIND - 1))

file="${@}"

if [[ -z "$file" || "$file" == -* ]]; then
  echo "Error: Input file not specified."
fi

if [[ ! -f "$file" ]]; then
  echo "Error: Input file does not exist."
fi

if [[ ! -z "$output" ]]; then
  sed "/$pattern/q" "$file" > temp.txt && mv -f temp.txt "$output"
else
  sed "/$pattern/q" "$file" > temp.txt && mv -f temp.txt "$file"
fi

rm ./temp.txt
