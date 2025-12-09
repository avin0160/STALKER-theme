#!/bin/bash

# Create a muted STALKER icon theme by symlinking to a grayscale base
# and only keeping colorful green/red icons

echo "Creating STALKER Muted Icon Theme..."

# Install a good grayscale icon theme as base
if [ ! -d "/usr/share/icons/Papirus-Dark" ]; then
    echo "Installing Papirus-Dark icon theme..."
    sudo apt-get update
    sudo apt-get install -y papirus-icon-theme
fi

# Create new muted theme directory
MUTED_THEME="/usr/share/icons/STALKER-Icons"
sudo rm -rf "$MUTED_THEME"
sudo mkdir -p "$MUTED_THEME"

# Copy index.theme
sudo bash -c "cat > $MUTED_THEME/index.theme" <<'EOF'
[Icon Theme]
Name=STALKER Icons
Comment=Muted icon theme for STALKER desktop - only green and red colors
Inherits=Papirus-Dark,Adwaita,hicolor

# Directory list
Directories=apps,places,devices,mimetypes

[apps]
Size=48
Context=Applications
Type=Scalable

[places]
Size=48
Context=Places
Type=Scalable

[devices]
Size=48
Context=Devices
Type=Scalable

[mimetypes]
Size=48
Context=MimeTypes
Type=Scalable
EOF

echo "Icon theme structure created."
echo ""
echo "To complete the theme, you have two options:"
echo ""
echo "OPTION 1 (Recommended): Use a pre-made muted theme"
echo "  Install: sudo apt install numix-icon-theme-circle"
echo "  Then set: gsettings set org.gnome.desktop.interface icon-theme 'Numix-Circle'"
echo ""
echo "OPTION 2: Manually create green/red versions of key icons"
echo "  This requires custom icon design work."
echo ""
echo "OPTION 3: Use simple symbolic icons (cleanest look)"
echo "  gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'"
echo ""
read -p "Would you like to try Adwaita (symbolic/simple icons)? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
    echo "Icon theme set to Adwaita. This uses simple monochrome icons."
fi
