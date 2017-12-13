#!/usr/bin/env bash

# pull the ports tree from github
# this takes quite a while
PKGSRC_URI=https://github.com/NetBSD/pkgsrc.git
git clone $PKGSRC_URI $HOME/.local/pkgsrc

# bootstrap the ports
cd $HOME/.local/pkgsrc/bootstrap

./bootstrap --unprivileged --prefix=$HOME/.local --pkgdbdir=$HOME/.local/.pkgdb   \
            --workdir=$HOME/.work --abi 64 --prefer-pkgsrc=yes --gzip-binary-kit

# remove the resulting configuration file
# we will use stow instead
rm $HOME/.local/etc/mk.conf

# mount the stowed pkgsrc files
cd $HOME/.dotfiles
stow pkgsrc
