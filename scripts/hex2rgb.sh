#!/bin/sh

# Remove leading # if present
hexinput=`echo $1 | sed 's/^#//' | tr '[:lower:]' '[:upper:]'`
a=`echo $hexinput | cut -c-2`
b=`echo $hexinput | cut -c3-4`
c=`echo $hexinput | cut -c5-6`

r=`echo "ibase=16; $a" | bc`
g=`echo "ibase=16; $b" | bc`
b=`echo "ibase=16; $c" | bc`

echo "rgb($r, $g, $b)"
exit 0
