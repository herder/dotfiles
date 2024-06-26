#!/usr/bin/env bash
#

SOPS_LATEST_VERSION=$(curl -sL "https://api.github.com/repos/mozilla/sops/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')

OUTPUT_DIR=$(mktemp -d)
echo "Downloading sops version $SOPS_LATEST_VERSION"

curl -Lo $OUTPUT_DIR/sops.deb "https://github.com/mozilla/sops/releases/latest/download/sops_${SOPS_LATEST_VERSION}_amd64.deb"

echo "Installing $OUTPUT_DIR/sops.deb"
sudo apt --fix-broken install $OUTPUT_DIR/sops.deb

sudo rm -rf $OUTPUT_DIR/sops.deb
