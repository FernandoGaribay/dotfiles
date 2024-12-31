#!/bin/bash

source /home/$(whoami)/.dotfiles/install/colors.sh
source /home/$(whoami)/.dotfiles/install/packages/yay_packages.sh

for i in "${packagesYay[@]}"; do
  if yay -Si "$i" &>/dev/null; then
    echo -e "\n  > Installing ${DARK_GREEN}package ${DARK_BLUE}'$i'${NC}...\n"
    yay -S --noconfirm $i
  else
    echo -e "  > ${RED_ERROR}Error:${NC} The ${DARK_BLUE}package${NC} ${DARK_GREEN}'$i'${NC} is not available in the repositories.\n"
  fi
done
echo -e "  > All ${DARK_BLUE}packages${NC} have been ${DARK_GREEN}installed${NC}."