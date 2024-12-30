#!/bin/bash

source /home/$(whoami)/.dotfiles/install/colors.sh
GTK3_FILE="$HOME/.config/gtk-3.0/settings.ini"
GTK2_FILE="$HOME/.gtkrc-2.0"

SOURCE_DIR="$HOME/.dotfiles/themes/icons"
DEST_DIR="$HOME/.icons"

if [ ! -d "$DEST_DIR" ]; then
    echo "  > ${DARK_BLUE}Folder ${DARK_YELLOW}${DEST_DIR} ${DARK_GREEN}created${NC}"
    mkdir $DEST_DIR
fi

for icon in "$SOURCE_DIR"/*; do
    icon_theme=$(basename "$icon")
    ln -sf $HOME/.dotfiles/themes/icons/$icon_theme $DEST_DIR
    echo "  > ${DARK_BLUE}Symbolic link${NC} created: ${DARK_GREEN}$icon${NC} -> ${DARK_YELLOW}$DEST_DIR/$icon_theme${NC}"
done

if [ ! -f "$GTK3_FILE" ]; then
    echo "${DARK_BLUE}  > File $GTK3_FILE does not exist.${NC} "
else
    sed -i '/gtk-icon-theme-name=/c\gtk-icon-theme-name=BlueSky-Dark' "$GTK3_FILE"
fi


if [ ! -f "$GTK2_FILE" ]; then
    echo "${DARK_BLUE}  > File $GTK2_FILE does not exist.${NC} "
else
    sed -i '/gtk-icon-theme-name=/c\gtk-icon-theme-name="BlueSky-Dark"' "$GTK2_FILE"
fi
