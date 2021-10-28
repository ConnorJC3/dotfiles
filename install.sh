#!/usr/bin/env bash

set -e

source ./config.sh
source ./check.sh

if [[ -x "$(command -v paru)" ]]; then
  paru --noconfirm -Syu
else
  sudo pacman --noconfirm -Syu
fi

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
[[ $EFISTUB ]] && invoke_dotbot efistub.conf.yaml
[[ $INTEL_CPU ]] && invoke_dotbot intel-cpu.conf.yaml
[[ $AMD_CPU ]] && invoke_dotbot amd-cpu.conf.yaml
[[ $INTEL_GPU ]] && invoke_dotbot intel-gpu.conf.yaml
[[ $AMD_GPU ]] && invoke_dotbot amd-gpu.conf.yaml
[[ $NVIDIA_GPU ]] && invoke_dotbot nvidia-gpu.conf.yaml
invoke_dotbot main.conf.yaml
# Intentially last because it starts SDDM
[[ $GRAPHICAL ]] && invoke_dotbot graphical.conf.yaml

if [[ -z $BOOTSTRAP ]]; then
  echo "Changes require a reboot"
  read -n 1 -r -p "Reboot now? (y/n) " REBOOT_NOW
  if [[ $REBOOT_NOW =~ ^[Yy]$ ]]; then
    sudo reboot
  fi
fi
