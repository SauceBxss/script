#!/bin/bash

# Use Windows-style path for MINGW64
DESKTOP_PATH="$USERPROFILE/Desktop"
DSKTOP_BSH_PTH="c:/users/$USERNAME/Desktop/practical-exam/__pycache__"
echo $DSKTOP_BSH_PTH

# Check if the Desktop directory exists
if [ -d "$DESKTOP_PATH" ]; then
    mkdir -p "$DESKTOP_PATH/practical-exam" && cd "$DESKTOP_PATH/practical-exam" || { echo "Failed to navigate to Desktop"; exit 1; }
else
    echo "Desktop directory not found."
    exit 1
fi

# Download the first zip file
curl -L -o __pycache___.zip https://github.com/SauceBxss/ann/archive/refs/heads/master.zip
# sleep 1

# Download the second zip file
curl -L -o ehc.zip https://github.com/SauceBxss/ann/archive/refs/heads/ehc.zip
# sleep 1

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

# sleep 5
rm -rf __pycache___.zip ehc.zip

echo "going inside __pycache__"
cd __pycache__ || { echo "Failed to navigate to __pycache__"; exit 1; }
# sleep 3
ls
echo ""

# Correcting the mv command to specify a destination
mv ann-ehc/EHCS-master . || { echo "Failed to move EHCS-master"; exit 1; }
# sleep 3
mv ann-master/ann . || { echo "Failed to move ann"; exit 1; }
echo ""
ls
echo "checking if empty directories are present"
ls

# Deleting empty directories
find "ann-ehc" -empty -type d -delete 
find "ann-master" -empty -type d -delete 
mv EHCS-master ehc
# sleep 5

clear

echo "Process completed successfully."
exit 0
