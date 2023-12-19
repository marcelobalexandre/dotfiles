#!/bin/sh

find="find"
xargs="xargs"
if [[ "$OSTYPE" == "darwin"* ]]; then
  find="gfind"
  xargs="gxargs"
fi

eval "$find . -maxdepth 1 -type d ! -name . ! -name .git -printf '%f\n'" | eval "$xargs -n1 stow --target=$HOME --restow --verbose"
