#!/usr/bin/bash

echo "::group:: ===$(basename "$0")==="

set -eoux pipefail

# Add Staging repo
dnf5 -y copr enable ublue-os/staging

# Add Packages repo
dnf5 -y copr enable ublue-os/packages

# Add OpenRazer repo
dnf5 -y config-manager addrepo --from-repofile=https://openrazer.github.io/hardware:razer.repo

# Enable repo for scx-scheds
dnf5 -y copr enable bieszczaders/kernel-cachyos-addons

# Enable Terra repo
dnf5 -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release{,-extras}

# Enable sunshine repo
dnf5 -y copr enable lizardbyte/beta

dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable erikreider/SwayNotificationCenter
dnf5 -y copr enable pgdev/ghostty
dnf5 -y copr enable wezfurlong/wezterm-nightly

echo "::endgroup::"
