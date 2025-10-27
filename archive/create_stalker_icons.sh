#!/bin/bash

# STALKER Icon Theme Creator
# Recolors Papirus icons to match STALKER theme colors

echo "=================================================="
echo "STALKER ICON THEME CREATOR"
echo "=================================================="
echo ""

# STALKER Color Palette
STALKER_GREEN="#5f7060"
STALKER_ACCENT="#7a8a7d"
STALKER_PURPLE="#6b5f7b"
STALKER_DARK="#3a4d3e"
STALKER_LIGHT="#c9c5b4"

# Create icon theme directory
ICON_DIR="$HOME/.local/share/icons/Papirus-Stalker"
echo "[1/4] Creating icon theme directory..."
mkdir -p "$ICON_DIR"

# Check if Papirus is installed
if [ ! -d "/usr/share/icons/Papirus-Dark" ]; then
    echo "Error: Papirus-Dark not found. Installing..."
    sudo apt install -y papirus-icon-theme
fi

# Copy Papirus-Dark as base
echo ""
echo "[2/4] Copying Papirus-Dark as base theme..."
cp -r /usr/share/icons/Papirus-Dark/* "$ICON_DIR/"

# Create custom index.theme
echo ""
echo "[3/4] Creating custom theme index..."
cat > "$ICON_DIR/index.theme" << EOF
[Icon Theme]
Name=Papirus-Stalker
Comment=Papirus icon theme with STALKER color scheme
Inherits=Papirus-Dark,Adwaita,hicolor

# Directory list
Directories=16x16/actions,16x16/apps,16x16/devices,16x16/emblems,16x16/emotes,16x16/mimetypes,16x16/panel,16x16/places,16x16/status,22x22/actions,22x22/apps,22x22/devices,22x22/emblems,22x22/emotes,22x22/mimetypes,22x22/panel,22x22/places,22x22/status,24x24/actions,24x24/animations,24x24/apps,24x24/devices,24x24/emblems,24x24/emotes,24x24/mimetypes,24x24/panel,24x24/places,24x24/status,32x32/actions,32x32/apps,32x32/devices,32x32/emblems,32x32/emotes,32x32/mimetypes,32x32/places,32x32/status,48x48/actions,48x48/apps,48x48/devices,48x48/emblems,48x48/emotes,48x48/mimetypes,48x48/places,48x48/status,64x64/actions,64x64/apps,64x64/devices,64x64/emblems,64x64/emotes,64x64/mimetypes,64x64/places,64x64/status,symbolic/actions,symbolic/apps,symbolic/categories,symbolic/devices,symbolic/emblems,symbolic/emotes,symbolic/mimetypes,symbolic/panel,symbolic/places,symbolic/status

DesktopDefault=48
DesktopSizes=16,22,24,32,48,64
ToolbarDefault=22
ToolbarSizes=16,22,24,32,48
MainToolbarDefault=22
MainToolbarSizes=16,22,24,32,48
SmallDefault=16
SmallSizes=16,22,24,32,48
PanelDefault=48
PanelSizes=16,22,24,32,48,64
DialogDefault=48
DialogSizes=16,22,24,32,48,64

# Context definitions
[16x16/actions]
Context=Actions
Size=16
Type=Fixed

[16x16/apps]
Context=Applications
Size=16
Type=Fixed

[16x16/devices]
Context=Devices
Size=16
Type=Fixed

[16x16/emblems]
Context=Emblems
Size=16
MinSize=8
MaxSize=16
Type=Scalable

[16x16/emotes]
Context=Emotes
Size=16
Type=Fixed

[16x16/mimetypes]
Context=MimeTypes
Size=16
Type=Fixed

[16x16/panel]
Context=Status
Size=16
Type=Fixed

[16x16/places]
Context=Places
Size=16
Type=Fixed

[16x16/status]
Context=Status
Size=16
Type=Fixed
EOF

echo ""
echo "[4/4] Installing icon recoloring tool..."

# Install papirus-folders for easy folder color changing
if ! command -v papirus-folders &> /dev/null; then
    echo "Installing papirus-folders tool..."
    wget -qO- https://git.io/papirus-folders-install | sh
fi

# Change folder colors to STALKER green
echo ""
echo "Changing folder colors to STALKER theme..."
papirus-folders -C green --theme Papirus-Dark

# Create symbolic link with STALKER colors
echo ""
echo "Creating STALKER folder variant..."

# Create custom folder colors
FOLDERS_DIR="$ICON_DIR/48x48/places"
if [ -d "$FOLDERS_DIR" ]; then
    cd "$FOLDERS_DIR"
    
    # Find all folder icons and create a mapping list
    echo "Recoloring folder icons..."
    find . -name "folder*.svg" -type f | while read icon; do
        if [ -f "$icon" ]; then
            # Replace common Papirus colors with STALKER colors
            sed -i "s/#5294e2/$STALKER_GREEN/g" "$icon" 2>/dev/null
            sed -i "s/#4877b1/$STALKER_DARK/g" "$icon" 2>/dev/null
            sed -i "s/#4285f4/$STALKER_ACCENT/g" "$icon" 2>/dev/null
        fi
    done
fi

# Update icon cache
echo ""
echo "Updating icon cache..."
gtk-update-icon-cache -f -t "$ICON_DIR" 2>/dev/null

echo ""
echo "=================================================="
echo "STALKER Icon Theme Created Successfully!"
echo "=================================================="
echo ""
echo "Location: $ICON_DIR"
echo ""
echo "To apply:"
echo "1. Open 'Tweaks' application"
echo "2. Go to 'Appearance' section"
echo "3. Set Icons to: Papirus-Stalker"
echo ""
echo "Or run: gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Stalker'"
echo ""
