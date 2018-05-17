#!/usr/bin/env bash

source common.sh

[ -d mstch ] || git clone https://github.com/no1msd/mstch

cd "mstch/" || "cd fail"

git checkout 0fde1cf94c26ede7fa267f4b64c0efe5da81a77a

LD_LIBRARY_PATH="$INSTALL_DIR/lib:$LD_LIBRARY_PATH" \
  LD_RUN_PATH="$INSTALL_DIR/lib:$LD_RUN_PATH" \
  LDFLAGS="-L$INSTALL_DIR/lib $LDFLAGS" \
  CPPFLAGS="-I$INSTALL_DIR/include $CPPFLAGS" \
  cmake -DCMAKE_INSTALL_PREFIX:PATH="$INSTALL_DIR" .
make $MAKE_ARGS && make install $MAKE_ARGS
