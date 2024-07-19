#!/bin/bash

TARGER_DIR="$HOME/Documents"
CURRENT_DIR="$(pwd)"
DOTFILES_DIR="$(dirname "$CURRENT_DIR")"

mv $DOTFILES_DIR $TARGER_DIR
