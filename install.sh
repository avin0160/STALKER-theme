#!/bin/bash

# STALKER Theme for GNOME - Master Installer
# Inspired by Andrei Tarkovsky's STALKER (1979)
# 
# This script installs the complete STALKER theme:
# - GTK Theme (muted greens, reds, beiges)
# - Icon Theme (8000+ recolored Papirus icons)
# - Cursor Theme (minimal hexagonal cursors)
# - Optional: GDM/Lock Screen theming

set -e  # Exit on error

echo "================================================================"
echo "   STALKER Theme Installer"
echo "   \"The Zone awaits those who seek.\""
echo "================================================================"
echo ""

# Color codes for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if running from correct directory
if [ ! -f "scripts/create_gtk_theme.sh" ]; then
    echo -e "${RED}Error: Please run this script from the STALKER-Theme-Project directory${NC}"
    echo "Usage: cd STALKER-Theme-Project && bash install.sh"
    exit 1
fi

# Check dependencies
echo -e "${YELLOW}[1/7] Checking dependencies...${NC}"
MISSING_DEPS=""

if ! command -v python3 &> /dev/null; then
    MISSING_DEPS="$MISSING_DEPS python3"
fi

if ! python3 -c "import PIL" 2>/dev/null; then
    MISSING_DEPS="$MISSING_DEPS python3-pil"
fi

if ! command -v xcursorgen &> /dev/null; then
    MISSING_DEPS="$MISSING_DEPS xcursorgen"
fi

if [ ! -d "/usr/share/icons/Papirus" ] && [ ! -d "$HOME/.local/share/icons/Papirus" ]; then
    echo -e "${YELLOW}  ⚠ Papirus icon theme not found - will be installed${NC}"
    MISSING_DEPS="$MISSING_DEPS papirus-icon-theme"
fi

if [ -n "$MISSING_DEPS" ]; then
    echo -e "${RED}  ✗ Missing dependencies:$MISSING_DEPS${NC}"
    echo ""
    echo "Please install them first:"
    echo ""
    echo "  Ubuntu/Debian:"
    echo "    sudo apt install$MISSING_DEPS"
    echo ""
    echo "  Fedora:"
    echo "    sudo dnf install${MISSING_DEPS/python3-pil/python3-pillow}"
    echo ""
    echo "  Arch:"
    echo "    sudo pacman -S${MISSING_DEPS/python3-pil/python-pillow}"
    echo ""
    exit 1
fi

echo -e "${GREEN}  ✓ All dependencies installed${NC}"
echo ""

# Create GTK Theme
echo -e "${YELLOW}[2/7] Creating GTK Theme...${NC}"
bash scripts/create_gtk_theme.sh
echo -e "${GREEN}  ✓ GTK Theme created${NC}"
echo ""

# Create GNOME Shell Theme
echo -e "${YELLOW}[3/7] Creating GNOME Shell Theme...${NC}"
echo "  (Converts blue UI elements to STALKER greens)"
bash scripts/create_gnome_shell_theme.sh
echo -e "${GREEN}  ✓ GNOME Shell Theme created${NC}"
echo ""

# Create Cursor Theme
echo -e "${YELLOW}[4/7] Creating Cursor Theme...${NC}"
echo "  (This generates PNG images and compiles X11 cursors)"
bash scripts/create_cursor_theme.sh
echo -e "${GREEN}  ✓ Cursor Theme created${NC}"
echo ""

# Apply Color Muting
echo -e "${YELLOW}[5/7] Applying Aggressive Color Muting...${NC}"
echo "  This processes 8000+ icon files - takes ~2 minutes"
echo "  Removes all blues, purples, bright colors"
echo ""
read -p "  Apply color muting? (Y/n): " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    bash scripts/apply_color_muting.sh
    echo -e "${GREEN}  ✓ Color muting applied${NC}"
else
    echo -e "${YELLOW}  ⊘ Color muting skipped${NC}"
