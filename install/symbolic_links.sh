#!/bin/bash

source /home/$(whoami)/.dotfiles/install/colors.sh

# qtile
ln -sf $HOME/.dotfiles/config/qtile $HOME/.config/qtile
echo "  > ${DARK_BLUE}Symbolic link${NC} created: ${DARK_GREEN}$HOME/.dotfiles/config/qtile${NC} -> ${DARK_YELLOW}$HOME/.config/qtile${NC}"

ln -sf $HOME/.dotfiles/config/rofi $HOME/.config/qtile/rofi-menus/rofi
echo "  > ${DARK_BLUE}Symbolic link${NC} created: ${DARK_GREEN}$HOME/.dotfiles/config/rofi${NC} -> ${DARK_YELLOW}$HOME/.config/qtile/rofi-menus/rofi${NC}"

# fastfetch
ln -sf $HOME/.dotfiles/config/fastfetch $HOME/.config/fastfetch
echo "  > ${DARK_BLUE}Symbolic link${NC} created: ${DARK_GREEN}$HOME/.dotfiles/config/fastfetch${NC} -> ${DARK_YELLOW}$HOME/.config/fastfetch${NC}"

# picom fork ftlabs
ln -sf $HOME/.dotfiles/config/picom $HOME/.config/picom
echo "  > ${DARK_BLUE}Symbolic link${NC} created: ${DARK_GREEN}$HOME/.dotfiles/config/picom${NC} -> ${DARK_YELLOW}$HOME/.config/picom${NC}"

# ranger
ln -sf $HOME/.dotfiles/config/ranger $HOME/.config/ranger
echo "  > ${DARK_BLUE}Symbolic link${NC} created: ${DARK_GREEN}$HOME/.dotfiles/config/ranger${NC} -> ${DARK_YELLOW}$HOME/.config/ranger${NC}"

# rofi
ln -sf $HOME/.dotfiles/config/rofi $HOME/.config/rofi
echo "  > ${DARK_BLUE}Symbolic link${NC} created: ${DARK_GREEN}$HOME/.dotfiles/config/rofi${NC} -> ${DARK_YELLOW}$HOME/.config/rofi${NC}"

# .zshrc
ln -sf $HOME/.dotfiles/config/.zshrc $HOME/.zshrc
echo "  > ${DARK_BLUE}Symbolic link${NC} created: ${DARK_GREEN}$HOME/.dotfiles/config/.zshrc${NC} -> ${DARK_YELLOW}$HOME/.zshrc${NC}"

# SDDM config file
sudo ln -sf $HOME/.dotfiles/config/sddm.conf /etc/sddm.conf
echo "  > ${DARK_BLUE}Symbolic link${NC} created: ${DARK_GREEN}$HOME/.dotfiles/config/sddm.conf${NC} -> ${DARK_YELLOW}/etc/sddm.conf${NC}"