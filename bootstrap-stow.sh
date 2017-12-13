#!/usr/bin/env bash

# script assumes dotfiles is at $HOME/.dotfiles

# create a local folder structure
mkdir -p $HOME/.local
mkdir -p $HOME/Downloads

# obtain GNU stow
cd $HOME/Downloads
curl -L -O http://ftp.gnu.org/gnu/stow/stow-2.2.2.tar.gz
tar zxf stow-2.2.2.tar.gz
cd $HOME/Downloads/stow-2.2.2
./configure --prefix=$HOME/.local && make install
STOWBIN=$HOME/.local/bin/stow

# add the bash_profile by default
cd $HOME/.dotfiles
$STOWBIN bash
