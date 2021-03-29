#!/usr/bin/env bash

source ../saved-config.sh
# Quiet boot
KERNEL=" quiet loglevel=3 rd.udev.log-priority=3 vt.global_cursor_default=0"
# CPU specific (VFIO, ucode)
if [[ $INTEL_CPU ]]; then
  KERNEL="$KERNEL intel_iommu=on"
  EXTRA_INITRD="initrd=\intel-ucode.img "
elif [[ $AMD_CPU ]]; then
  KERNEL="$KERNEL amd_iommu=on"
fi
# NVIDIA
if [[ $NVIDIA ]]; then
  KERNEL="$KERNEL nvidia-drm.modeset=1"
fi

# Locate boot partition
PARTITION=`readlink -f /dev/disk/by-label/BOOT`
# Delete old entries
while efibootmgr | grep "Arch Linux" > /dev/null; do
  TARGET=`efibootmgr | grep "Arch Linux" -m 1`
  efibootmgr --part "${PARTITION:8}" --delete-bootnum --bootnum "${TARGET:4:4}" > /dev/null
done
# Create new entry
efibootmgr --part "${PARTITION:8}" --create --label "Arch Linux" --loader "\vmlinuz-linux" --unicode "root=LABEL=ARCH rw ${EXTRA_INITRD}initrd=\initramfs-linux.img${KERNEL}" > /dev/null

# Set entry as default
ENTRY=`efibootmgr | grep "Arch Linux" -m 1`
efibootmgr --part "${PARTITION:8}" --bootorder "${ENTRY:4:4}" > /dev/null
efibootmgr --part "${PARTITION:8}" --timeout 0 > /dev/null
