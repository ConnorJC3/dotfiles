#!/usr/bin/env bash

LATEST_VERSION=3

function ask_question {
  read -n 1 -r -p "$1" "$2"
  # move to new line
  echo
  if [[ "${!2}" =~ ^[Yy]$ ]]; then
    echo "$2=y" >> ./saved-config.sh
  else
    unset "$2"
  fi
}

function setup_config {
  while [[ -z $CONFIRM ]]; do
    rm -f ./saved-config.sh
    echo "#!/usr/bin/env bash" >> ./saved-config.sh

    ask_question "Graphical system (no means cmdline only)? (y/n) " GRAPHICAL
    ask_question "Running on bare metal (setup EFISTUB)? (y/n) " BARE
    ask_question "Using NVIDIA graphics card? (y/n) " NVIDIA_GPU
    ask_question "Using AMD graphics card (y/n) " AMD_GPU
    ask_question "Using Intel processor (y/n) " INTEL_CPU
    ask_question "Using AMD processor (y/n) " AMD_CPU
    ask_question "Confirm answers (y/n) " CONFIRM
  done

  # redo bootstrap if new version
  unset BOOTSTRAP
  # output last so config is redone if interrupted
  echo "VERSION=${LATEST_VERSION}" >> ./saved-config.sh
}

if [[ -f ./saved-config.sh ]]; then
  source ./saved-config.sh
  if [[ -z $VERSION ]]; then
    setup_config
  elif (( $VERSION < $LATEST_VERSION )); then
    setup_config
  fi
else
  setup_config
fi
