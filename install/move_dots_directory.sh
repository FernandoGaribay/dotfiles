#!/bin/bash

PREDEFINED_DOTS_PATH="/home/$(whoami)/.dotfiles"
SCRIPT_PATH="$(readlink -f "$0")"
DOTFILES_PATH="$(dirname "$SCRIPT_PATH")"

source $(dirname "$0")/install/colors.sh
if ! mv "$DOTFILES_PATH" "$PREDEFINED_DOTS_PATH"; then
  echo "${RED_ERROR}Failed to move the directory from '$DOTFILES_PATH' to '$PREDEFINED_DOTS_PATH'.${NC}"
  if [ -d "$PREDEFINED_DOTS_PATH" ]; then
    echo "${RED_ERROR}The destination folder '$PREDEFINED_DOTS_PATH' already exists.${NC}"
  fi
  echo -e "\n"
  exit 1
fi
echo "  > The dotfiles directory has been successfully moved to '$PREDEFINED_DOTS_PATH'."
echo -e "\n"
