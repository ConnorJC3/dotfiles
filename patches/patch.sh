#!/usr/bin/env bash

mkdir -p "$HOME/.cache/paru/clone"
for FILE in *.patch; do
  PACKAGE="${FILE%%.*}"
  git clone "https://aur.archlinux.org/$PACKAGE.git" "$HOME/.cache/paru/clone/$PACKAGE" &> /dev/null || true
  git -C "$HOME/.cache/paru/clone/$PACKAGE" apply "$PWD/$FILE" &> /dev/null || break
  git -C "$HOME/.cache/paru/clone/$PACKAGE" add -A > /dev/null
  git -C "$HOME/.cache/paru/clone/$PACKAGE" commit --author "ConnorJC Dotfiles <connorjc@localhost>" -m "Apply patch(es) from dotfiles" > /dev/null
done
