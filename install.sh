#!/bin/bash

PREDEFINED_DOTS_PATH="/home/$(whoami)/.dotfiles"
INSTALL_DIR="/home/$(whoami)/.dotfiles/install/"
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
mv $DOTFILES_PATH $PREDEFINED_DOTS_PATH || echo "${RED_ERROR}Error moving the directory to $PREDEFINED_DOTS_PATH${NC}" && exit 1

echo "Updating system..."
source $INSTALL_DIR/update_system.sh
