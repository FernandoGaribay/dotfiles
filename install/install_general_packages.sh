#!/bin/bash

source ./packages/general_packages.sh

for i in "${packagesPacman[@]}"; do
  if pacman -Si "$i" &>/dev/null; then
    sudo pacman -S --noconfirm $i
  else
    echo "$i NO existe en los repositorios."
  fi
done

xdg-user-dirs-update
