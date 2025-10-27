#!/bin/bash

# STALKER Theme Installer for Debian
# Based on the atmospheric green/gray color palette

echo "=================================================="
echo "STALKER THEME INSTALLER FOR DEBIAN"
echo "=================================================="
echo ""

# Update package list
echo "[1/5] Updating package list..."
sudo apt update

# Install required packages
echo ""
echo "[2/5] Installing theme and customization tools..."
sudo apt install -y \
    gnome-tweaks \
    gtk2-engines-murrine \
    gtk2-engines-pixbuf \
    sassc \
    git \
    dconf-editor

# Create theme directory
echo ""
echo "[3/5] Creating theme directories..."
mkdir -p ~/.themes
mkdir -p ~/.local/share/color-schemes

# Install popular dark theme as base (we'll customize it)
echo ""
echo "[4/5] Installing base themes..."
sudo apt install -y \
    arc-theme \
    papirus-icon-theme \
    numix-gtk-theme

# Create custom color scheme for terminal
echo ""
echo "[5/5] Creating STALKER color scheme..."

# Create Gnome Terminal profile
cat > /tmp/stalker-terminal.sh << 'EOF'
#!/bin/bash

# Create a new Gnome Terminal profile with STALKER colors
PROFILE_NAME="Stalker"
PROFILE_UUID=$(uuidgen)

dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/visible-name "'$PROFILE_NAME'"
dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/background-color "'#1e2920'"
dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/foreground-color "'#c9c5b4'"
dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/use-theme-colors false
dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/use-theme-transparency false
dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/bold-color "'#d9d5c4'"
dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/cursor-background-color "'#7a8a7d'"
dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/cursor-foreground-color "'#1e2920'"

# 16 color palette based on STALKER theme
dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/palette "['#1e2920', '#8b5a5a', '#5f7060', '#9ca69a', '#4a5a4d', '#6b5f7b', '#7a8a7d', '#c9c5b4', '#3a4d3e', '#b87a7a', '#7f9080', '#bcc6ba', '#6a7a6d', '#8b7f9b', '#9aaaa9d', '#e9e5d4']"

echo "Stalker terminal profile created!"
EOF

chmod +x /tmp/stalker-terminal.sh

echo ""
echo "=================================================="
echo "Installation Complete!"
echo "=================================================="
echo ""
echo "Next Steps:"
echo "1. Run terminal color scheme:"
echo "   bash /tmp/stalker-terminal.sh"
echo ""
echo "2. Apply GTK theme:"
echo "   - Open 'Tweaks' (gnome-tweaks)"
echo "   - Go to 'Appearance'"
echo "   - Set Applications theme to: Arc-Dark or Numix"
echo "   - Set Icons to: Papirus-Dark"
echo ""
echo "3. For custom theme, see: ~/.themes/Stalker-GTK/"
echo ""
echo "Optional: Install additional themes"
echo "  sudo apt install materia-gtk-theme"
echo "  sudo apt install adapta-gtk-theme"
echo ""
