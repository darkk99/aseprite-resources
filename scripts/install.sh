#!/bin/bash

set -e

echo "Making sure script isn't running as root..."
if [ "$EUID" = 0 ];then
  echo -e "Do not run this script as root.\nAborting..."
  exit 1
fi


echo 'Running `install-deps.sh` script...'
./lib/install-deps.sh

echo 'Running `compile.sh` script...'
./lib/compile.sh

echo 'Running `setup-desktop-file.sh` script...'
./lib/setup-desktop-file.sh
