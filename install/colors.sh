#!/bin/bash

set_color() {
  local r=$1
  local g=$2
  local b=$3
  echo -e "\033[38;2;${r};${g};${b}m"
}

reset_color() {
  echo -e "\033[0m"
}

RED_ERROR=$(set_color 255 0 0)
GREEN=$(set_color 0 255 0)
YELLOW=$(set_color 255 255 0)
BLUE=$(set_color 0 0 255)
NC=$(reset_color)
