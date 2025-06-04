#!/bin/bash

source /home/$(whoami)/.dotfiles/install/colors.sh

THEMES_DIR="$HOME/.themes"
TEMP_DIR="$HOME/.dotfiles/temp"

THEME_REPOSITORY="EliverLara/Sweet"
THEME_NAME="Sweet-Dark-v40.tar.xz"

if ! [ -d $THEMES_DIR ]; then
    echo -e "\n  > Directory: $THEMES_DIR created."
    mkdir $THEMES_DIR
fi

if ! [ -d $TEMP_DIR ]; then
    echo -e "\n  > Temp Directory: $TEMP_DIR created."
    sudo mkdir -p $TEMP_DIR
    sudo chown -R $(whoami):$(id -gn $(whoami)) "$TEMP_DIR"
fi

sudo pacman -S jq --noconfirm

echo -e "\n  > Downloading GTK 3 $THEME_NAME..."
curl -s https://api.github.com/repos/$THEME_REPOSITORY/releases/latest \
| jq -r ".assets[] | select(.name == \"$THEME_NAME\") | .browser_download_url" \
| xargs curl -L -o "$TEMP_DIR/$THEME_NAME"

sudo pacman -Rsn jq --noconfirm

echo -e "\n  > Installing theme $THEME_NAME...\n"
tar -xJf $TEMP_DIR/$THEME_NAME -C $THEMES_DIR



