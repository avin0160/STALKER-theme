#!/bin/bash

# Advanced STALKER Icon Customizer
# Uses ImageMagick to recolor icons precisely

echo "=================================================="
echo "ADVANCED STALKER ICON CUSTOMIZER"
echo "=================================================="
echo ""

# Install ImageMagick if not present
if ! command -v convert &> /dev/null; then
    echo "Installing ImageMagick for icon processing..."
    sudo apt install -y imagemagick
fi

# Install inkscape for SVG processing
if ! command -v inkscape &> /dev/null; then
    echo "Installing Inkscape for SVG processing..."
    sudo apt install -y inkscape
fi

# STALKER color definitions
declare -A STALKER_COLORS=(
    ["primary"]="#5f7060"      # Muted green
    ["accent"]="#7a8a7d"       # Light green-gray
    ["highlight"]="#6b5f7b"    # Muted purple
    ["dark"]="#3a4d3e"         # Dark green
    ["light"]="#c9c5b4"        # Beige/cream
    ["folder"]="#5f7060"       # Folder color
    ["text"]="#2a3a2e"         # Text/icon dark
)

# Common icon colors to replace (from various icon themes)
declare -A REPLACE_COLORS=(
    ["blue"]="#5294e2"
    ["blue2"]="#4285f4"
    ["blue3"]="#4877b1"
    ["orange"]="#ff6905"
    ["red"]="#f44336"
    ["green"]="#4caf50"
    ["purple"]="#9c27b0"
    ["cyan"]="#00bcd4"
)

ICON_THEME="Papirus-Stalker-Custom"
ICON_DIR="$HOME/.local/share/icons/$ICON_THEME"

echo "[1/6] Creating custom icon theme directory..."
mkdir -p "$ICON_DIR"/{16x16,22x22,24x24,32x32,48x48,64x64,scalable}/{actions,apps,categories,devices,emblems,mimetypes,places,status}

