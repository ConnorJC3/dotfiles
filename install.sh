#!/usr/bin/env bash

set -e

source ./config.sh
source ./check.sh

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASEDIR}"
git -C "dotbot" submodule sync --quiet --recursive
git submodule update --init --recursive "dotbot"
git submodule update --init --recursive "dotbot-paru"

function invoke_dotbot {
  "${BASEDIR}/dotbot/bin/dotbot" -d "${BASEDIR}" -c "$1" --plugin-dir "${BASEDIR}/dotbot-paru"
}

if [[ -z $BOOTSTRAP ]]; then
  invoke_dotbot bootstrap.conf.yaml
  echo "BOOTSTRAP=n" >> ./saved-config.sh
fi
if [[ $BARE ]]; then
  invoke_dotbot bare.conf.yaml
fi
if [[ $NVIDIA_GPU ]]; then
  invoke_dotbot nvidia.conf.yaml
fi
if [[ $AMD_GPU ]]; then
  invoke_dotbot amd.conf.yaml
fi
if [[ $GRAPHICAL ]]; then
  invoke_dotbot graphical.conf.yaml
fi
invoke_dotbot main.conf.yaml

if [[ -z $BOOTSTRAP ]]; then
  echo "Changes require a reboot"
  read -n 1 -r -p "Reboot now? (y/n) " REBOOT_NOW
  if [[ $REBOOT_NOW =~ ^[Yy]$ ]]; then
    sudo reboot
  fi
fi
