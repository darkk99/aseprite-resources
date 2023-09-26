#!/bin/sh
#
ASEPRITE_RESOURCES_DIR=$(cd .. && pwd)

set -e
echo 'NOTE: This script *requires* the `install-deps.sh` script to function properly.'
cd $ASEPRITE_RESOURCES_DIR/aseprite
[ -f ./build ] && rm ./build -rf
git pull
git submodule update --init --recursive
mkdir build
cd build
export CC=clang
export CXX=clang++
cmake \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_CXX_FLAGS:STRING=-stdlib=libc++ \
  -DCMAKE_EXE_LINKER_FLAGS:STRING=-stdlib=libc++ \
  -DLAF_BACKEND=skia \
  -DSKIA_DIR=$HOME/aseprite-resources/deps/skia \
  -DSKIA_LIBRARY_DIR=$HOME/aseprite-resources/deps/skia/out/Release-x64 \
  -DSKIA_LIBRARY=$HOME/aseprite-resources/deps/skia/out/Release-x64/libskia.a \
  -G Ninja \
  ..
ninja aseprite
echo "\n\n\n\n\n"'Done! Installed binary `aseprite` into '"$HOME/aseprite-resources/aseprite/build/bin/aseprite.\nPlease do not delete or move this file or the .desktop file will not work.\nDo not share this binary with others online, as that doesn't comply with Aseprite's license."
