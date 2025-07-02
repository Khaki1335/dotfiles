#!/bin/bash
set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")/../files" && pwd)"

for dotfile in "$DOTFILES_DIR"/.??*; do
  target="$HOME/$(basename $dotfile)"
  if [ -f "$target" ]; then
    rm $target
    echo Deleted "$target".
  elif [ -d "$target" ]; then
    rm -rf $target
    echo Deleted "$target".
  fi

done
