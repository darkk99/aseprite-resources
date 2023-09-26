#!/bin/sh

ASEPRITE_RESOURCES_DIR=$(cd .. && pwd)

cp $ASEPRITE_RESOURCES_DIR/desktop/aseprite.desktop $HOME/Desktop
cp $ASEPRITE_RESOURCES_DIR/desktop/aseprite.desktop $HOME/.local/share/applications
cp $ASEPRITE_RESOURCES_DIR/desktop/logo.png $HOME/.local/share/icons/hicolor/128x128/apps/aseprite.png
