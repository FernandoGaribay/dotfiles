#!/bin/bash

# qtile
ln -sf $HOME/.dotfiles/config/qtile $HOME/.config/qtile
ln -sf $HOME/.dotfiles/config/rofi $HOME/.config/qtile/rofi-menus/rofi

# fastfetch
ln -sf $HOME/.dotfiles/config/fastfetch $HOME/.config/fastfetch

# picom fork ftlabs
ln -sf $HOME/.dotfiles/config/picom $HOME/.config/picom

# ranger
ln -sf $HOME/.dotfiles/config/ranger $HOME/.config/ranger

# rofi
ln -sf $HOME/.dotfiles/config/rofi $HOME/.config/rofi

# .zshrc
ln -sf $HOME/.dotfiles/config/.zshrc $HOME/.zshrc

# SDDM config file
sudo ln -sf $HOME/.dotfiles/config/sddm.conf /etc/sddm.conf

# GTK Themes
if [ ! -d "$HOME/.themes" ]; then
  mkdir $HOME/.themes
fi
ln -sf $HOME/.dotfiles/themes/gtk-themes/DraculaTheme $HOME/.themes/DraculaTheme

# GTK Icons and cursors
if [ ! -d "$HOME/.icons" ]; then
  mkdir $HOME/.icons
fi
# icons
ln -sf $HOME/.dotfiles/themes/icons/Wings-Light-Icons $HOME/.icons/Wings-Light-Icons
#cursors
ln -sf $HOME/.dotfiles/themes/cursors/Bibata-Modern-Ice $HOME/.icons/Bibata-Modern-Ice
