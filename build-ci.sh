#!/bin/bash
set -euo pipefail

# Source variables from environment or defaults
VER="${PACKAGE_VERSION:-$(sed -En 's/^PACKAGE_VERSION="(.*)"/\1/p' /tmp/oc-XeWBqc/repo/dkms.conf)}"
DRV_NAME=rtl88x2bu

echo "Starting CI/CD build for ${DRV_NAME} v${VER}"

# Verify root privileges
if [ "$(id -u)" != "0" ]; then
    echo "ERROR: Root privileges required" >&2
    exit 1
fi

# Execute build steps
echo "Syncing source to /usr/src/${DRV_NAME}-${VER}"
rsync -rh /tmp/oc-XeWBqc/repo/ /usr/src/"${DRV_NAME}"-"${VER}"

echo "Adding module to DKMS"
dkms add -m "${DRV_NAME}" -v "${VER}" 2>/dev/null || true

echo "Building module with DKMS"
dkms build -m "${DRV_NAME}" -v "${VER}"

echo "Installing module with DKMS"
dkms install -m "${DRV_NAME}" -v "${VER}"

echo "Loading module"
sudo modprobe 88x2bu

echo "CI/CD build completed successfully"