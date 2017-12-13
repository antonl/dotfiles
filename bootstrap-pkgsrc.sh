#!/usr/bin/env bash

# pull the ports tree from github
# this takes quite a while
PKGSRC_URI=https://github.com/NetBSD/pkgsrc.git
git clone $PKGSRC_URI $HOME/pkgsrc

# bootstrap the ports
cd $HOME/pkgsrc/bootstrap

./bootstrap --unprivileged \
            --prefix=$HOME/.local \
            --workdir=$HOME/.work \
            --abi 64 \
            --prefer-pkgsrc=yes \
            --mk-fragment=$HOME/.work/mk.conf \
            --gzip-binary-kit=$HOME/.local/bootstrap.tgz

# mount the stowed pkgsrc files
cd $HOME/.dotfiles
stow pkgsrc
