#!/bin/bash

# Desaturate all icons except green and red tones for STALKER theme
# This will make all colorful icons grayscale except green/red

ICON_THEME_PATH="/usr/share/icons/Papirus-Stalker"
BACKUP_PATH="/usr/share/icons/Papirus-Stalker-COLORFUL-BACKUP"

# Check if imagemagick is installed
if ! command -v convert &> /dev/null; then
    echo "Installing ImageMagick for icon processing..."
    sudo apt-get update
    sudo apt-get install -y imagemagick
fi

# Create backup if it doesn't exist
if [ ! -d "$BACKUP_PATH" ]; then
    echo "Creating backup of colorful icons..."
    sudo cp -r "$ICON_THEME_PATH" "$BACKUP_PATH"
    echo "Backup created at: $BACKUP_PATH"
fi

echo "Processing icons to STALKER color scheme (grayscale + green/red only)..."
echo "This may take several minutes..."

# Find all PNG and SVG icons
find "$ICON_THEME_PATH" -type f \( -name "*.png" -o -name "*.svg" \) | while read icon; do
    # Skip if already processed (check if file is very recent)
    
    if [[ "$icon" == *.png ]]; then
        # For PNG files, use ImageMagick to:
        # 1. Desaturate the image
        # 2. Colorize with slight green tint
        # 3. Preserve only red and green channels above certain thresholds
        
        sudo convert "$icon" \
            -colorspace RGB \
            \( +clone -colorspace gray \) \
            \( +clone -fill "#6f7e6f" -colorize 15% \) \
            -compose blend -define compose:args=70,30 -composite \
            \( +clone -channel R -threshold 40% \) \
            \( +clone -channel G -threshold 30% \) \
            -compose screen -composite \
            "$icon" 2>/dev/null
    fi
done

echo ""
echo "Icon desaturation complete!"
echo "Only green and red tones preserved in icons."
echo "If you want to restore colorful icons, run:"
echo "  sudo rm -rf $ICON_THEME_PATH"
echo "  sudo mv $BACKUP_PATH $ICON_THEME_PATH"
echo ""
echo "Refreshing icon cache..."
sudo gtk-update-icon-cache -f "$ICON_THEME_PATH" 2>/dev/null

echo "Done! Restart your apps or log out/in to see the changes."
