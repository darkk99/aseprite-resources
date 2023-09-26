#!/bin/sh
#
ASEPRITE_RESOURCES_DIR=$(cd .. && pwd)
echo $ASEPRITE_RESOURCES_DIR

set -e
echo 'NOTE: This script *requires* the `install-deps.sh` script to function properly.'
cd $ASEPRITE_RESOURCES_DIR/aseprite
[ -f ./build ] && rm ./build -rf
git pull
git submodule update --init --recursive
mkdir -p build
cd build
export CC=clang
export CXX=clang++
cmake \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_CXX_FLAGS:STRING=-stdlib=libc++ \
  -DCMAKE_EXE_LINKER_FLAGS:STRING=-stdlib=libc++ \
  -DLAF_BACKEND=skia \
  -DSKIA_DIR=$ASEPRITE_RESOURCES_DIR/skia \
  -DSKIA_LIBRARY_DIR=$ASEPRITE_RESOURCES_DIR/skia/out/Release-x64 \
  -DSKIA_LIBRARY=$ASEPRITE_RESOURCES_DIR/skia/out/Release-x64/libskia.a \
  -G Ninja \
  ..
ninja aseprite
