#!/bin/bash

source /home/$(whoami)/.dotfiles/install/colors.sh
source /home/$(whoami)/.dotfiles/install/packages/general_packages.sh

for i in "${packagesPacman[@]}"; do
  if pacman -Si "$i" &>/dev/null; then
    echo -e "\n  > Installing ${DARK_GREEN}package ${DARK_BLUE}'$i'${NC}...\n"
    sudo pacman -S --noconfirm $i
  else
    echo -e "  > ${RED_ERROR}Error:${NC} The ${DARK_BLUE}package${NC} ${DARK_GREEN}'$i'${NC} is not available in the repositories.\n"
  fi
done
echo -e "  > All ${DARK_BLUE}packages${NC} have been ${DARK_GREEN}installed${NC}."
echo -e "\n  > Generating ${DARK_BLUE}user ${DARK_GREEN}directories${NC}..."
xdg-user-dirs-update
