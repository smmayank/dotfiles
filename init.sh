#!/bin/bash

create_link() {
  FORMAT='\033[1;35m'
  RESET='\033[0m' # No Color
  printf "Creating links for $FORMAT$1$RESET\n"
  rm -rf "$HOME/$1"
  ln -s "$2" "$HOME"
}

config_dir="$PWD/configs"

create_link .vimrc "$config_dir/vim/.vimrc"
create_link .vim "$config_dir/vim/.vim"
