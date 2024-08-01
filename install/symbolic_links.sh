#!/bin/bash

# qtile
rm $HOME/.config/qtile -rf
ln -s $HOME/.dotfiles/config/qtile $HOME/.config/qtile
ln -s $HOME/.dotfiles/config/rofi $HOME/.config/qtile/rofi-menus/rofi

# fastfetch
rm $HOME/.config/fastfetch -rf
ln -s $HOME/.dotfiles/config/fastfetch $HOME/.config/fastfetch

# picom fork ftlabs
rm $HOME/.config/picom -rf
ln -s $HOME/.dotfiles/config/picom $HOME/.config/picom

# ranger
rm $HOME/.config/ranger -rf
ln -s $HOME/.dotfiles/config/ranger $HOME/.config/ranger

# rofi
rm $HOME/.config/rofi -rf
ln -s $HOME/.dotfiles/config/rofi $HOME/.config/rofi

# .zshrc
rm $HOME/.zshrc
ln -s $HOME/.dotfiles/config/.zshrc $HOME/.zshrc

# SDDM config file
sudo rm /etc/sddm.conf
sudo ln -s $HOME/.dotfiles/config/sddm.conf /etc/sddm.conf

# GTK Themes
if [ ! -d "$HOME/.themes" ]; then
	mkdir $HOME/.themes
fi
ln -s $HOME/.dotfiles/themes/gtk-themes/DraculaTheme $HOME/.themes/DraculaTheme

# GTK Icons and cursors
if [ ! -d "$HOME/.icons" ]; then
	mkdir $HOME/.icons
fi
	# icons
ln -s $HOME/.dotfiles/themes/icons/Wings-Light-Icons $HOME/.icons/Wings-Light-Icons
	#cursors
ln -s $HOME/.dotfiles/themes/cursors/Bibata-Modern-Ice $HOME/.icons/Bibata-Modern-Ice
