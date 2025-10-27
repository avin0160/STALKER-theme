#!/bin/bash

# STALKER COMPLETE THEME INSTALLER
# Installs GTK theme, icons, terminal colors, and applies everything

echo "========================================================="
echo "  _____ _____  _    _    _  ________ _____             "
echo " / ____|_   _|/ \  | |  | |/ /  ____|  __ \            "
echo "| (___   | | / _ \ | |  | ' /| |__  | |__) |           "
echo " \___ \  | |/ ___ \| |  |  < |  __| |  _  /            "
echo " ____) |_| /_/   \_\ |__| . \| |____| | \ \            "
echo "|_____/|_____/     \______|_\______|_|  \_\           "
echo "                                                        "
echo "         COMPLETE THEME INSTALLATION                   "
echo "========================================================="
echo ""

# Function to show progress
show_progress() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  $1"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
}

# Check if running with sudo for apt commands
check_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Some operations require sudo privileges."
        echo "You may be prompted for your password."
        echo ""
    fi
}

check_sudo

# Step 1: Update system
show_progress "STEP 1/6: Updating package list"
sudo apt update

# Step 2: Install base packages
show_progress "STEP 2/6: Installing theme packages and dependencies"
sudo apt install -y \
    gnome-tweaks \
    gtk2-engines-murrine \
    gtk2-engines-pixbuf \
    arc-theme \
    papirus-icon-theme \
    numix-gtk-theme \
    imagemagick \
    inkscape \
    dconf-editor \
    git

# Step 3: Install papirus-folders
show_progress "STEP 3/6: Installing papirus-folders tool"
if ! command -v papirus-folders &> /dev/null; then
    wget -qO- https://git.io/papirus-folders-install | sh
else
    echo "papirus-folders already installed ✓"
fi

# Step 4: Change folder colors
show_progress "STEP 4/6: Applying STALKER green to folder icons"
papirus-folders -C green --theme Papirus-Dark

# Step 5: Create custom icon theme
show_progress "STEP 5/6: Creating custom STALKER icon theme"
ICON_THEME="Papirus-Stalker"
ICON_DIR="$HOME/.local/share/icons/$ICON_THEME"

mkdir -p "$ICON_DIR"

