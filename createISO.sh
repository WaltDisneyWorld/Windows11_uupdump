#!/bin/sh

# Copyright (C) 2021 Lacia chan / Lyceris chan <ghostdrain@outlook.com>
# SPDX-License-Identifier: GPL-3.0-only

# Save last modified file to variable
lastModified="$(ls -1t | head -1)"

# Save last modified file without file extension to variable
fileName="${lastModified%.*}"

# Unzip lastModified to fileName
unzip $lastModified -d $fileName

# Change directory to $fileName
cd $fileName

# Install dependencies as mentioned by uup_download_linux.sh
sudo apt-get install aria2 cabextract wimtools chntpw genisoimage

# Clear terminal of previous commands
clear

# Make the script executable
chmod +x uup_download_linux.sh

# Run the script
./uup_download_linux.sh

# Clear terminal of previous commands
clear

# Hash the image using SHA256 and MD5
SHA256SUM="$(sha256sum *.ISO)"
MD5SUM="$(md5sum *.ISO)"

echo SHA256SUM = $SHA256SUM
echo MD5SUM = $MD5SUM

# Upload file to transfer.sh
curl --upload-file *.ISO https://transfer.sh