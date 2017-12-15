#!/usr/bin/env bash

# install seccomp

build_seccomp()
{
SECCOMP_URI=https://github.com/seccomp/libseccomp/releases/download/v2.3.2/libseccomp-2.3.2.tar.gz

if [ ! -f `basename $SECCOMP_URI ` ]; then
  curl -L -O $SECCOMP_URI
fi

tar zxvf `basename $SECCOMP_URI`

pushd `basename $SECCOMP_URI .tar.gz`

./configure --prefix=$HOME/.local
make && make install prefix=$HOME/.software/seccomp/.local
popd

pushd $HOME/.software
stow -R seccomp
popd
}

install_perl_modules()
{
MODULEPATH=$HOME/.software/perl5/.local
perl -MCPAN -e "CPAN::Shell->notest('install', 'DBI', 'DBD::SQLite', 'WWW:Curl')"
#cpan --notest DBI DBD::SQLite WWW:Curl
#cpanm -l $MODULEPATH --notest DBI DBD::SQLite WWW::Curl
stow -R $HOME/.software/perl5
}

build_nix() 
{
if false; then
NIX_URI=https://nixos.org/releases/nix/nix-1.11.16/nix-1.11.16.tar.xz

outp=`basename $NIX_URI `
if [ ! -f $outp ]; then
  curl -L -o $outp $NIX_URI
fi

tar xpvf $outp
pushd `basename $outp .tar.xz`
fi

git clone -b fix-ldflags https://github.com/antonl/nix.git $HOME/.work/nix
pushd nix

CXXFLAGS="-I$HOME/.local/include" 
LDFLAGS="-L$HOME/.local/lib" 

./bootstrap.sh
CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS" ./configure --prefix=$HOME/.local --with-store-dir=$HOME/.nixstore --disable-doc-gen
make -j12 && make install prefix=$HOME/.software/nix/.local
popd
}

WORKDIR=$HOME/.work
mkdir -p $WORKDIR
pushd $WORKDIR

build_seccomp
install_perl_modules
build_nix

popd
