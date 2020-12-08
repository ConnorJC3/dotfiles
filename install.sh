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
if [[ $NVIDIA ]]; then
  invoke_dotbot nvidia.conf.yaml
fi
invoke_dotbot main.conf.yaml
