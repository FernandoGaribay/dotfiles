#!/bin/bash

source /home/$(whoami)/.dotfiles/install/colors.sh

echo -e "  > Installing ${DARK_GREEN}theme ${DARK_BLUE}'Sonomatic'${NC} on ${DARK_YELLOW}/usr/share/sddm/themes${NC}..."

sudo cp -r $HOME/.dotfiles/themes/sddm-themes/Sonomatic /usr/share/sddm/themes
echo "xrandr --output DP-1 --off" | sudo tee -a /usr/share/sddm/scripts/Xsetup >/dev/null

echo -e "  > Theme ${DARK_BLUE}'Sonomatic'${NC} ${DARK_GREEN}installed${NC}..."