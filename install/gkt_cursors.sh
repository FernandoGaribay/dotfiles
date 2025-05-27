#!/bin/bash

source /home/$(whoami)/.dotfiles/install/colors.sh

THEMES_DIR="$HOME/.icons"
TEMP_DIR="$HOME/.dotfiles/temp"

THEME_REPOSITORY="ful1e5/Bibata_Cursor"
THEME_NAME="Bibata-Modern-Ice.tar.xz"

if ! [ -d $THEMES_DIR ]; then
    echo -e "\n  > Directory: $THEMES_DIR created."
    mkdir $THEMES_DIR
fi

echo -e "\n  > Downloading GTK 3 $THEME_NAME..."
curl -s https://api.github.com/repos/$THEME_REPOSITORY/releases/latest \
| jq -r ".assets[] | select(.name == \"$THEME_NAME\") | .browser_download_url" \
| xargs curl -L -o "$TEMP_DIR/$THEME_NAME"

echo -e "\n  > Installing theme $THEME_NAME...\n"
tar -xJf $TEMP_DIR/$THEME_NAME -C $THEMES_DIR



