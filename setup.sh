#!/bin/sh

stow --verbose --target="$HOME" --no-folding --dotfiles  bash
stow --verbose --target="$HOME" --no-folding --dotfiles  fish
stow --verbose --target="$HOME" --no-folding --dotfiles  helix
stow --verbose --target="$HOME" --no-folding --dotfiles  bin
