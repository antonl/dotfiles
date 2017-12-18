#!/usr/bin/env bash

# install spack into dotfiles dir
pushd $HOME/dotfiles > /dev/null
if [ ! -d .spack ]; then
  git clone https://github.com/spack/spack.git .spack
fi

stow -R spack
popd > /dev/null

mkdir -p $HOME/env
source $HOME/.bash_profile
echo "Bootstrapping env/dope (may take a while)"
spack install python@3.6.3 vim@8.0.1375 +big tmux@2.6
spack view --verbose add $HOME/env/dope python@3.6.3 vim@8.0.1376 tmux@2.6

# use python3.6 as the default python
ln -s $HOME/env/dope/bin/python3.6 $HOME/env/dope/bin/python

# add mozilla certs to openssl
SSL_DIR=`spack location --install-dir openssl`
curl -L -o $SSL_DIR/etc/openssl/cert.pem https://curl.haxx.se/ca/cacert.pem

echo "Bootstrapped spack. Please source your bash profile to see changes."
echo
echo "To do this run  > 'source $HOME/.bash_profile'"
echo
