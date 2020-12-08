#!/usr/bin/env bash

LATEST_VERSION=1

function ask_question {
  read -n 1 -r -p "$1" "$2"
  # move to new line
  echo
  if [[ ! "${!2}" =~ ^[Yy]$ ]]; then
    unset "$2"
  else
    echo "$2=y" >> ./saved-config.sh
  fi
}

function setup_config {
  rm -f ./saved-config.sh
  echo "#!/usr/bin/env bash" >> ./saved-config.sh

  ask_question "Running on bare metal? (y/n) " BARE
  ask_question "Using NVIDIA graphics card (y/n) " NVIDIA

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
