#!/bin/bash

# Apply Complete STALKER Theme to GDM Lock Screen
# This includes GTK theme, icons, and cursor

echo "==========================================="
echo "  Applying STALKER Theme to Lock Screen"
echo "  (GTK Theme + Icons + Cursor)"
echo "==========================================="
echo ""

# Copy GTK theme to system location
echo "[1/4] Copying STALKER GTK theme to system..."
sudo mkdir -p /usr/share/themes/STALKER-Theme
sudo cp -r ~/.themes/STALKER-Theme/* /usr/share/themes/STALKER-Theme/
sudo chmod -R 755 /usr/share/themes/STALKER-Theme
echo "  ✓ GTK theme copied to /usr/share/themes/"

# Copy icon theme to system location
echo ""
echo "[2/4] Copying Papirus-Stalker icons to system..."
sudo mkdir -p /usr/share/icons/Papirus-Stalker
sudo cp -r ~/.local/share/icons/Papirus-Stalker/* /usr/share/icons/Papirus-Stalker/
sudo chmod -R 755 /usr/share/icons/Papirus-Stalker
echo "  ✓ Icon theme copied to /usr/share/icons/"

# Copy cursor theme to system location
echo ""
echo "[3/4] Copying Stalker-Hex-Minimal cursor to system..."
sudo mkdir -p /usr/share/icons/Stalker-Hex-Minimal
sudo cp -r ~/.icons/Stalker-Hex-Minimal/* /usr/share/icons/Stalker-Hex-Minimal/
sudo chmod -R 755 /usr/share/icons/Stalker-Hex-Minimal
echo "  ✓ Cursor theme copied to /usr/share/icons/"

# Create comprehensive GDM dconf configuration
echo ""
echo "[4/4] Configuring GDM to use STALKER theme..."
sudo mkdir -p /etc/dconf/db/gdm.d

sudo tee /etc/dconf/db/gdm.d/99-stalker-theme << 'EOF'
[org/gnome/desktop/interface]
gtk-theme='STALKER-Theme'
icon-theme='Papirus-Stalker'
cursor-theme='Stalker-Hex-Minimal'

# Additional theme settings for consistency
[org/gnome/desktop/wm/preferences]
theme='STALKER-Theme'
EOF

echo "  ✓ GDM configuration created"

# Update dconf database
echo ""
echo "Updating GDM dconf database..."
sudo dconf update
echo "  ✓ Database updated"

# Update icon cache
echo ""
echo "Updating icon cache..."
sudo gtk-update-icon-cache /usr/share/icons/Papirus-Stalker 2>/dev/null || echo "  (Icon cache update skipped)"

echo ""
echo "==========================================="
echo "  ✓ STALKER Theme Applied to Lock Screen!"
echo "==========================================="
echo ""
echo "Theme components installed:"
echo "  • GTK Theme: STALKER-Theme (muted blues, enhanced greens/reds)"
echo "  • Icon Theme: Papirus-Stalker (2400+ recolored icons)"
echo "  • Cursor Theme: Stalker-Hex-Minimal (hexagon cursors)"
echo ""
echo "Lock screen will show:"
echo "  • Grey-green color scheme"
echo "  • Enhanced green and red accents"
echo "  • Themed icons in file dialogs"
echo "  • Custom hexagon cursors"
echo ""
echo "Changes will take effect after:"
echo "  1. Locking your screen (Super+L), OR"
echo "  2. Logging out and back in, OR"
echo "  3. Rebooting"
echo ""
