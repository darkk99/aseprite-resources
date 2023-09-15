#!/bin/bash

set -e

echo 'Running `install-deps.sh` script...'
$HOME/aseprite-resources/scripts/lib/install-deps.sh

echo 'Running `compile.sh` script...'
$HOME/aseprite-resources/scripts/lib/compile.sh

echo 'Running `setup-desktop-file.sh` script...'
$HOME/aseprite-resources/scripts/lib/setup-desktop-file.sh
