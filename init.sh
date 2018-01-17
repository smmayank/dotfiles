#!/bin/bash

FORMAT='\033[1;35m'
RESET='\033[0m' # No Color

# Simple function to create links in home dir
# params include
# 1 -> link name
# 2 -> source path
create_link() {
  if [ -e $1 ]; then
    rm -rf $1;
  fi
  printf "Creating links for $FORMAT$1$RESET\n"
  ln -s "$2" "$1"
}

config_dir=$PWD/configs

# check if bashrc exist if not create one
if [ ! -f $HOME/.bashrc ]; then
  printf "Creating $FORMAT$HOME/.bashrc$RESET\n"
  touch $HOME/.bashrc
fi

# Append config/bashrc to $HOME/.bashrc
load_bashrc_d=$(echo source $config_dir/bashrc)
if ! grep -q $load_bashrc_d $HOME/.bashrc; then
  printf "Adding dotfile entry in $FORMAT~/.bashrc$RESET\n"
  echo >> $HOME/.bashrc;
  echo "# adding entry point for dotfiles" >> $HOME/.bashrc;
  echo $load_bashrc_d >> $HOME/.bashrc;
fi

# Create bashrc.d dir
if [[ ! -d $HOME/.bashrc.d ]]; then
  printf "Creating dir $FORMAT$HOME/.bashrc.d$RESET\n"
  mkdir $HOME/.bashrc.d;
fi


# Create links for .bashrc.d
if [ -d $config_dir/bashrc.d ]; then
  for file in $(/bin/ls $config_dir/bashrc.d); do
    create_link $HOME/.bashrc.d/$file $config_dir/bashrc.d/$file
  done
fi

# create links for configs
create_link "$HOME/.vimrc" "$config_dir/vimrc"
create_link "$HOME/.vim" "$config_dir/vim"
