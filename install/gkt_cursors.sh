#!/bin/bash

GTK3_FILE="$HOME/.config/gtk-3.0/settings.ini"
GTK2_FILE="$HOME/.gtkrc-2.0"
GTK_DEFAULT="/usr/share/icons/default/index.theme"

if [ ! -f "$GTK3_FILE" ]; then
    echo "File $GTK3_FILE does not exist."
else
    sed -i '/gtk-cursor-theme-name=/c\gtk-cursor-theme-name=Bibata-Modern-Ice' "$GTK3_FILE"
fi


if [ ! -f "$GTK2_FILE" ]; then
    echo "File $GTK2_FILE does not exist."
else
    sed -i '/gtk-cursor-theme-name=/c\gtk-cursor-theme-name="Bibata-Modern-Ice"' "$GTK2_FILE"
fi
sudo sed -i '/Inherits=/c\Inherits=Bibata-Modern-Ice' "$GTK_DEFAULT"
