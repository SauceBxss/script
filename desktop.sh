#!/bin/bash

# Suppress the locale warning
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

# Hardcode the Desktop path for Windows (replace 'srihari' with your actual Windows username if needed)
DESKTOP_PATH="/mnt/c/Users/srihari/Desktop"

# Check if the Desktop directory exists
if [ -d "$DESKTOP_PATH" ]; then
    cd "$DESKTOP_PATH" || { echo "Failed to navigate to Desktop"; exit 1; }
else
    echo "Desktop directory not found."
    exit 1
fi

# Download the first zip file
curl -LO https://github.com/harshau007/cse/archive/refs/heads/main.zip -o ___pycache___.zip
sleep 2

# Download the second zip file
curl -LO https://github.com/Amxn-2/EHCS/archive/refs/heads/master.zip -o system.zip
sleep 2

# Check if unzip is installed, if not, install it
if [[ $(command -v unzip) ]]; then
    mkdir -p ___pycache___
    unzip ___pycache___.zip -d ___pycache___ 
else 
    echo "Unzip not found, installing..."
    sudo apt install -y unzip
    mkdir -p ___pycache___
    unzip ___pycache___.zip -d ___pycache___
fi 

echo "Process completed successfully."
exit 0
