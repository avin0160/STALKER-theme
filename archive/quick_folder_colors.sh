#!/bin/bash

# Quick STALKER Folder Color Changer
# Simple script to change just folder colors to STALKER theme

echo "=================================================="
echo "STALKER FOLDER COLOR CHANGER"
echo "=================================================="
echo ""

# Check if papirus-folders is installed
if ! command -v papirus-folders &> /dev/null; then
    echo "Installing papirus-folders tool..."
    wget -qO- https://git.io/papirus-folders-install | sh
fi

echo ""
echo "Available color options:"
echo "  - green (STALKER muted green)"
echo "  - grey (STALKER gray-green)"
echo "  - custom (use custom STALKER colors)"
echo ""

# Apply green color (closest to STALKER palette)
echo "Applying STALKER green to folders..."
papirus-folders -C green --theme Papirus-Dark

echo ""
echo "=================================================="
echo "Folder Colors Updated!"
echo "=================================================="
echo ""
echo "The folders now use a green color scheme that matches"
echo "the STALKER theme. For more customization, use the"
echo "advanced icon scripts."
echo ""
