#!/usr/bin/env bash
set -euo pipefail

LATEST_VERSION=8

function ask_question {
  read -n 1 -r -p "${1} (y/n) " "$2"
  # move to new line
  echo
  if [[ "${!2}" =~ ^[Yy]$ ]]; then
    if [[ "$2" != "CONFIRM" ]]; then
      echo "$2=y" >> ./saved-config.sh
    fi
  else
    unset "$2"
  fi
}

function setup_config {
  while [[ -z ${CONFIRM+x} ]]; do
    rm -f ./saved-config.sh
    echo "#!/usr/bin/env bash" >> ./saved-config.sh

    ask_question "Graphical system?" GRAPHICAL
    [[ ${GRAPHICAL+x} ]] && ask_question "Using Intel iGPU?" INTEL_GPU
    [[ ${GRAPHICAL+x} ]] && ask_question "Using AMD GPU?" AMD_GPU
    [[ ${GRAPHICAL+x} ]] && ask_question "Using NVIDIA GPU?" NVIDIA_GPU
    ask_question "User only (skip ALL package installs and gloabl config)?" USER_ONLY
    ask_question "Confirm answers?" CONFIRM
    echo
  done

  # redo bootstrap if new version
  unset BOOTSTRAP
  # output last so config is redone if interrupted
  echo "VERSION=${LATEST_VERSION}" >> ./saved-config.sh
}

if [[ -f ./saved-config.sh ]]; then
  source ./saved-config.sh
  if [[ -z ${VERSION+x} ]]; then
    setup_config
  elif (( $VERSION < $LATEST_VERSION )); then
    setup_config
  fi
else
  setup_config
fi
