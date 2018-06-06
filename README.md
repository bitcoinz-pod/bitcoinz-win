# BitcoinZ Windows Command Line Wallet
**Keep running wallet to strengthen the BitcoinZ network. Backup your wallet in
many locations & keep your coins wallet offline.**

### Ports:
- RPC port: 1979
- P2P port: 1989

Build Instructions
-----------------
The BitcoinZ Windows Command Line Wallet can only be built from ubuntu for now.

Install required dependencies:
```
apt-get update \
&& apt-get install -y \
    curl build-essential pkg-config libc6-dev m4 g++-multilib autoconf \
    libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils \
    automake p7zip-full pwgen mingw-w64 cmake
```

Execute the build command:
```
./zcutil/build-win.sh --disable-rust -j$(nproc)
```

### Windows Wallet
Windows wallet build is maintained in [bitcoinz-wallet project](https://github.com/btcz/bitcoinz-wallet).

Security Warnings
-----------------

**BitcoinZ is experimental and a work-in-progress.** Use at your own risk.
