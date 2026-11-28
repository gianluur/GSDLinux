#!/usr/bin/env bash
set -euo pipefail

# TODO: breaks when the KDE runtime goes beyond 6.11 (needs a new bundle)

# nothing to do if it's already installed
if flatpak info --system org.kde.KStyle.Darkly &>/dev/null; then
    exit 0
fi

flatpak install --system --noninteractive --assumeyes \
    /usr/share/darkly-flatpak/darkly.flatpak
