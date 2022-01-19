#!/bin/sh

# Directory
PATH="$HOME/Pictures/wallpaper/"

FILES=($PATH/*)

WALLPAPER=`printf "%s\n" "${FILES[RANDOM % ${#FILES[@]}]}"`

echo "$WALLPAPER"

