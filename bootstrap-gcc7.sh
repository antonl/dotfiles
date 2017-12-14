#!/usr/bin/env bash

export PATH=$HOME/.local/bootstrap/bin:$PATH

WORKDIR=$HOME/.work
mkdir -p $WORKDIR

BINUTILS_VERS=binutils-2.29
GCC_VERS=gcc-7.2.0

fetch_sources ()
{
echo "Downloading the sources"
# download the src dirs
BINUTILS_URI=http://ftp.gnu.org/gnu/binutils/$BINUTILS_VERS.tar.xz
BINUTILS_SIG=http://ftp.gnu.org/gnu/binutils/$BINUTILS_VERS.tar.xz.sig

outp=$WORKDIR/`basename $BINUTILS_URI`
echo $outp

if [ ! -f $outp ]; then
  echo Downloading
  curl -L -o $outp $BINUTILS_URI
  stat $outp
fi

#gpg --verify $BINUTILS_SIG $BINUTILS_SRC

# download gcc stuff

GCC_URI=http://www.netgull.com/gcc/releases/$GCC_VERS/$GCC_VERS.tar.xz

outp=$WORKDIR/`basename $GCC_URI`
echo $outp

if [ ! -f $outp ]; then
  echo Downloading
  curl -L -o $outp $GCC_URI
  stat $outp
fi
}

extract_sources ()
{
echo "Extracting the sources"

outpd=$BINUTILS_VERS.tar.xz
stat $outpd

if [ ! -d `basename $outpd .tar.xz` ]; then
  tar xpvf $outpd -C $HOME/.work
fi

outpd=$GCC_VERS.tar.xz
stat $outpd

if [ ! -d `basename $outpd .tar.xz` ]; then
  tar xpvf $outpd -C $HOME/.work
fi

echo "Fetching additional gcc sources"
pushd $GCC_VERS
./contrib/download_prerequisites
popd
}

make_shared_tree ()
{
echo "Making shared build tree"

outp=$WORKDIR/shared_tree
rm -rf $outp
mkdir $outp

ln -sf $WORKDIR/$GCC_VERS/* $outp
ln -sf $WORKDIR/$BINUTILS_VERS/* $outp
}

configure_and_build()
{

outp=$WORKDIR/build_tree
rm -rf $outp
mkdir $outp

cd $outp
$outp/../shared_tree/configure --prefix=$HOME/.local/bootstrap \
                               --enable-languages=c,c++,fortran \
                               --enable-ld=default \
                               --enable-gold \
                               --enable-plugins

make -j 16
}

pushd $WORKDIR
fetch_sources
extract_sources

make_shared_tree
configure_and_build

popd
