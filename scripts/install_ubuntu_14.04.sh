#!/usr/bin/env bash

set -ex

[ -n "$1" ] || ( echo "Install dir missing"; exit 1 )

sudo apt-get update

sudo apt-get install -y \
  autoconf \
  autoconf-archive \
  automake \
  binutils-dev \
  bison \
  cmake3 \
  dpkg \
  flex \
  g++ \
  gcc \
  g++-5 \
  gcc-5 \
  git \
  libboost-all-dev \
  libdouble-conversion-dev \
  libevent-dev \
  libgflags-dev \
  libgoogle-glog-dev \
  libiberty-dev \
  libjemalloc-dev \
  libkrb5-dev \
  liblzma-dev \
  libnuma-dev \
  libsnappy-dev \
  libsasl2-dev \
  libssl-dev \
  libtool \
  make \
  pkg-config \
  python-dev \
  ragel \
  scons \
  zlib1g-dev \
  zip

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 50
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 50

cd "$(dirname "$0")" || ( echo "cd fail"; exit 1 )

./get_and_build_everything.sh ubuntu-14.04 "$@"
