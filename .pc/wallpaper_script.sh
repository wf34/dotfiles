#!/bin/bash

# Random Wallpaper Selector
# Usage: ./random-wallpaper.sh /path/to/wallpapers/folder

# Check if directory argument is provided
if [ $# -ne 1 ]; then
    WALLPAPER_DIR="${HOME}/Pictures/oboe"
else
    WALLPAPER_DIR="$1"
fi

# Check if directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Error: Directory '$WALLPAPER_DIR' does not exist"
    exit 1
fi

IMAGE_COUNT=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | wc -l)

if [ "$IMAGE_COUNT" -eq 0 ]; then
    echo "Error: No image files found in '$WALLPAPER_DIR'"
    exit 1
fi

selected=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | shuf -n 1)

feh --bg-center "${selected}" --image-bg black
