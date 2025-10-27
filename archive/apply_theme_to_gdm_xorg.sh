#!/bin/bash

# Apply STALKER Theme to GDM Lock Screen (GNOME Xorg)
# More comprehensive method for Xorg sessions

echo "=============================================="
echo "  Applying STALKER Theme to GDM (Xorg)"
echo "=============================================="
echo ""

# Ensure themes are in system locations (already done, but verify)
echo "[1/6] Verifying system theme installation..."
if [ ! -d "/usr/share/themes/STALKER-Theme" ]; then
    echo "  Installing GTK theme..."
    sudo mkdir -p /usr/share/themes/STALKER-Theme
    sudo cp -r ~/.themes/STALKER-Theme/* /usr/share/themes/STALKER-Theme/
    sudo chmod -R 755 /usr/share/themes/STALKER-Theme
fi
if [ ! -d "/usr/share/icons/Papirus-Stalker" ]; then
    echo "  Installing icon theme..."
    sudo mkdir -p /usr/share/icons/Papirus-Stalker
    sudo cp -r ~/.local/share/icons/Papirus-Stalker/* /usr/share/icons/Papirus-Stalker/
    sudo chmod -R 755 /usr/share/icons/Papirus-Stalker
fi
if [ ! -d "/usr/share/icons/Stalker-Hex-Minimal" ]; then
    echo "  Installing cursor theme..."
    sudo mkdir -p /usr/share/icons/Stalker-Hex-Minimal
    sudo cp -r ~/.icons/Stalker-Hex-Minimal/* /usr/share/icons/Stalker-Hex-Minimal/
    sudo chmod -R 755 /usr/share/icons/Stalker-Hex-Minimal
fi
echo "  ✓ System themes verified"

# Create dconf profile for GDM
echo ""
echo "[2/6] Creating GDM dconf profile..."
sudo mkdir -p /etc/dconf/profile
sudo tee /etc/dconf/profile/gdm > /dev/null << 'EOF'
user-db:user
system-db:gdm
file-db:/usr/share/gdm/greeter-dconf-defaults
EOF
echo "  ✓ GDM profile created"

# Create GDM database directory
echo ""
echo "[3/6] Configuring GDM database..."
sudo mkdir -p /etc/dconf/db/gdm.d

# Create comprehensive GDM configuration
sudo tee /etc/dconf/db/gdm.d/99-stalker-theme > /dev/null << 'EOF'
[org/gnome/desktop/interface]
gtk-theme='STALKER-Theme'
icon-theme='Papirus-Stalker'
cursor-theme='Stalker-Hex-Minimal'
font-name='Sans 11'

[org/gnome/desktop/wm/preferences]
theme='STALKER-Theme'

[org/gnome/settings-daemon/plugins/cursor]
active=true
EOF

echo "  ✓ GDM database configured"

# Update dconf database
echo ""
echo "[4/6] Compiling dconf database..."
sudo dconf update
echo "  ✓ Database compiled"

# Set GDM user settings directly
echo ""
echo "[5/6] Applying settings to GDM user..."
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface gtk-theme 'STALKER-Theme' 2>/dev/null || echo "  (Direct GDM setting skipped - will use dconf)"
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Stalker' 2>/dev/null || echo "  (Direct GDM setting skipped - will use dconf)"
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex-Minimal' 2>/dev/null || echo "  (Direct GDM setting skipped - will use dconf)"
echo "  ✓ GDM user settings attempted"

# Create X resources for cursor theme (Xorg specific)
echo ""
echo "[6/6] Creating X resources for cursor (Xorg)..."
sudo tee /etc/X11/Xresources/x11-cursor-theme > /dev/null << 'EOF'
Xcursor.theme: Stalker-Hex-Minimal
Xcursor.size: 32
EOF

sudo mkdir -p /etc/gdm3
sudo tee -a /etc/gdm3/custom.conf > /dev/null << 'EOF'

[greeter]
IconTheme=Papirus-Stalker
CursorTheme=Stalker-Hex-Minimal
EOF

echo "  ✓ X resources and GDM config created"

echo ""
echo "=============================================="
echo "  ✓ STALKER Theme Applied to GDM (Xorg)!"
echo "=============================================="
echo ""
echo "Configuration files created:"
echo "  • /etc/dconf/profile/gdm"
echo "  • /etc/dconf/db/gdm.d/99-stalker-theme"
echo "  • /etc/X11/Xresources/x11-cursor-theme"
echo "  • /etc/gdm3/custom.conf (appended)"
echo ""
echo "To see the changes:"
echo "  1. Lock your screen (Super+L)"
echo "  2. If theme doesn't show, restart GDM:"
echo "     sudo systemctl restart gdm3"
echo "     (This will log you out!)"
echo ""
echo "Alternative: Reboot your system"
echo ""
