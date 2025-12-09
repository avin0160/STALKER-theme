#!/bin/bash

# AGGRESSIVE desaturation - make icons truly grayscale with minimal color

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  STALKER Aggressive Icon Desaturation                     ║"
echo "║  Converting all icons to grayscale + subtle green tint    ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Function to aggressively desaturate
aggressive_desaturate() {
    local icon="$1"
    
    [ ! -r "$icon" ] && return
    [ ! -w "$icon" ] && return
    
    # AGGRESSIVE desaturation:
    # 1. Convert completely to grayscale
    # 2. Apply very subtle green tint (5% only)
    # 3. Reduce saturation to nearly zero
    # 4. Keep only pure reds if they exist (like Firefox)
    
    sudo convert "$icon" \
        -colorspace Gray \
        -colorspace RGB \
        -modulate 100,15,100 \
        \( +clone -fill "#6f7e6f" -colorize 3% \) \
        -compose Over -composite \
        "$icon" 2>/dev/null
    
    echo -n "."
}

echo "[1/3] Processing dash icons (these are the most visible)..."

# Process all icon sizes that appear in the dash
for dir in /usr/share/icons/*/; do
    for size in 48x48 64x64 96x96 128x128 256x256; do
        find "$dir$size/apps" -name "*.png" -type f 2>/dev/null | while read icon; do
            aggressive_desaturate "$icon"
        done
    done
done

echo ""
echo "[2/3] Processing application pixmaps..."

find /usr/share/pixmaps -name "*.png" -type f 2>/dev/null | while read icon; do
    aggressive_desaturate "$icon"
done

echo ""
echo "[3/3] Processing .desktop file icons..."

# Many apps embed their icon paths - process those too
find /usr/share/applications -name "*.desktop" -type f -exec grep -l "^Icon=" {} \; | while read desktop; do
    icon_name=$(grep "^Icon=" "$desktop" | head -1 | cut -d'=' -f2)
    
    # Try to find the actual icon file
    for ext in png svg xpm; do
        for size in 48 64 96 128 256; do
            icon_path="/usr/share/icons/hicolor/${size}x${size}/apps/${icon_name}.${ext}"
            [ -f "$icon_path" ] && aggressive_desaturate "$icon_path"
        done
    done
done

echo ""
echo "[4/3] Clearing icon caches..."

# Clear all icon caches
sudo gtk-update-icon-cache -f /usr/share/icons/hicolor 2>/dev/null
sudo gtk-update-icon-cache -f /usr/share/icons/Adwaita 2>/dev/null

# Force GNOME to refresh
rm -rf ~/.cache/thumbnails/*
rm -rf ~/.cache/icon-cache.kcache

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║  Aggressive desaturation complete!                        ║"
echo "║                                                            ║"
echo "║  All icons should now be grayscale with subtle green tint ║"
echo "║                                                            ║"
echo "║  Restart GNOME Shell: Alt+F2, type 'r', press Enter       ║"
echo "╚════════════════════════════════════════════════════════════╝"
