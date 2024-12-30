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
DARK_YELLOW=$(set_color 230 230 80)
DARK_GREEN=$(set_color 35 175 50)
DARK_BLUE=$(set_color 50 125 185)

NC=$(reset_color)
