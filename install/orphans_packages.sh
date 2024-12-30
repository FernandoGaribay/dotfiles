#!/bin/bash

source /home/$(whoami)/.dotfiles/install/colors.sh

orphans=$(pacman -Qdtq)
if [ -n "$orphans" ]; then
  echo -e "  > ${DARK_BLUE}Unistalling${NC} the following ${DARK_GREEN}packages${NC}...\n\n$orphans"
  sleep 1
  sudo pacman -Rns $orphans
else
  echo -e "\n  > No orphan ${DARK_GREEN}packages${NC}."
fi
