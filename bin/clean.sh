#!/bin/bash
set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")/../files" && pwd)"

for dotfile in "$DOTFILES_DIR"/.??*; do
  link="$HOME/$(basename $dotfile)"
  readlink $link > /dev/null
  result=$?

  if [ $result -eq 0 ]; then
    rm $link
    echo Deleted "$link".
  fi
done
