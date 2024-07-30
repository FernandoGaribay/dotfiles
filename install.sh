#!/bin/bash

PREDEFINED_DOTS_PATH="/home/$(whoami)/.dotfiles"
INSTALL_DIR="/home/$(whoami)/.dotfiles/install"
SCRIPT_PATH="$(readlink -f "$0")"
DOTFILES_PATH="$(dirname "$SCRIPT_PATH")"
source $(dirname "$0")/install/colors.sh

echo -e "${GREEN}"
echo -e '       _       _    __ _ _             _           _        _ _           '
echo -e '    __| | ___ | |_ / _(_) | ___  ___  (_)_ __  ___| |_ __ _| | | ___ _ __ '
echo -e '   / _` |/ _ \| __| |_| | |/ _ \/ __| | | '"'"'_ \/ __| __/ _` | | |/ _ \ '"'"'__|'
echo -e '  | (_| | (_) | |_|  _| | |  __/\__ \ | | | | \__ \ || (_| | | |  __/ |   '
echo -e '   \__,_|\___/ \__|_| |_|_|\___||___/ |_|_| |_|___/\__\__,_|_|_|\___|_|   '
echo -e '   https://github.com/FernandoGaribay/dotfiles \n'
echo -e "${NC}"

read -p '> Proceed with the installation (y/n): ' answer

if [ $answer == "y" ]; then
  echo -e "Starting the installation.\n"
else
  exit 0
fi

echo "Moving dotfiles directory FROM $DOTFILES_PATH TO $PREDEFINED_DOTS_PATH..."

if ! mv $DOTFILES_PATH $PREDEFINED_DOTS_PATH; then
  echo "${RED_ERROR}Error moving the directory to $PREDEFINED_DOTS_PATH${NC}"
  exit 1
fi

echo "Updating system..."
source $INSTALL_DIR/update_system.sh

echo "Installing Yay..."
source $INSTALL_DIR/install_yay.sh

echo "Installing Pacman Packages..."
source $INSTALL_DIR/install_general_packages.sh

echo "Installing Yay Packages..."
source $INSTALL_DIR/install_yay_packages.sh

echo "Installing Fonts..."
source $INSTALL_DIR/install_fonts.sh

echo "Enabling services..."
source $INSTALL_DIR/enable_services.sh

echo "Setting symbolic links..."
source $INSTALL_DIR/symbolic_links.sh

echo "Installing oh my zsh..."
source $INSTALL_DIR/install_ho_my_zsh.sh

echo "Installing zsh pluggins..."
source $INSTALL_DIR/install_zsh_plugins.sh

echo "Installing sddm themes..."
source $INSTALL_DIR/install_sddm_themes.sh

echo "Installing gtk themes..."
source $INSTALL_DIR/gtk_themes.sh
