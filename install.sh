#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then
  gfind . -maxdepth 1 -type d ! -name . ! -name .git -printf '%f\n' | gxargs -n1 stow --target=$HOME --restow --verbose
  exit
fi

find . -maxdepth 1 -type d ! -name . ! -name .git ! -name yabai ! -name skhd -printf '%f\n' | xargs -n1 stow --target=$HOME --restow --verbose
