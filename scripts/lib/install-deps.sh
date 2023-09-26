#!/bin/sh
# This script *should* be compatible with POSIX sh. If you are using a sh or a POSIX
# compliant shell and this script errors, please create an Issue on the repo.

set -e

ASEPRITE_RESOURCES_DIR=$(cd .. && pwd)
SKIA_DIR=$ASEPRITE_RESOURCES_DIR/skia
ASEPRITE_DIR=$ASEPRITE_RESOURCES_DIR/aseprite

echo "Determining which package manager to use..."
if [ -f /usr/bin/apt-get ]; then
  echo "Installing dependencies..."
  sudo apt-get install g++ clang libc++-dev libc++abi-dev cmake ninja-build git libx11-dev libxcursor-dev libxi-dev libgl1-mesa-dev libfontconfig1-dev unzip
elif [ -f /usr/bin/dnf ]; then
  echo "Installing dependencies..."
  sudo dnf install gcc-c++ clang libcxx-devel cmake ninja-build libX11-devel git libXcursor-devel libXi-devel mesa-libGL-devel fontconfig-devel unzip
elif [ -f /usr/bin/pacman ]; then
  echo "Installing dependencies..."
  sudo pacman -S gcc clang libc++ cmake ninja libx11 libxcursor mesa-libgl git fontconfig --needed unzip
elif [ -f /usr/bin/pacman ]; then
  echo "Installing dependencies..."
  sudo zypper install gcc-c++ clang libc++-devel libc++abi-devel cmake ninja git libX11-devel libXcursor-devel libXi-devel Mesa-libGL-devel fontconfig-devel unzip
else
  echo "Your package manager is unsupported by this part of the script. Refer to the Aseprite Github page for installing the rest of the dependencies."
fi

if [ ! -d $ASEPRITE_DIR ]; then
  echo "Cloning aseprite/aseprite.git..."
  git clone --recursive https://github.com/aseprite/aseprite.git $ASEPRITE_DIR
fi

if [ ! -d $SKIA_DIR ]; then
  echo "Downloading Skia m102..."
  wget https://github.com/aseprite/skia/releases/download/m102-861e4743af/Skia-Linux-Release-x64-libc++.zip -P /tmp

  echo "Making directory $SKIA_DIR..."
  mkdir -p $ASEPRITE_RESOURCES_DIR/skia

  echo "Unzipping /tmp/Skia-Linux-Release-x64-libc++.zip into $SKIA_DIR..."
  unzip /tmp/Skia-Linux-Release-x64-libc++.zip -d $SKIA_DIR
fi


