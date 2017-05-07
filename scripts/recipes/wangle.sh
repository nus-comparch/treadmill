#!/usr/bin/env bash

source common.sh

[ -d wangle ] || git clone https://github.com/facebook/wangle

cd "wangle/wangle/" || die "cd fail"

git checkout 84a466e079b0e84fa513a3dfd6add3a00450b4eb

LD_LIBRARY_PATH="$INSTALL_DIR/lib:$LD_LIBRARY_PATH" \
  LD_RUN_PATH="$INSTALL_DIR/lib:$LD_RUN_PATH" \
  LDFLAGS="-L$INSTALL_DIR/lib $LDFLAGS" \
  CPPFLAGS="-I$INSTALL_DIR/include $CPPFLAGS" \
  cmake -DCMAKE_INSTALL_PREFIX:PATH="$INSTALL_DIR" -DBUILD_TESTS=OFF .
make $MAKE_ARGS && make install $MAKE_ARGS
