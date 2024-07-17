#!/bin/bash

source ./packages/general_packages.sh

for i in "${packagesPacman[@]}"; do
  if pacman -Si "$i" &>/dev/null; then
    echo "$i existe en los repositorios."
  else
    echo "$i NO existe en los repositorios. - X"
  fi
done
