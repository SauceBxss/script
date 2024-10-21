#!/bin/bash

# Use Windows-style path for MINGW64
DESKTOP_PATH="$USERPROFILE/Desktop"

# Check if the Desktop directory exists
if [ -d "$DESKTOP_PATH" ]; then
    mkdir -p "$DESKTOP_PATH/practical-exam" && cd "$DESKTOP_PATH/practical-exam" || { echo "Failed to navigate to Desktop"; exit 1; }
else
    echo "Desktop directory not found."
    exit 1
fi

# Download the first zip file
curl -L -o __pycache___.zip https://github.com/SauceBxss/ann/archive/refs/heads/master.zip
sleep 2

# Download the second zip file
curl -L -o ehc.zip https://github.com/SauceBxss/ann/archive/refs/heads/ehc.zip

sleep 2

# Check if unzip is installed, if not install it


if command -v unzip > /dev/null; then
    mkdir -p __pycache__
    unzip __pycache___.zip -d __pycache__
    unzip ehc.zip -d __pycache__
else 
    echo "Unzip not found, installing..."
    sudo apt install -y unzip
    echo "Unzip installed, continuing..."
    mkdir -p __pycache__
    unzip __pycache___.zip -d __pycache__
    unzip ehc.zip -d __pycache__
fi 

sleep 2

rm -rf __pycache___.zip ehc.zip

clear

echo "Process completed successfully."
exit 0
