#!/bin/bash

source /home/$(whoami)/.dotfiles/install/colors.sh

THEMES_DIR="/usr/share/sddm/themes"
TEMP_DIR="$HOME/.dotfiles/temp"

THEME_REPOSITORY="FernandoGaribay/catppuccin-sddm"
THEME_NAME="catppuccin-frappe.zip"

if ! [ -d $THEMES_DIR ]; then
    echo -e "\n  > Directory: $THEMES_DIR created."
    sudo mkdir -p $THEMES_DIR
fi

echo -e "\n  > Downloading SDDM Theme $THEME_NAME..."
curl -s https://api.github.com/repos/$THEME_REPOSITORY/releases/latest \
| jq -r ".assets[] | select(.name == \"$THEME_NAME\") | .browser_download_url" \
| xargs curl -L -o "$TEMP_DIR/$THEME_NAME"

echo -e "\n  > Installing theme $THEME_NAME...\n"
sudo unzip $TEMP_DIR/$THEME_NAME -d $THEMES_DIR
echo "xrandr --output DP-1 --off" | sudo tee -a /usr/share/sddm/scripts/Xsetup >/dev/null