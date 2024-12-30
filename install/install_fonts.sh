#!/bin/bash

source /home/$(whoami)/.dotfiles/install/colors.sh
source /home/$(whoami)/.dotfiles/install/packages/fonts.sh

for i in "${fonts[@]}"; do
  if pacman -Si "$i" &>/dev/null; then
    echo -e "  > Installing ${DARK_GREEN}font ${DARK_BLUE}'$i'${NC}..."
    sudo pacman -S --noconfirm $i
  else
    echo -e "  > ${RED_ERROR}Error:${NC} The ${DARK_BLUE}font${NC} ${DARK_GREEN}'$i'${NC} is not available in the repositories.\n"
  fi
done
echo -e "  > All ${DARK_BLUE}fonts${NC} have been ${DARK_GREEN}installed${NC}."