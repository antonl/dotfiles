#!/usr/bin/env bash

# script assumes dotfiles is at $HOME/.dotfiles

# dir for installing software and such
mkdir -p $HOME/.local

workdir=$HOME/.tmp

rm -rf $workdir
mkdir $workdir
pushd $workdir > /dev/null

# obtain GNU stow
stow_f=stow-2.2.2.tar.gz

if [ ! -f `basename $stow_f` ]; then
  curl -L -o $stow_f http://ftp.gnu.org/gnu/stow/$stow_f
  tar zxf $stow_f
fi

pushd `basename $stow_f .tar.gz` > /dev/null
./configure --prefix=$HOME/.local
make install
popd > /dev/null

popd > /dev/null
rm -rf $workdir

STOWBIN=$HOME/.local/bin/stow

# add the bash_profile by default
pushd $HOME/dotfiles > /dev/null
$STOWBIN bash
popd > /dev/null
