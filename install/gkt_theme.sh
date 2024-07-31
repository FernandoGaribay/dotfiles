#!/bin/bash

GTK3_FILE="$HOME/.config/gtk-3.0/settings.ini"
GTK2_FILE="$HOME/.gtkrc-2.0"

if [ ! -f "$GTK3_FILE" ]; then
    echo "File $GTK3_FILE does not exist."
else
    sed -i '/gtk-theme-name=/c\gtk-theme-name=DraculaTheme' "$GTK3_FILE"
fi


if [ ! -f "$GTK2_FILE" ]; then
    echo "File $GTK2_FILE does not exist."
else
    sed -i '/gtk-theme-name=/c\gtk-theme-name="DraculaTheme"' "$GTK2_FILE"
fi
