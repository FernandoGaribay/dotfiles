#!/bin/bash

source /home/$(whoami)/.dotfiles/install/packages/general_packages.sh

for i in "${packagesPacman[@]}"; do
  if pacman -Si "$i" &>/dev/null; then
    sudo pacman -S --noconfirm $i
  else
    echo "$i NO existe en los repositorios."
  fi
done

xdg-user-dirs-update
cp /home/$(whoami)/.dotfiles/wallpapers /home/$(whoami)/Pictures
