#!/bin/bash
export LD_LIBRARY_PATH="/usr/local/lib64"
sed -i '26s/.*/OS_VERSION=ubuntu1604/' *scripts/build.sh
./scripts/build.sh
cd remill-build
make install
