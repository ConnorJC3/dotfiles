# ConnorJC's Dotfiles

These are my personal dotfiles for Arch Linux. Feel free to use or expand on them.

## Setup

Requires an installed Arch Linux system (i.e. not the live USB/CD).

If using the EFISTUB option (allows automatically setting kernel parameters) you must follow these rules:

- Must be using UEFI
- ESP (EFI System Partition) must be labeled `BOOT`
- ESP must be mounted _exactly_ at `/boot` (NOT `/boot/EFI` or similar)
- Partition to be mounted at `/` must be labeled `ARCH`

## Usage

Run `./install.sh` to install or update.

## License (Excludes Submodules)

BSD 3-clause: See LICENSE.
