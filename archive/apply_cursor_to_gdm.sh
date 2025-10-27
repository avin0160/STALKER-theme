#!/bin/bash

# Apply STALKER Cursor Theme to GDM Lock Screen

echo "=========================================="
echo "  Applying STALKER Cursor to Lock Screen"
echo "=========================================="
echo ""

# Copy cursor theme to system location
echo "[1/3] Copying cursor theme to system icons..."
sudo mkdir -p /usr/share/icons/Stalker-Hex-Minimal
sudo cp -r ~/.icons/Stalker-Hex-Minimal/* /usr/share/icons/Stalker-Hex-Minimal/
sudo chmod -R 755 /usr/share/icons/Stalker-Hex-Minimal
echo "  ✓ Cursor theme copied to /usr/share/icons/"

# Create GDM dconf configuration
echo ""
echo "[2/3] Configuring GDM to use STALKER cursor..."
sudo mkdir -p /etc/dconf/db/gdm.d

sudo tee /etc/dconf/db/gdm.d/99-stalker-cursor << EOF
[org/gnome/desktop/interface]
cursor-theme='Stalker-Hex-Minimal'
EOF

echo "  ✓ GDM configuration created"

# Update dconf database
echo ""
echo "[3/3] Updating GDM dconf database..."
sudo dconf update
echo "  ✓ Database updated"

echo ""
echo "=========================================="
echo "  ✓ STALKER Cursor Applied to Lock Screen!"
echo "=========================================="
echo ""
echo "The cursor theme will be active on:"
echo "  • Login screen (GDM)"
echo "  • Lock screen"
echo "  • User switching screen"
echo ""
echo "Changes will take effect after logging out or rebooting."
echo ""
