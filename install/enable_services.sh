#!/bin/bash

source /home/$(whoami)/.dotfiles/install/colors.sh

sudo systemctl enable NetworkManager
echo -e "\n  > ${DARK_GREEN}NetworkManager ${DARK_BLUE}service${NC} enabled.\n"

sudo systemctl enable sddm
echo -e "\n  > ${DARK_GREEN}SDDM ${DARK_BLUE}service${NC} enabled.\n"

sudo systemctl start libvirtd
echo -e "\n  > ${DARK_GREEN}libvirtd ${DARK_BLUE}service${NC} enabled.\n"


sudo usermod -aG libvirt $(whoami)
echo -e "\n  > User: ${DARK_GREEN}$USER${NC} added to group ${DARK_BLUE}'libvirt'${NC}."