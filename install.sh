#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Installing .files for macOS..."
  gfind . -maxdepth 1 -type d ! -name . ! -name .git ! -name macos -printf '%f\n' | gxargs -n1 stow --target=$HOME --restow --verbose
  cd macos
  gfind . -maxdepth 1 -type d ! -name . -printf '%f\n' | gxargs -n1 stow --target=$HOME --restow --verbose
  echo "Done."
  exit
fi

echo "Installing .files..."
find . -maxdepth 1 -type d ! -name . ! -name .git ! -name macos -printf '%f\n' | xargs -n1 stow --target=$HOME --restow --verbose
echo "Done."
