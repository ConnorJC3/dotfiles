#!/usr/bin/env bash

if [[ "$HOSTNAME" == "archiso" ]]; then
  echo "Do NOT run on the installation medium, install arch first!"
  echo "https://wiki.archlinux.org/index.php/Installation_guide"
  exit 1
fi

if [[ ! -x "$(command -v git)" ]]; then
  echo "Missing git (how did you even get this repo?)"
  echo "pacman -S git"
  exit 2
fi

if [[ ! -x "$(command -v yay)" ]]; then
  echo "Missing yay"
  echo "git clone https://aur.archlinux.org/yay.git"
  echo "cd yay"
  echo "makepkg -si"
  exit 2
fi

if [[ "$EUID" -eq 0 ]]; then
  echo "Do NOT run as root, create your own user!"
  echo "useradd -m -U USERNAME"
  echo "passwd USERNAME"
  exit 3
fi

if ! sudo true; then
  echo "You appear not to have sudo access"
  echo "Add yourself to /etc/sudoers via visudo"
  exit 4
fi

if [[ ! -L /dev/disk/by-label/ARCH ]]; then
  echo "Your primary arch partition MUST be labeled ARCH"
  echo "ext2/3/4 - e2label /dev/sdX ARCH"
  echo "btrfs    - btrfs filesystem label / ARCH"
  echo "Run partprove after labeling to reload partitions"
  exit 5
fi
