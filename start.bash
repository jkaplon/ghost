#!/bin/bash

#
# start.bash
#

GHOST="/ghost"
OVERRIDE="/ghost-override"
CONTENT="content"

cd "$GHOST"

# Symlinks files.
if [[ -n $(ls -A "$OVERRIDE") ]]; then
  # Orig line to symlink all files in /ghost-override no worky. Copy only config.js for now.
  cp -frs "$OVERRIDE/config.js" "$GHOST" 2> /dev/null
fi
 
# Symlink content directory.
mkdir -p "$OVERRIDE/$CONTENT"
rm -fr "$CONTENT"
ln -s "$OVERRIDE/$CONTENT" content

npm start
