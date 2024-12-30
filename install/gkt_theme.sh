#!/bin/bash

source /home/$(whoami)/.dotfiles/install/colors.sh
GTK3_FILE="$HOME/.config/gtk-3.0/settings.ini"
GTK2_FILE="$HOME/.gtkrc-2.0"

SOURCE_DIR="$HOME/.dotfiles/themes/gtk-themes"
DEST_DIR="$HOME/.themes"

if [ ! -d "$DEST_DIR" ]; then
    echo "  > ${DARK_BLUE}Folder ${DARK_YELLOW}${DEST_DIR} ${DARK_GREEN}created${NC}"
    mkdir $DEST_DIR
fi

for theme in "$SOURCE_DIR"/*; do
    theme_name=$(basename "$theme")
    ln -sf $HOME/.dotfiles/themes/gtk-themes/$theme_name $DEST_DIR
    echo "  > ${DARK_BLUE}Symbolic link${NC} created: ${DARK_GREEN}$theme${NC} -> ${DARK_YELLOW}$DEST_DIR/$theme_name${NC}"
done

if [ ! -f "$GTK3_FILE" ]; then
    echo "${DARK_BLUE}  > File $GTK3_FILE does not exist.${NC} "
else
    sed -i '/gtk-theme-name=/c\gtk-theme-name=BlueSky-Dark' "$GTK3_FILE"
fi


if [ ! -f "$GTK2_FILE" ]; then
    echo "${DARK_BLUE}  > File $GTK2_FILE does not exist.${NC} "
else
    sed -i '/gtk-theme-name=/c\gtk-theme-name="BlueSky-Dark"' "$GTK2_FILE"
fi
