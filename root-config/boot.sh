#!/usr/bin/env bash

source `dirname "$0"`/../saved-config.sh
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
if [[ $NVIDIA_GPU ]]; then
  KERNEL="$KERNEL nvidia-drm.modeset=1"
fi

# Locate boot partition
PARTITION_PATH=`readlink -f /dev/disk/by-label/BOOT`
PARTITION=`grep -Eo '[0-9]+$' <<< "$PARTITION_PATH"`
DISK=/dev/`lsblk -no PKNAME "$PARTITION_PATH"`
# Delete old entries
while efibootmgr | grep "Arch Linux" > /dev/null; do
  TARGET=`efibootmgr | grep "Arch Linux" -m 1`
  efibootmgr --disk "$DISK" --part "$PARTITION" --delete-bootnum --bootnum "${TARGET:4:4}" > /dev/null
done
# Create new entry
efibootmgr --disk "$DISK" --part "$PARTITION" --create --label "Arch Linux" --loader "\vmlinuz-linux" --unicode "root=LABEL=ARCH rw ${EXTRA_INITRD}initrd=\initramfs-linux.img${KERNEL}" > /dev/null

# Set entry as default
ENTRY=`efibootmgr | grep "Arch Linux" -m 1`
efibootmgr --disk "$DISK" --part "$PARTITION" --bootorder "${ENTRY:4:4}" > /dev/null
efibootmgr --disk "$DISK" --part "$PARTITION" --timeout 0 > /dev/null