# Copy Papirus-Dark as base
if [ -d "/usr/share/icons/Papirus-Dark" ]; then
    echo "Copying Papirus-Dark as base..."
    cp -r /usr/share/icons/Papirus-Dark/* "$ICON_DIR/"
fi

# Create custom index.theme
cat > "$ICON_DIR/index.theme" << 'EOF'
[Icon Theme]
Name=Papirus-Stalker
Comment=STALKER-themed Papirus icons with atmospheric green/gray colors
Inherits=Papirus-Dark,breeze-dark,Adwaita,hicolor
Example=folder

DisplayDepth=32
DesktopDefault=48
DesktopSizes=16,22,24,32,48,64,128,256
ToolbarDefault=22
ToolbarSizes=16,22,24,32,48
MainToolbarDefault=22
MainToolbarSizes=16,22,24,32,48
SmallDefault=16
SmallSizes=16,22,24,32,48
PanelDefault=32
PanelSizes=16,22,24,32,48,64,128,256

Directories=16x16/actions,16x16/apps,16x16/places,22x22/actions,22x22/apps,22x22/places,24x24/actions,24x24/apps,24x24/places,32x32/actions,32x32/apps,32x32/places,48x48/actions,48x48/apps,48x48/places,64x64/actions,64x64/apps,64x64/places

[16x16/actions]
Size=16
Context=Actions
Type=Fixed

[16x16/apps]
Size=16
Context=Applications
Type=Fixed

[16x16/places]
Size=16
Context=Places
Type=Fixed

[22x22/actions]
Size=22
Context=Actions
Type=Fixed

[22x22/apps]
Size=22
Context=Applications
Type=Fixed

[22x22/places]
Size=22
Context=Places
Type=Fixed

[24x24/actions]
Size=24
Context=Actions
Type=Fixed

[24x24/apps]
Size=24
Context=Applications
Type=Fixed

[24x24/places]
Size=24
Context=Places
Type=Fixed

[32x32/actions]
Size=32
Context=Actions
Type=Fixed

[32x32/apps]
Size=32
Context=Applications
Type=Fixed

[32x32/places]
Size=32
Context=Places
Type=Fixed

[48x48/actions]
Size=48
Context=Actions
Type=Fixed

[48x48/apps]
Size=48
Context=Applications
Type=Fixed

[48x48/places]
Size=48
Context=Places
Type=Fixed

[64x64/actions]
Size=64
Context=Actions
Type=Fixed

[64x64/apps]
Size=64
Context=Applications
Type=Fixed

[64x64/places]
Size=64
Context=Places
Type=Fixed
EOF

# Update icon cache
echo "Updating icon cache..."
gtk-update-icon-cache -f -t "$ICON_DIR" 2>/dev/null || true

# Step 6: Apply theme settings
show_progress "STEP 6/6: Applying STALKER theme"

# Apply GTK theme
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark'

# Apply icon theme
gsettings set org.gnome.desktop.interface icon-theme "$ICON_THEME"

# Apply window theme
gsettings set org.gnome.desktop.wm.preferences theme 'Arc-Dark'

# Set monospace font (optional, good for terminals)
gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 11'

# Create GNOME Terminal profile
echo ""
echo "Creating STALKER terminal profile..."

PROFILE_NAME="Stalker"
PROFILE_SLUG="stalker-$(uuidgen | tr -d '-' | head -c 8)"

# Get the list of profiles
PROFILE_LIST=$(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "[],'")

# Add new profile to the list
if [[ ! $PROFILE_LIST == *"$PROFILE_SLUG"* ]]; then
    if [ -z "$PROFILE_LIST" ]; then
        gsettings set org.gnome.Terminal.ProfilesList list "['$PROFILE_SLUG']"
    else
        gsettings set org.gnome.Terminal.ProfilesList list "[$PROFILE_LIST, '$PROFILE_SLUG']"
    fi
fi

# Set profile as default
gsettings set org.gnome.Terminal.ProfilesList default "$PROFILE_SLUG"

# Configure the profile
PROFILE_PATH="/org/gnome/terminal/legacy/profiles:/:$PROFILE_SLUG/"

dconf write ${PROFILE_PATH}visible-name "'$PROFILE_NAME'"
dconf write ${PROFILE_PATH}background-color "'#1e2920'"
dconf write ${PROFILE_PATH}foreground-color "'#c9c5b4'"
dconf write ${PROFILE_PATH}use-theme-colors false
dconf write ${PROFILE_PATH}use-theme-transparency false
dconf write ${PROFILE_PATH}bold-color "'#d9d5c4'"
dconf write ${PROFILE_PATH}cursor-background-color "'#7a8a7d'"
dconf write ${PROFILE_PATH}cursor-foreground-color "'#1e2920'"
dconf write ${PROFILE_PATH}palette "['#1e2920', '#8b5a5a', '#5f7060', '#9ca69a', '#4a5a4d', '#6b5f7b', '#7a8a7d', '#c9c5b4', '#3a4d3e', '#b87a7a', '#7f9080', '#bcc6ba', '#6a7a6d', '#8b7f9b', '#9aaaa9d', '#e9e5d4']"

echo ""
echo "========================================================="
echo "                INSTALLATION COMPLETE!                   "
echo "========================================================="
echo ""
echo "✓ GTK Theme: Arc-Dark"
echo "✓ Icon Theme: $ICON_THEME (with STALKER green folders)"
echo "✓ Terminal: Stalker profile created"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  APPLIED SETTINGS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Colors:"
echo "  • Background: #1e2920 (dark green-gray)"
echo "  • Foreground: #c9c5b4 (beige/cream)"
echo "  • Accent:     #5f7060 (muted green)"
echo "  • Highlight:  #6b5f7b (muted purple)"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  MANUAL ADJUSTMENTS (Optional)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "1. Fine-tune theme in 'Tweaks' application:"
echo "   tweaks"
echo ""
echo "2. Try alternative GTK themes:"
echo "   • Numix: darker, more modern"
echo "   • Materia-dark: material design"
echo ""
echo "3. Customize further:"
echo "   • Run: ./create_advanced_icons.sh"
echo "   • Edit: ~/.local/share/icons/$ICON_THEME/"
echo ""
echo "4. View color reference:"
echo "   • See: STALKER_THEME_COLORS.md"
echo ""
echo "Restart your session or press Alt+F2 and type 'r' to"
echo "reload the theme completely."
echo ""
echo "========================================================="
echo "         Good hunting, Stalker! Доброй охоты!           "
echo "========================================================="
