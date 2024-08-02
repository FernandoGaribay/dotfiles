#!/bin/bash

source /home/$(whoami)/.dotfiles/install/packages/fonts.sh

for i in "${fonts[@]}"; do
  if pacman -Si "$i" &>/dev/null; then
    sudo pacman -S --noconfirm $i
  else
    echo "$i NO existe en los repositorios"
  fi
done
