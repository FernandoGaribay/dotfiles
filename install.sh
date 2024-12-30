#!/bin/bash

PREDEFINED_DOTS_PATH="/home/$(whoami)/.dotfiles"
INSTALL_DIR="/home/$(whoami)/.dotfiles/install"
SCRIPT_PATH="$(readlink -f "$0")"
DOTFILES_PATH="$(dirname "$SCRIPT_PATH")"
source $(dirname "$0")/install/colors.sh

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
echo "    [1/17] UPDATING SYSTEM..."
echo -e "$line\n"
sleep 1
# source $INSTALL_DIR/update_system.sh

echo "$line"
echo "    [2/17] MOVING DOTFILES DIRECTORY FROM $DOTFILES_PATH TO $PREDEFINED_DOTS_PATH..."
echo -e "$line\n"
sleep 1

# if ! mv $DOTFILES_PATH $PREDEFINED_DOTS_PATH; then
#   echo "${RED_ERROR}Error moving the directory to $PREDEFINED_DOTS_PATH${NC}"
#   exit 1
# fi

# echo "$line"
# echo "    [3/17] INSTALLING PACMAN PACKAGES..."
# echo -e "$line\n"
# sleep 1
# # source $INSTALL_DIR/install_general_packages.sh

# echo "$line"
# echo "    [4/17] INSTALLING YAY (Yet Another Yaourt)..."
# echo -e "$line\n"
# sleep 1
# # source $INSTALL_DIR/install_yay.sh

# echo "$line"
# echo "    [5/17] INSTALLING YAY PACKAGES..."
# echo -e "$line\n"
# sleep 1
# # source $INSTALL_DIR/install_yay_packages.sh

# echo "$line"
# echo "    [6/17] INSTALLING REQUIRED FONTS..."
# echo -e "$line\n"
# sleep 1
# # source $INSTALL_DIR/install_fonts.sh

# echo "$line"
# echo "    [7/17] ENABLING SERVICES..."
# echo -e "$line\n"
# sleep 1
# # source $INSTALL_DIR/enable_services.sh

# echo "$line"
# echo "    [8/17] INSTALLING SDDM THEMES..."
# echo -e "$line\n"
# sleep 1
# # source $INSTALL_DIR/install_sddm_themes.sh

# echo "$line"
# echo "    [9/17] WRITING SCRIPTS ON XSETUP..."
# echo -e "$line\n"
# sleep 1
# # source $INSTALL_DIR/scripts_xsetup.sh

# echo "$line"
# echo "    [10/17] INSTALLING GTK THEMES..."
# echo -e "$line\n"
# sleep 1
# # source $INSTALL_DIR/gkt_theme.sh

# echo "$line"
# echo "    [11/17] INSTALLING GTK ICONS..."
# echo -e "$line\n"
# sleep 1
# # source $INSTALL_DIR/gkt_icons.sh

# echo "$line"
# echo "    [12/17] INSTALLING GTK CURSORS..."
# echo -e "$line\n"
# sleep 1
# # source $INSTALL_DIR/gkt_cursors.sh

# echo "$line"
# echo "    [13/17] SETTING SYMBOLIC LINKS..."
# echo -e "$line\n"
# sleep 1
# # source $INSTALL_DIR/symbolic_links.sh

# echo "$line"
# echo "    [14/17] SETTING FILES..."
# echo -e "$line\n"
# sleep 1
# # source $INSTALL_DIR/copy_files.sh

# echo "$line"
# echo "    [15/17] CLEANING ORPHAN PACKAGES..."
# echo -e "$line\n"
# sleep 1
# # source $INSTALL_DIR/orphans_packages.sh

# echo "$line"
# echo "    [16/17] INSTALLING OH MY ZSH..."
# echo -e "$line\n"
# sleep 1
# # source $INSTALL_DIR/install_ho_my_zsh.sh

# echo "$line"
# echo "    [17/17] INSTALLING ZSH PLUGGINS..."
# echo -e "$line\n"
# sleep 1
# # source $INSTALL_DIR/install_zsh_plugins.sh

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