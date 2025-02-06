#!/bin/bash
set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")/../files" && pwd)"

for dotfile in "$DOTFILES_DIR"/.??*; do
  ln -nsv "$dotfile" "$HOME"
done
