#!/usr/bin/env bash
set -euo pipefail

if [[ "$HOSTNAME" == "archiso" ]]; then
  echo "Do NOT run on the installation medium, install arch first!"
  echo "https://wiki.archlinux.org/index.php/Installation_guide"
  exit 1
fi

if [[ ! -x "$(command -v pacman)" ]]; then
  echo "Missing pacman"
  echo "These dotfiles only support Arch Linux"
  exit 2
fi

if [[ ! -x "$(command -v git)" ]]; then
  echo "Missing git (how did you even get this repo?)"
  echo "pacman -S git"
  exit 2
fi

if [[ ! -x "$(command -v ssh)" ]]; then
  echo "Missing ssh (required for git)"
  echo "pacman -S openssh"
  exit 2
fi

if [[ ! -x "$(command -v python)" ]]; then
  echo "Missing python (required for dotbot)"
  echo "pacman -S python"
  exit 2
fi

if [[ "$EUID" -eq 0 ]] && [[ -z ${USER_ONLY+x} ]]; then
  echo "Do NOT run as root, create your own user!"
  echo "useradd -m -U USERNAME"
  echo "passwd USERNAME"
  exit 3
fi
