#!/bin/bash
echo "xrandr --output DP-1 --off" | sudo tee -a /usr/share/sddm/scripts/Xsetup >/dev/null
