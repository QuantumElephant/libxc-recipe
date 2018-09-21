#!/usr/bin/env bash

env

export FC="ccache $FC"
export CC="ccache $CC"
export CXX="ccache $CXX"

# configure
./configure --prefix=${PREFIX} --enable-shared=yes --enable-static=no

# build
make -j${CPU_COUNT}

# install
make install

# check
LD_LIBRARY_PATH=${PREFIX}/lib make check