fi
echo ""

# Apply themes
echo -e "${YELLOW}[6/7] Activating themes...${NC}"
gsettings set org.gnome.desktop.interface gtk-theme 'STALKER-Theme'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Stalker'
gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex-Minimal'

# Enable and apply GNOME Shell theme
if gnome-extensions list 2>/dev/null | grep -q "user-theme"; then
    gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com 2>/dev/null || true
    gsettings set org.gnome.shell.extensions.user-theme name 'STALKER-Theme'
    echo -e "${GREEN}  ✓ GNOME Shell theme activated${NC}"
else
    echo -e "${YELLOW}  ⚠ User Themes extension not found - Shell theme not applied${NC}"
    echo "    Install with: sudo apt install gnome-shell-extension-user-theme"
fi

# Rename Activities to Perimeter
bash scripts/rename_activities.sh | grep -E "^(✅|⚠️)" | head -3
echo -e "${GREEN}  ✓ Activities → Perimeter${NC}"

# Rename applications to STALKER theme
echo ""
echo "  Rename applications with STALKER theme?"
echo "  (Settings→Zone, Power→Depletion, Activities→Perimeter, etc.)"
echo "  Apps remain searchable by original names"
echo ""
read -p "  Rename applications? (Y/n): " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    bash scripts/rename_applications.sh | grep -E "^(✅|📋|  •)" | head -15
    echo -e "${GREEN}  ✓ Applications renamed${NC}"
else
    echo -e "${YELLOW}  ⊘ Application renaming skipped${NC}"
fi

echo -e "${GREEN}  ✓ Themes activated${NC}"
echo ""

# Optional: GDM/Lock Screen
echo -e "${YELLOW}[7/7] Lock Screen Theme (Optional)...${NC}"
echo "  Apply STALKER theme to login/lock screen?"
echo "  Requires sudo to copy themes to system directories"
echo ""
read -p "  Apply to lock screen? (y/N): " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    bash scripts/apply_to_gdm.sh
    echo -e "${GREEN}  ✓ Lock screen themed${NC}"
else
    echo -e "${YELLOW}  ⊘ Lock screen theming skipped${NC}"
fi
echo ""

# Restart file manager to show changes
echo "Restarting file manager to apply theme..."
killall nautilus 2>/dev/null || true
sleep 1
nautilus ~/Music/evryscript\ but\ shit/STALKER-Theme-Project &>/dev/null &

# Final message
echo "================================================================"
echo -e "${GREEN}   STALKER Theme Installation Complete!${NC}"
echo "================================================================"
echo ""
echo "✓ GTK Theme: STALKER-Theme"
echo "✓ Icon Theme: Papirus-Stalker"
echo "✓ Cursor Theme: Stalker-Hex-Minimal"
echo ""
echo "🎨 Color Scheme:"
echo "   • Tactical Greens: #3a4d3e → #7a8a7d"
echo "   • Weathered Reds: #6d4545 → #b87a7a"
echo "   • Desolate Beiges: #a39e8f → #c9c5b4"
echo "   • No Blues: All converted to grey-greens"
echo ""
echo "📋 Next Steps:"
echo "   1. Restart applications to see full effect"
echo "   2. Lock screen (Super+L) to test if GDM was applied"
echo "   3. Take screenshots and enjoy The Zone aesthetic"
echo ""
echo "🛠️ Customization:"
echo "   - Edit scripts/create_gtk_theme.sh for GTK colors"
echo "   - Edit scripts/create_cursor_theme.sh for cursor design"
echo "   - See docs/CUSTOMIZATION.md for more options"
echo ""
echo "🐛 Issues? See docs/TROUBLESHOOTING.md"
echo ""
echo -e "${GREEN}Good hunting, Stalker.${NC} 🌿"
echo ""
echo "\"The Zone wants to be respected. Otherwise it will punish.\""
echo ""
