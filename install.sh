#!/bin/bash

set -e

# ============================================
# Stylized Intro
# ============================================
clear
echo "
 +-+-+-+-+-+-+-+-+-+-+-+-+-+ 
 |j|u|s|t|a|g|u|y|l|i|n|u|x| 
 +-+-+-+-+-+-+-+-+-+-+-+-+-+ 
 |d|w|m| | | | |s|c|r|i|p|t|  
 +-+-+-+-+-+-+-+-+-+-+-+-+-+                                                                            
"

echo "This script will install and configure DWM on your Debian system."
read -p "Do you want to continue? (y/n) " confirm
[[ ! "$confirm" =~ ^[Yy]$ ]] && {
    echo "Installation aborted."
    exit 1
}

# ============================================
# Install Directory
# ============================================
INSTALL_DIR="/tmp/dwm-install"
mkdir -p "$INSTALL_DIR" || {
    echo "Failed to create install dir"
    exit 1
}

cleanup() {
    rm -rf "$INSTALL_DIR"
    echo "Installation directory cleaned up."
}
trap cleanup EXIT

# ============================================
# Update System First
# ============================================
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get clean

# ============================================
# Pull Setup Scripts from butterscripts Repo
# ============================================
REPO_URL="https://raw.githubusercontent.com/drewgrif/butterscripts/main/setup"

download_and_run() {
    local script="$1"
    echo "Running: $script"
    curl -fsSL "$REPO_URL/$script" | bash
}

# ============================================
# Run Modular Setup Scripts
# ============================================

download_and_run "00-base.sh"
download_and_run "01-apps.sh"
download_and_run "02-wm-dwm.sh"
download_and_run "install-picom-ftlabs.sh"
download_and_run "03-themes.sh"
download_and_run "04-browsers.sh"
download_and_run "05-neovim-config.sh"
download_and_run "06-zram.sh"
download_and_run "07-postinstall.sh"
