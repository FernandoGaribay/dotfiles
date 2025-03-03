#!/bin/sh

# Configuracion de monitores
xrandr --output HDMI-0 --primary --mode 1920x1080 --pos 1280x0 --rotate normal --output DP-1 --mode 1280x768 --pos 0x156 --rotate normal &

# Sensitivity
xinput --set-prop 12 "libinput Accel Speed" -0.4 &

# Keyboard layout
setxkbmap latam &

sleep 1

# Picom
picom --backend glx --vsync --xrender-sync-fence --no-use-damage &

# Wallpaper script
bash ~/.config/qtile/wallpaper.sh silent &

sleep 1

source ~/.dotfiles/apps/WallpaperSelector/venv/bin/activate && python ~/.dotfiles/apps/WallpaperSelector/main.py &
