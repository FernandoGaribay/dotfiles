#!/bin/bash

source /home/$(whoami)/.dotfiles/install/colors.sh

GTK3_FILE="$HOME/.config/gtk-3.0/settings.ini"
GTK2_FILE="$HOME/.gtkrc-2.0"
GTK_DEFAULT="/usr/share/icons/default/index.theme"

SOURCE_DIR="$HOME/.dotfiles/themes/cursors"
DEST_DIR="$HOME/.icons"

for cursor in "$SOURCE_DIR"/*; do
  cursor_theme=$(basename "$cursor")
  ln -sf $HOME/.dotfiles/themes/cursors/$cursor_theme $DEST_DIR
  echo "  > ${DARK_BLUE}Symbolic link${NC} created: ${DARK_GREEN}$cursor${NC} -> ${DARK_YELLOW}$DEST_DIR/$cursor_theme${NC}"
done

if [ ! -f "$GTK3_FILE" ]; then
    echo "${DARK_BLUE}  > File $GTK3_FILE does not exist.${NC} "
else
    sed -i '/gtk-cursor-theme-name=/c\gtk-cursor-theme-name=Bibata-Modern-Ice' "$GTK3_FILE"
fi


if [ ! -f "$GTK2_FILE" ]; then
    echo "${DARK_BLUE}  > File $GTK2_FILE does not exist.${NC} "
else
    sed -i '/gtk-cursor-theme-name=/c\gtk-cursor-theme-name="Bibata-Modern-Ice"' "$GTK2_FILE"
fi
sudo sed -i '/Inherits=/c\Inherits=Bibata-Modern-Ice' "$GTK_DEFAULT"
