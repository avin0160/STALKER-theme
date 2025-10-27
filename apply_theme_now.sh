#!/bin/bash

echo "=================================================="
echo "  STALKER Theme - Force Apply Everything"
echo "=================================================="
echo ""

# 1. Create GTK Theme
echo "[1/5] Creating GTK Theme..."
bash scripts/create_gtk_theme.sh

# 2. Create GNOME Shell Theme
echo ""
echo "[2/5] Creating GNOME Shell Theme..."
bash scripts/create_gnome_shell_theme.sh

# 3. Create Cursors (with drag-drop)
echo ""
echo "[3/5] Creating Cursors with drag-and-drop..."
bash scripts/create_cursor_theme.sh

# 4. Apply aggressive color muting
echo ""
echo "[4/5] Applying color muting to icons..."
bash scripts/apply_color_muting.sh

# 5. Force theme application
echo ""
echo "[5/5] Forcing theme reload..."
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
sleep 2
gsettings set org.gnome.desktop.interface gtk-theme 'STALKER-Theme'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Stalker'
gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex-Minimal'

# Enable and apply GNOME Shell theme
if gnome-extensions list 2>/dev/null | grep -q "user-theme"; then
    gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com 2>/dev/null || true
    gsettings set org.gnome.shell.extensions.user-theme name 'STALKER-Theme'
    echo "✓ GNOME Shell theme applied"
else
    echo "⚠ User Themes extension not found - install: sudo apt install gnome-shell-extension-user-theme"
fi

# Rename Activities to Perimeter (run silently)
bash scripts/rename_activities.sh >/dev/null 2>&1
echo "✓ Activities renamed to 'Perimeter'"

# Rename applications (run silently)
bash scripts/rename_applications.sh >/dev/null 2>&1
echo "✓ Applications renamed (Settings→Zone, Power→Depletion, etc.)"

# Restart file manager and refresh icons
killall nautilus 2>/dev/null
gtk-update-icon-cache ~/.local/share/icons/Papirus-Stalker 2>/dev/null

echo ""
echo "✓ Theme applied! Restart applications to see full effect."
echo "✓ Press Alt+F2, type 'r', press Enter to reload GNOME Shell (Xorg)"
echo "  OR log out and back in (Wayland)"
echo ""
