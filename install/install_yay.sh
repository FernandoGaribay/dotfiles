#!/bin/bash

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
rm yay -rf
