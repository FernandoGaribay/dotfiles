#!/bin/bash

wallpaper_folder="$HOME/Pictures/wallpapers"
cache_currentWallpaper="$HOME/.cache/current_wallpaper"

# Create cache file if not exists
if [ ! -f $cache_currentWallpaper ] ;then
    touch $cache_currentWallpaper
    echo "$wallpaper_folder/default.jpg" > "$cache_currentWallpaper"
fi

case $1 in

    # Load wallpaper from .cache
    "init")
	current_wallpaper=$(cat "$cache_currentWallpaper")
        wal -q -i $current_wallpaper
    ;;

    # Randomly select wallpaper 
    *)
        wal -q -i $wallpaper_folder
    ;;

esac

# Reload qtile color bar
qtile cmd-obj -o cmd -f reload_config
notify-send "Colors and Wallpaper updated" "with image $newwall"

# Read variables from cache colors
source "$HOME/.cache/wal/colors.sh"
echo "$wallpaper" > "$cache_currentWallpaper"
