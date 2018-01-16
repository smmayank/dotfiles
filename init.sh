#!/bin/bash

FORMAT='\033[1;35m'
RESET='\033[0m' # No Color

# Simple function to create links in home dir
# params include
# 1 -> link name
# 2 -> source path
create_link() {
  printf "Creating links for $FORMAT$1$RESET\n"
  rm -rf "$HOME/$1"
  ln -s "$2" "$HOME/$1"
}

config_dir="$PWD/configs"

# check if bashrc exist if not create one
if [ ! -f $HOME/.bashrc ]; then
  touch $HOME/.bashrc
fi

# Append config/bashrc to $HOME/.bashrc
load_bashrc_d=$(echo "source $config_dir/bashrc")
if ! grep -q "$load_bashrc_d" $HOME/.bashrc; then
  printf "Adding dotfile entry in $FORMAT~/.bashrc$RESET\n"
  echo >> $HOME/.bashrc;
  echo "# adding entry point for dotfiles" >> $HOME/.bashrc;
  echo $load_bashrc_d >> $HOME/.bashrc;
fi

# create links for configs
create_link .vimrc "$config_dir/vimrc"
create_link .vim "$config_dir/vim"