# Copy base theme
echo ""
echo "[2/6] Copying base Papirus-Dark theme..."
if [ -d "/usr/share/icons/Papirus-Dark" ]; then
    cp -r /usr/share/icons/Papirus-Dark/* "$ICON_DIR/"
else
    echo "Warning: Papirus-Dark not found, creating from scratch..."
fi

# Function to recolor SVG files
recolor_svg() {
    local file=$1
    local temp_file="${file}.tmp"
    
    # Replace common colors with STALKER palette
    sed -e "s/#5294e2/${STALKER_COLORS[primary]}/gi" \
        -e "s/#4285f4/${STALKER_COLORS[accent]}/gi" \
        -e "s/#4877b1/${STALKER_COLORS[dark]}/gi" \
        -e "s/#ff6905/${STALKER_COLORS[highlight]}/gi" \
        -e "s/#f44336/${STALKER_COLORS[primary]}/gi" \
        -e "s/#4caf50/${STALKER_COLORS[accent]}/gi" \
        -e "s/#9c27b0/${STALKER_COLORS[highlight]}/gi" \
        -e "s/#00bcd4/${STALKER_COLORS[accent]}/gi" \
        "$file" > "$temp_file"
    
    mv "$temp_file" "$file"
}

# Function to recolor PNG files
recolor_png() {
    local file=$1
    # Use ImageMagick to shift hue/saturation to match STALKER palette
    convert "$file" -modulate 100,30,95 "${file}.tmp.png" 2>/dev/null
    if [ -f "${file}.tmp.png" ]; then
        mv "${file}.tmp.png" "$file"
    fi
}

echo ""
echo "[3/6] Recoloring folder icons..."
find "$ICON_DIR" -name "folder*.svg" -type f | while read icon; do
    recolor_svg "$icon"
done

echo ""
echo "[4/6] Recoloring application icons..."
for size in 48x48 64x64 scalable; do
    if [ -d "$ICON_DIR/$size/apps" ]; then
        find "$ICON_DIR/$size/apps" -name "*.svg" -type f | head -n 50 | while read icon; do
            recolor_svg "$icon"
        done
    fi
done

echo ""
echo "[5/6] Creating custom index.theme..."
cat > "$ICON_DIR/index.theme" << 'EOFTHEME'
[Icon Theme]
Name=Papirus-Stalker-Custom
Comment=Custom STALKER-themed icon set based on Papirus with atmospheric green/gray colors
Inherits=Papirus-Dark,breeze-dark,Adwaita,hicolor
Example=folder

# KDE/Plasma Specific
DisplayDepth=32
LinkOverlay=link_overlay
LockOverlay=lock_overlay
ZipOverlay=zip_overlay
DesktopDefault=48
DesktopSizes=16,22,24,32,48,64,128,256
ToolbarDefault=22
ToolbarSizes=16,22,24,32,48
MainToolbarDefault=22
MainToolbarSizes=16,22,24,32,48
SmallDefault=16
SmallSizes=16,22,24,32,48
PanelDefault=32
PanelSizes=16,22,24,32,48,64,128,256
DialogDefault=32
DialogSizes=16,22,24,32,48,64,128,256

FollowsColorScheme=true

Directories=16x16/actions,16x16/apps,16x16/devices,16x16/places,16x16/status,22x22/actions,22x22/apps,22x22/devices,22x22/places,22x22/status,24x24/actions,24x24/apps,24x24/devices,24x24/places,24x24/status,32x32/actions,32x32/apps,32x32/devices,32x32/places,32x32/status,48x48/actions,48x48/apps,48x48/devices,48x48/places,48x48/status,64x64/actions,64x64/apps,64x64/devices,64x64/places,64x64/status,scalable/actions,scalable/apps,scalable/devices,scalable/places,scalable/status

[16x16/actions]
Size=16
Context=Actions
Type=Fixed

[16x16/apps]
Size=16
Context=Applications
Type=Fixed

[16x16/devices]
Size=16
Context=Devices
Type=Fixed

[16x16/places]
Size=16
Context=Places
Type=Fixed

[16x16/status]
Size=16
Context=Status
Type=Fixed

[22x22/actions]
Size=22
Context=Actions
Type=Fixed

[22x22/apps]
Size=22
Context=Applications
Type=Fixed

[22x22/devices]
Size=22
Context=Devices
Type=Fixed

[22x22/places]
Size=22
Context=Places
Type=Fixed

[22x22/status]
Size=22
Context=Status
Type=Fixed

[24x24/actions]
Size=24
Context=Actions
Type=Fixed

[24x24/apps]
Size=24
Context=Applications
Type=Fixed

[24x24/devices]
Size=24
Context=Devices
Type=Fixed

[24x24/places]
Size=24
Context=Places
Type=Fixed

[24x24/status]
Size=24
Context=Status
Type=Fixed

[32x32/actions]
Size=32
Context=Actions
Type=Fixed

[32x32/apps]
Size=32
Context=Applications
Type=Fixed

[32x32/devices]
Size=32
Context=Devices
Type=Fixed

[32x32/places]
Size=32
Context=Places
Type=Fixed

[32x32/status]
Size=32
Context=Status
Type=Fixed

[48x48/actions]
Size=48
Context=Actions
Type=Fixed

[48x48/apps]
Size=48
Context=Applications
Type=Fixed

[48x48/devices]
Size=48
Context=Devices
Type=Fixed

[48x48/places]
Size=48
Context=Places
Type=Fixed

[48x48/status]
Size=48
Context=Status
Type=Fixed

[64x64/actions]
Size=64
Context=Actions
Type=Fixed

[64x64/apps]
Size=64
Context=Applications
Type=Fixed

[64x64/devices]
Size=64
Context=Devices
Type=Fixed

[64x64/places]
Size=64
Context=Places
Type=Fixed

[64x64/status]
Size=64
Context=Status
Type=Fixed

[scalable/actions]
Size=16
MinSize=16
MaxSize=256
Context=Actions
Type=Scalable

[scalable/apps]
Size=16
MinSize=16
MaxSize=256
Context=Applications
Type=Scalable

[scalable/devices]
Size=16
MinSize=16
MaxSize=256
Context=Devices
Type=Scalable

[scalable/places]
Size=16
MinSize=16
MaxSize=256
Context=Places
Type=Scalable

[scalable/status]
Size=16
MinSize=16
MaxSize=256
Context=Status
Type=Scalable
EOFTHEME

echo ""
echo "[6/6] Updating icon cache..."
gtk-update-icon-cache -f -t "$ICON_DIR" 2>/dev/null || true

echo ""
echo "=================================================="
echo "STALKER Icon Theme Created!"
echo "=================================================="
echo ""
echo "Theme Name: $ICON_THEME"
echo "Location: $ICON_DIR"
echo ""
echo "To apply the icon theme:"
echo ""
echo "GNOME/GTK:"
echo "  gsettings set org.gnome.desktop.interface icon-theme '$ICON_THEME'"
echo ""
echo "Or use Tweaks application:"
echo "  1. Open 'Tweaks'"
echo "  2. Go to 'Appearance'"
echo "  3. Select '$ICON_THEME' under Icons"
echo ""
echo "KDE/Plasma:"
echo "  System Settings > Appearance > Icons > $ICON_THEME"
echo ""
