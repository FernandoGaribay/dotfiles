#!/bin/bash

# qtile
rm $HOME/.config/qtile -rf
ln -s $HOME/Documents/dotfiles/.config/qtile $HOME/.config/qtile

# fastfetch
rm $HOME/.config/fastfetch -rf
ln -s $HOME/Documents/dotfiles/.config/fastfetch $HOME/.config/fastfetch

# picom fork ftlabs
rm $HOME/.config/picom -rf
ln -s $HOME/Documents/dotfiles/.config/picom $HOME/.config/picom

# ranger
rm $HOME/.config/ranger -rf
ln -s $HOME/Documents/dotfiles/.config/ranger $HOME/.config/ranger

# rofi
rm $HOME/.config/rofi -rf
ln -s $HOME/Documents/dotfiles/.config/rofi $HOME/.config/rofi

# .zshrc
rm $HOME/.zshrc
ln -s $HOME/Documents/dotfiles/.config/.zshrc $HOME/.zshrc 
