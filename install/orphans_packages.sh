#!/bin/bash

source /home/$(whoami)/.dotfiles/install/colors.sh

orphans=$(pacman -Qdtq)
if [ -n "$orphans" ]; then
  echo -e "  > ${DARK_BLUE}Unistalling${NC} the following ${DARK_GREEN}orphans packages${NC}...\n"
  sleep 1

  IFS=$'\n' read -rd '' -a orphans_array <<< "$orphans"
  for i in "${orphans_array[@]}"; do
    echo "  * ${DARK_YELLOW}${i}${NC}"
  done
  echo -e "\n"
  sudo pacman -Rns $orphans
else
  echo -e "\n  > No orphan ${DARK_GREEN}packages${NC}."
fi
