#!/bin/bash

orphans=$(pacman -Qdtq)
if [ -n "$orphans" ]; then
  sudo pacman -Rns $orphans
else
  echo -e "\nNo orphan packages\n"
fi
