#!/bin/bash

# STALKER COMPLETE COLOR THEME APPLICATOR
# Mutes blues everywhere, enhances greens and reds

echo "========================================================="
echo "  STALKER COMPLETE THEME APPLICATOR"
echo "========================================================="
echo ""
echo "This script will:"
echo "  1. Create/modify icon theme (mute blues, enhance greens/reds)"
echo "  2. Create GTK theme for file manager & applications"
echo "  3. Apply both themes to your system"
echo ""
echo "Changes will affect:"
echo "  • Application icons"
echo "  • Folder icons"  
echo "  • File manager colors"
echo "  • System UI elements"
echo ""
read -p "Continue? (y/n) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Cancelled."
    exit 0
fi

echo ""
echo "========================================================="
echo "  STEP 1: Creating GTK Theme"
echo "========================================================="
echo ""

# Run GTK theme creator
if [ -f "./create_stalker_gtk_theme.sh" ]; then
    ./create_stalker_gtk_theme.sh
else
    echo "Error: create_stalker_gtk_theme.sh not found!"
    exit 1
fi

echo ""
echo "========================================================="
echo "  STEP 2: Modifying Icon Theme"
echo "========================================================="
echo ""

# Run icon color modifier
if [ -f "./mute_blues_enhance_greens_reds.sh" ]; then
    ./mute_blues_enhance_greens_reds.sh
else
    echo "Error: mute_blues_enhance_greens_reds.sh not found!"
    exit 1
fi

echo ""
echo "========================================================="
echo "  STEP 3: Applying Themes"
echo "========================================================="
echo ""

# Apply GTK theme
echo "Applying GTK theme..."
gsettings set org.gnome.desktop.interface gtk-theme 'STALKER-Theme'
gsettings set org.gnome.desktop.wm.preferences theme 'STALKER-Theme'

# Apply icon theme
echo "Applying icon theme..."
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Stalker'

# Update icon cache
echo "Updating icon cache..."
gtk-update-icon-cache -f -t "$HOME/.local/share/icons/Papirus-Stalker" 2>/dev/null || true

echo ""
echo "========================================================="
echo "  COMPLETE!"
echo "========================================================="
echo ""
echo "✓ GTK Theme: STALKER-Theme (applied)"
echo "✓ Icon Theme: Papirus-Stalker (applied)"
echo ""
echo "Color changes:"
echo "  • Blues: MUTED to gray-greens (#6a7a6d, #7a8a7d)"
echo "  • Greens: ENHANCED (#7f9080, #5f7060) - Now POP!"
echo "  • Reds: ENHANCED (#b87a7a, #8b5a5a) - Now POP!"
echo ""
echo "If you don't see changes immediately:"
echo "  1. Close and reopen applications"
echo "  2. Log out and log back in"
echo "  3. Or restart your session (Alt+F2, type 'r', Enter)"
echo ""
echo "To open GNOME Tweaks for further customization:"
echo "  gnome-tweaks"
echo ""
