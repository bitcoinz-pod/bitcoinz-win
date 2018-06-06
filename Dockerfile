FROM debian:stretch-slim

# Install our build dependencies
RUN apt-get update \
&& apt-get install -y \
    curl \
    build-essential \
    pkg-config \
    libc6-dev \
    m4 \
    g++-multilib \
    autoconf \
    libtool \
    ncurses-dev \
    unzip \
    git \
    python \
    zlib1g-dev \
    wget \
    bsdmainutils \
    automake \
    p7zip-full \
    pwgen \
    mingw-w64 \
    cmake \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/src/
COPY . /usr/local/src/

RUN ./zcutil/build-win.sh --disable-rust -j$(nproc)
