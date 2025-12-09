#!/bin/bash

# Desaturate application icons to fit STALKER theme
# Keep only green and red tones visible

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  STALKER Icon Desaturation Tool                           ║"
echo "║  Making icons grayscale with green/red accents            ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Backup directory
BACKUP_DIR="$HOME/.local/share/icon-backups-$(date +%Y%m%d-%H%M%S)"

# Icon directories to process
ICON_DIRS=(
    "/usr/share/pixmaps"
    "/usr/share/icons/hicolor"
    "$HOME/.local/share/icons"
)

# Create backup
echo "[1/4] Creating backup..."
mkdir -p "$BACKUP_DIR"

# Function to desaturate icon and preserve only green/red
desaturate_icon() {
    local icon="$1"
    
    # Skip if not readable or already processed
    [ ! -r "$icon" ] && return
    
    # Create backup of original
    local backup_path="$BACKUP_DIR/$(basename "$icon")"
    cp "$icon" "$backup_path" 2>/dev/null
    
    # Desaturate but preserve red and green channels
    # This complex command:
    # 1. Converts to grayscale
    # 2. Re-colorizes with STALKER green tint
    # 3. Overlays original red/green channels if they're strong enough
    
    sudo convert "$icon" \
        \( +clone -colorspace Gray -colorspace RGB \) \
        \( +clone -fill "#6f7e6f" -colorize 8% \) \
        -compose Over -composite \
        \( "$icon" -channel R -separate -threshold 45% -fill "#cc6666" -opaque white \) \
        -compose Screen -composite \
        \( "$icon" -channel G -separate -threshold 40% -fill "#6f7e6f" -opaque white \) \
        -compose Screen -composite \
        "$icon" 2>/dev/null
}

echo "[2/4] Processing application icons..."
echo "      This will take a few minutes..."

# Process PNG icons in pixmaps (these are the most visible app icons)
find /usr/share/pixmaps -maxdepth 1 -name "*.png" -type f 2>/dev/null | while read icon; do
    echo -n "."
    desaturate_icon "$icon"
done

echo ""
echo "[3/4] Processing hicolor theme icons..."

# Process hicolor 48x48 and larger (these appear in app grid)
for size in 48x48 64x64 128x128 scalable; do
    find "/usr/share/icons/hicolor/$size/apps" -name "*.png" -type f 2>/dev/null | while read icon; do
        echo -n "."
        desaturate_icon "$icon"
    done
done

echo ""
echo "[4/4] Updating icon cache..."
sudo gtk-update-icon-cache -f /usr/share/icons/hicolor 2>/dev/null
sudo gtk-update-icon-cache -f /usr/share/icons/Adwaita 2>/dev/null

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║  Icon desaturation complete!                              ║"
echo "║                                                            ║"
echo "║  Backup saved to: $BACKUP_DIR"
echo "║                                                            ║"
echo "║  To restore original colors:                              ║"
echo "║    sudo cp $BACKUP_DIR/* /usr/share/pixmaps/"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "Restarting GNOME Shell to apply changes..."
echo "Press Alt+F2, type 'r', and press Enter"
echo "Or log out and log back in."
