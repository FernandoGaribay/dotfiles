#!/bin/bash

source ./packages/yay_packages.sh

for i in "${packagesYay[@]}"; do
  if yay -Si "$i" &>/dev/null; then
    yay -S --noconfirm $i
  else
    echo "$i NO existe en los repositorios."
  fi
done
