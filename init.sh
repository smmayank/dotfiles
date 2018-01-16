#!/bin/bash

# Simple function to create links in home dir
# params include
# 1 -> link name
# 2 -> source path
create_link() {
  FORMAT='\033[1;35m'
  RESET='\033[0m' # No Color
  printf "Creating links for $FORMAT$1$RESET\n"
  rm -rf "$HOME/$1"
  ln -s "$2" "$HOME/$1"
}

config_dir="$PWD/configs"

create_link .vimrc "$config_dir/vimrc"
create_link .vim "$config_dir/vim"
