#!/bin/bash

source /home/$(whoami)/.dotfiles/install/colors.sh

if ! command -v yay &>/dev/null; then
    echo -e "  > ${DARK_YELLOW}yay${NC} ${RED_ERROR}is not installed${NC}. Installing ${DARK_YELLOW}yay${NC}..."

    echo -e "  > ${DARK_BLUE}Cloning${NC} ${DARK_YELLOW}yay${NC} repository from ${DARK_GREEN}AUR${NC}...\n"
    git clone https://aur.archlinux.org/yay.git

    echo -e "  > ${DARK_BLUE}Changing${NC} to the yay directory..."
    cd /home/$(whoami)/yay

    echo -e "  > ${DARK_BLUE}Building${NC} ${DARK_YELLOW}yay${NC} package with makepkg...\n"
    makepkg -si --noconfirm

    cd ..
    rm -rf /home/$(whoami)/yay
    echo -e "  > ${DARK_YELLOW}yay${NC} has been ${DARK_GREEN}installed${NC}."
  
else
  echo -e "  > ${DARK_YELLOW}yay${NC} ${DARK_GREEN}is already installed${NC}."
fi
