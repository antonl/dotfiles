#!/usr/bin/env bash

# script assumes dotfiles is at $HOME/.dotfiles

# create a local folder structure
mkdir -p $HOME/.local
mkdir -p $HOME/.software
mkdir -p $HOME/.work
mkdir -p $HOME/Downloads

# obtain perl
pushd $HOME/.work

PERLURI=http://www.cpan.org/src/5.0/perl-5.26.1.tar.gz
if [ ! -f `basename $PERLURI` ]; then
  curl -L -O $PERLURI
fi
tar zxf `basename $PERLURI`

pushd `basename $PERLURI .tar.gz`
sh Configure -Dprefix=$HOME/.local -Dinstallprefix=$HOME/.software/perl5/.local \
             -de -Dusemultiplicity -Dusethreads -Duseithreads -Duselargefiles \
             -Dcc=gcc
make -j 12 && make install
popd

# obtain GNU stow
if [ ! -f `basename $PERLURI` ]; then
  curl -L -O http://ftp.gnu.org/gnu/stow/stow-2.2.2.tar.gz
fi
tar zxf stow-2.2.2.tar.gz

pushd stow-2.2.2

PATH=$HOME/.software/perl5/.local/bin:$PATH
export PERL5LIB=$HOME/.software/perl5/.local/lib/perl5/5.26.1
./configure --prefix=$HOME/.software/stow/.local \
            --with-pmdir=$HOME/.software/stow/.local/share/perl5
make install
popd

STOWBIN=$HOME/.software/stow/.local/bin/stow

pushd $HOME/.software
perl5/.local/bin/perl $STOWBIN perl5 stow
popd

# add the bash_profile by default
pushd $HOME/.dotfiles
$STOWBIN bash
popd

popd

source $HOME/.bash_profile
