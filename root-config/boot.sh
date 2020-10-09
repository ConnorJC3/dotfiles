#!/usr/bin/env bash

QUIET="quiet loglevel=3 rd.udev.log-priority=3 vt.global_cursor_default=0"
VFIO="intel_iommu=on"
NVIDIA="nvidia-drm.modeset=1"
KERNEL="${QUIET} ${VFIO} ${NVIDIA}"

PARTITION=`readlink -f /dev/disk/by-label/BOOT`
while efibootmgr | grep "Arch Linux" > /dev/null; do
  TARGET=`efibootmgr | grep "Arch Linux" -m 1`
  efibootmgr --part "${PARTITION:8}" --delete-bootnum --bootnum "${TARGET:4:4}" > /dev/null
done

efibootmgr --part "${PARTITION:8}" --create --label "Arch Linux" --loader "\vmlinuz-linux" --unicode "root=LABEL=ARCH rw initrd=\intel-ucode.img initrd=\initramfs-linux.img ${KERNEL}" > /dev/null

ENTRY=`efibootmgr | grep "Arch Linux" -m 1`
efibootmgr --part "${PARTITION:8}" --bootorder "${ENTRY:4:4}" > /dev/null
efibootmgr --part "${PARTITION:8}" --timeout 0 > /dev/null
