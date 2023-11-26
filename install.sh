#!/bin/sh

find -maxdepth 1 -type d ! -name . ! -name .git -printf '%f\n' | xargs -n1 stow --target=$HOME --restow --verbose
