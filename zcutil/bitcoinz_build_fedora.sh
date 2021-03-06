#!/usr/bin/env bash

# actually untested, sorry

cd "$(dirname "$(readlink -f "$0")")"    #'"%#@!

sudo dnf install \
      git pkgconfig automake autoconf ncurses-devel python \
      python-zmq wget gtest-devel gcc gcc-c++ libtool patch

./fetch-params.sh || exit 1

./build.sh --disable-tests --disable-rust -j$(nproc) || exit 1

if [ ! -r ~/.bitcoinz/bitcoinz.conf ]; then
   mkdir -p ~/.bitcoinz
   echo "addnode=mainnet.bitcoinz.site" >~/.bitcoinz/bitcoinz.conf
   echo "rpcuser=username" >>~/.bitcoinz/bitcoinz.conf
   echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >>~/.bitcoinz/bitcoinz.conf
fi

cd ../src/
cp -f zcashd bitcoinzd
cp -f zcash-cli bitcoinz-cli
cp -f zcash-tx bitcoinz-tx

echo ""
echo "--------------------------------------------------------------------------"
echo "Compilation complete. Now you can run ./src/bitcoinzd to start the daemon."
echo "It will use configuration file from ~/.bitcoinz/bitcoinz.conf"
echo ""
