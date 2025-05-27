#!/bin/bash

PREDEFINED_DOTS_PATH="/home/$(whoami)/.dotfiles"
INSTALL_DIR="/home/$(whoami)/.dotfiles/install"

clear
echo -e "
    ######################################################################

    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
    ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
    ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
     
    DOTFILES FOR ARCHLINUX.

    ######################################################################\n
"

read -p "  > DO YOU WANT TO START THE INSTALLATION NOW? (Yy/Nn): " answer
echo -e "\n\n"

if ! ([ "$answer" = "Y" ] || [ "$answer" = "y" ]); then
  echo -e "  > Installation canceled...\n"
  exit 0
fi

width=$(tput cols)
line=$(printf '%*s' "$width" '' | tr ' ' '-')

echo "$line"
echo "    [1/16] MOVING DOTFILES DIRECTORY FROM $DOTFILES_PATH TO $PREDEFINED_DOTS_PATH..."
echo -e "$line\n"
sleep 1
source "$(dirname "$(realpath "$0")")/install/move_dots_directory.sh"
echo -e "${DOTFILES_PATH}\n"


echo "$line"
echo "    [2/16] UPDATING SYSTEM..."
echo -e "$line\n"
sleep 1
source $INSTALL_DIR/update_system.sh
echo -e "\n"


echo "$line"
echo "    [3/16] INSTALLING PACMAN PACKAGES..."
echo -e "$line\n"
sleep 1
source $INSTALL_DIR/install_pacman_packages.sh
echo -e "\n"


echo "$line"
echo "    [4/16] INSTALLING YAY (Yet Another Yaourt)..."
echo -e "$line\n"
sleep 1
source $INSTALL_DIR/install_yay.sh
echo -e "\n"


echo "$line"
echo "    [5/16] INSTALLING YAY PACKAGES..."
echo -e "$line\n"
sleep 1
source $INSTALL_DIR/install_yay_packages.sh
echo -e "\n"


echo "$line"
echo "    [6/16] INSTALLING REQUIRED FONTS..."
echo -e "$line\n"
sleep 1
source $INSTALL_DIR/install_fonts.sh
echo -e "\n"


echo "$line"
echo "    [7/16] ENABLING SERVICES..."
echo -e "$line\n"
sleep 1
source $INSTALL_DIR/enable_services.sh
echo -e "\n"


echo "$line"
echo "    [8/16] INSTALLING SDDM THEMES..."
echo -e "$line\n"
sleep 1
source $INSTALL_DIR/install_sddm_themes.sh
echo -e "\n"


echo "$line"
echo "    [9/16] INSTALLING GTK THEMES..."
echo -e "$line\n"
sleep 1
source $INSTALL_DIR/gkt_theme.sh
echo -e "\n"


echo "$line"
echo "    [10/16] INSTALLING GTK ICONS..."
echo -e "$line\n"
sleep 1
source $INSTALL_DIR/gkt_icons.sh
echo -e "\n"


echo "$line"
echo "    [11/16] INSTALLING GTK CURSORS..."
echo -e "$line\n"
sleep 1
source $INSTALL_DIR/gkt_cursors.sh
echo -e "\n"


echo "$line"
echo "    [12/16] INSTALLING SYSTEM APPS..."
echo -e "$line\n"
sleep 1
source $INSTALL_DIR/install_system_apps.sh
echo -e "\n"


echo "$line"
echo "    [13/16] INSTALLING OH MY ZSH..."
echo -e "$line\n"
sleep 1
source $INSTALL_DIR/install_ho_my_zsh.sh


echo "$line"
echo "    [14/16] INSTALLING ZSH PLUGGINS..."
echo -e "$line\n"
sleep 1
source $INSTALL_DIR/install_zsh_plugins.sh


echo "$line"
echo "    [14/16] INSTALLING PICOM FORK..."
echo -e "$line\n"
sleep 1
source $INSTALL_DIR/install_picom.sh

echo "$line"
echo "    [15/16] CLEANING ORPHAN PACKAGES..."
echo -e "$line\n"
sleep 1
source $INSTALL_DIR/orphans_packages.sh
echo -e "\n"


echo "$line"
echo "    [16/16] SETTING SYMBOLIC LINKS..."
echo -e "$line\n"
sleep 1
source $INSTALL_DIR/symbolic_links.sh
echo -e "\n"


echo "
    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗      █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
    ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║
    ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝

     ██████╗ ██████╗ ███╗   ███╗██████╗ ██╗     ███████╗████████╗███████╗██████╗ 
    ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║     ██╔════╝╚══██╔══╝██╔════╝██╔══██╗
    ██║     ██║   ██║██╔████╔██║██████╔╝██║     █████╗     ██║   █████╗  ██║  ██║
    ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝     ██║   ██╔══╝  ██║  ██║
    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ███████╗███████╗   ██║   ███████╗██████╔╝
     ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═════╝ 
"

read -p "  > DO YOU WANT TO REBOOT YOUR SYSTEM NOW? (Yy/Nn): " answer
if ! ([ "$answer" = "Y" ] || [ "$answer" = "y" ]); then
  echo -e "\n"
  exit 0
fi

echo -n "  > REBOOTING"
for i in {3..0}; do
  for j in {2..0}; do
    echo -n "."
    sleep 0.33
  done
  echo -n "$i"
done
sleep 1
reboot
