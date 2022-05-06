#!/usr/bin/env bash
set -euo pipefail

source ./config.sh
source ./check.sh

if [[ -z ${USER_ONLY+x} ]]; then
  if [[ -x "$(command -v paru)" ]]; then
    paru --noconfirm -Syu
  else
    sudo pacman --noconfirm -Syu
  fi
fi

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASEDIR}"
git -C "dotbot" submodule sync --quiet --recursive
git submodule update --init --recursive "dotbot"
git submodule update --init --recursive "dotbot-paru"

function invoke_dotbot {
  "${BASEDIR}/dotbot/bin/dotbot" -d "${BASEDIR}" -c "$1" --plugin-dir "${BASEDIR}/dotbot-paru"
}

if [[ -z ${BOOTSTRAP+x} ]]; then
  invoke_dotbot bootstrap-user.conf.yaml
  [[ -z ${USER_ONLY+x} ]] && invoke_dotbot bootstrap.conf.yaml
  echo "BOOTSTRAP=n" >> ./saved-config.sh
fi
[[ ${INTEL_GPU+x} ]] && invoke_dotbot intel-gpu.conf.yaml
[[ ${AMD_GPU+x} ]] && invoke_dotbot amd-gpu.conf.yaml
[[ ${NVIDIA_GPU+x} ]] && invoke_dotbot nvidia-gpu.conf.yaml
[[ ${GRAPHICAL+x} ]] && invoke_dotbot graphical-user.conf.yaml
[[ ${GRAPHICAL+x} ]] && [[ -z ${USER_ONLY+x} ]] && invoke_dotbot graphical.conf.yaml
invoke_dotbot main-user.conf.yaml
[[ -z ${USER_ONLY+x} ]] && invoke_dotbot main.conf.yaml
invoke_dotbot cleanup.conf.yaml

if [[ -z ${BOOTSTRAP+x} ]]; then
  echo
  echo
  if [[ ${USER_ONLY+x} ]]; then
    if [ -z "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
      echo "Changing shell to zsh, will likely prompt for password"
      chsh -s /usr/bin/zsh
    fi
  else
    echo "Changes (probably) require a reboot"
    read -n 1 -r -p "Reboot now? (y/n) " REBOOT_NOW
    if [[ $REBOOT_NOW =~ ^[Yy]$ ]]; then
      systemctl reboot
    fi
  fi
fi
