#!/bin/bash

echo -e "\n  > Cloning ${DARK_GREEN}Picom Fork ${NC}from ${DARK_BLUE}fdev31/picom.git${NC}...\n"
sudo git clone https://github.com/fdev31/picom.git /mnt/picom-fdev31

sudo pacman -S meson uthash libconfig

cd /mnt/picom-fdev31

sudo meson setup --buildtype=release . build

sudo ninja -C build

sudo ninja -C build install
