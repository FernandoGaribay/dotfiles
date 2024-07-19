#!/bin/bash

sudo pacman -Sy --noconfirm
sudo pacman -Syu --noconfirm

orphans=$(pacman -Qdtq)
if [ -n "$orphans" ]; then
  sudp pacman -Rns $orphans
else
  echo -e "\nNo orphan packages\n"
fi
