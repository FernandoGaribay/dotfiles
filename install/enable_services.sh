#!/bin/bash

source /home/$(whoami)/.dotfiles/install/colors.sh

sudo systemctl enable NetworkManager
echo -e "\n  > ${DARK_GREEN}NetworkManager ${DARK_BLUE}service${NC} enabled.\n"

sudo systemctl enable sddm
echo -e "\n  > ${DARK_GREEN}SDDM ${DARK_BLUE}service${NC} enabled.\n"
