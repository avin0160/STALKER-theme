#!/bin/bash

# STALKER System UI Theme Creator
# Replaces GNOME Shell blue accent colors with STALKER green

echo "========================================================="
echo "  STALKER SYSTEM UI THEME CREATOR"
echo "  (Quick Settings, Buttons, Sliders, etc.)"
echo "========================================================="
echo ""

# Install required tools
echo "[1/8] Installing required packages..."
sudo apt install -y sassc git

# STALKER color definitions
STALKER_PRIMARY="#5f7060"
STALKER_ACCENT="#7a8a7d"
STALKER_DARK="#3a4d3e"
STALKER_PURPLE="#6b5f7b"
STALKER_LIGHT="#c9c5b4"

# Create theme directories
GTK_THEME_DIR="$HOME/.themes/Stalker-GTK"
SHELL_THEME_DIR="$HOME/.themes/Stalker-Shell"

echo ""
echo "[2/8] Creating theme directories..."
mkdir -p "$GTK_THEME_DIR"/{gtk-3.0,gtk-4.0}
mkdir -p "$SHELL_THEME_DIR/gnome-shell"

# Clone Arc theme as base
echo ""
echo "[3/8] Downloading Arc theme source for customization..."
cd /tmp
if [ -d "arc-theme" ]; then
    rm -rf arc-theme
fi
git clone https://github.com/jnsh/arc-theme.git --depth 1

# Create custom GTK 3.0 CSS
echo ""
echo "[4/8] Creating custom GTK 3.0 theme..."
cat > "$GTK_THEME_DIR/gtk-3.0/gtk.css" << 'EOFGTK3'
/* STALKER GTK 3.0 Theme - Based on Arc-Dark with STALKER colors */
@import url("resource:///org/gtk/libgtk/theme/Adwaita/gtk-contained-dark.css");

/* STALKER Color Definitions */
@define-color theme_selected_bg_color #5f7060;
@define-color theme_selected_fg_color #ffffff;
@define-color theme_base_color #2b2b2b;
@define-color theme_text_color #c9c5b4;
@define-color theme_bg_color #383838;
@define-color theme_fg_color #c9c5b4;
@define-color accent_bg_color #5f7060;
@define-color accent_fg_color #ffffff;
@define-color accent_color #5f7060;
@define-color destructive_bg_color #8b5a5a;
@define-color destructive_fg_color #ffffff;
@define-color success_color #5f7060;
@define-color warning_color #9ca69a;
@define-color error_color #8b5a5a;
@define-color window_bg_color #353535;
@define-color window_fg_color #c9c5b4;
@define-color view_bg_color #2b2b2b;
@define-color view_fg_color #c9c5b4;
@define-color headerbar_bg_color #3a4d3e;
@define-color headerbar_fg_color #c9c5b4;
@define-color card_bg_color #383838;
@define-color card_fg_color #c9c5b4;
@define-color dialog_bg_color #383838;
@define-color dialog_fg_color #c9c5b4;
@define-color popover_bg_color #383838;
@define-color popover_fg_color #c9c5b4;

/* Replace all blue accents with STALKER green */
* {
    -gtk-icon-style: symbolic;
}

/* Buttons */
button:checked,
button:active,
button.suggested-action,
button.toggle:checked {
    background-color: #5f7060;
    color: #ffffff;
    border-color: #4a5a4d;
}

button:checked:hover,
button.suggested-action:hover {
    background-color: #7a8a7d;
}

/* Switches */
switch:checked {
    background-color: #5f7060;
    color: #ffffff;
}

switch:checked slider {
    background-color: #ffffff;
    border-color: #5f7060;
}

/* Check boxes and radio buttons */
checkbutton:checked check,
radiobutton:checked radio {
    background-color: #5f7060;
    border-color: #5f7060;
    color: #ffffff;
}

/* Progress bars */
progressbar progress {
    background-color: #5f7060;
}

/* Scale/Sliders */
scale trough {
    background-color: #4a4a4a;
}

scale highlight {
    background-color: #5f7060;
}

scale slider {
    background-color: #ffffff;
    border-color: #5f7060;
}

scale slider:hover {
    background-color: #f0f0f0;
}

/* Links */
link,
link:link,
link:visited {
    color: #7a8a7d;
}

link:hover {
    color: #5f7060;
}

/* Selection */
selection,
*:selected {
    background-color: #5f7060;
    color: #ffffff;
}

/* Entry focus */
entry:focus {
    border-color: #5f7060;
    outline-color: #5f7060;
}

/* Notebook tabs */
notebook > header > tabs > tab:checked {
    background-color: #5f7060;
    color: #ffffff;
}

/* Menu items */
menuitem:hover {
    background-color: #5f7060;
    color: #ffffff;
}

/* Spinbutton */
spinbutton:focus {
    border-color: #5f7060;
}

/* Scrollbars */
scrollbar slider {
    background-color: #5f7060;
}

scrollbar slider:hover {
    background-color: #7a8a7d;
}

/* Headerbar */
headerbar {
    background-color: #3a4d3e;
    color: #c9c5b4;
}

headerbar button:checked {
    background-color: #5f7060;
}

/* Sidebar */
.sidebar:selected {
    background-color: #5f7060;
}
EOFGTK3

# Create custom GTK 4.0 CSS
echo ""
echo "[5/8] Creating custom GTK 4.0 theme..."
cat > "$GTK_THEME_DIR/gtk-4.0/gtk.css" << 'EOFGTK4'
/* STALKER GTK 4.0 Theme */
@import url("resource:///org/gtk/libgtk/theme/Default/Default-dark.css");

/* STALKER Colors */
@define-color accent_bg_color #5f7060;
@define-color accent_fg_color #ffffff;
@define-color accent_color #5f7060;
@define-color destructive_bg_color #8b5a5a;
@define-color destructive_fg_color #ffffff;
@define-color success_color #5f7060;
@define-color warning_color #9ca69a;
@define-color error_color #8b5a5a;
@define-color window_bg_color #353535;
@define-color window_fg_color #c9c5b4;
@define-color view_bg_color #2b2b2b;
@define-color view_fg_color #c9c5b4;
@define-color headerbar_bg_color #3a4d3e;
@define-color headerbar_fg_color #c9c5b4;
@define-color card_bg_color #383838;
@define-color popover_bg_color #383838;
@define-color dialog_bg_color #383838;

/* Override accent colors */
.accent {
    background-color: #5f7060;
    color: #ffffff;
}

button.suggested-action {
    background-color: #5f7060;
    color: #ffffff;
}

button:checked {
    background-color: #5f7060;
}

switch:checked {
    background-color: #5f7060;
}

checkbutton:checked check {
    background-color: #5f7060;
}

scale highlight {
    background-color: #5f7060;
}

progressbar > trough > progress {
    background-color: #5f7060;
}
EOFGTK4

# Create GNOME Shell theme
echo ""
echo "[6/8] Creating GNOME Shell theme for Quick Settings..."
cat > "$SHELL_THEME_DIR/gnome-shell/gnome-shell.css" << 'EOFSHELL'
/* STALKER GNOME Shell Theme */

/* Import base theme */
@import url("resource:///org/gnome/shell/theme/gnome-shell.css");

/* Quick Settings Panel */
.quick-settings {
    background-color: #2a3a2e;
    color: #c9c5b4;
}

/* Toggle buttons in quick settings */
.quick-toggle:checked {
    background-color: #5f7060 !important;
    color: #ffffff !important;
}

.quick-toggle {
    background-color: #3a4d3e;
    color: #c9c5b4;
}

.quick-toggle:hover {
    background-color: #4a5a4d;
}

/* Sliders */
.slider {
    -barlevel-active-background-color: #5f7060;
    -barlevel-active-border-color: #5f7060;
}

.slider .slider-bar {
    background-color: #4a5a4d;
}

.slider .slider-fill {
    background-color: #5f7060;
}

/* Buttons */
.button:checked,
.button:active {
    background-color: #5f7060;
    color: #ffffff;
}

.button.suggested-action {
    background-color: #5f7060;
    color: #ffffff;
}

/* Panel */
#panel {
    background-color: #2a3a2e;
    color: #c9c5b4;
}

/* Overview */
.overview-controls {
    background-color: #2a3a2e;
}

/* Dash */
.dash-background {
    background-color: #2a3a2e;
}

.dash-item:checked {
    background-color: #5f7060;
}

/* App grid */
.app-well-app:checked .overview-icon,
.app-well-app:selected .overview-icon {
    background-color: #5f7060;
}

/* Search results */
.search-section-content:selected,
.list-search-result:selected {
    background-color: #5f7060;
}

/* Switches */
.toggle-switch {
    background-color: #3a4d3e;
}

.toggle-switch:checked {
    background-color: #5f7060 !important;
}

/* Links */
.shell-link {
    color: #7a8a7d;
}

.shell-link:hover {
    color: #5f7060;
}

/* Modal dialogs */
.modal-dialog {
    background-color: #2a3a2e;
    color: #c9c5b4;
}

/* Notifications */
.notification-banner {
    background-color: #2a3a2e;
}

/* OSD */
.osd-window {
    background-color: #2a3a2e;
}

.level {
    -barlevel-active-background-color: #5f7060;
    -barlevel-active-border-color: #5f7060;
}

/* Calendar */
.calendar {
    background-color: #2a3a2e;
}

.calendar-day-base:selected {
    background-color: #5f7060;
    color: #ffffff;
}

/* Workspace switcher */
.workspace-thumbnail-indicator {
    border: 2px solid #5f7060;
}

/* Screen shield */
.screen-shield-background {
    background-color: #1e2920;
}

/* Looking glass */
.lg-dialog {
    background-color: #2a3a2e;
}
EOFSHELL

# Create index.theme files
echo ""
echo "[7/8] Creating theme index files..."

cat > "$GTK_THEME_DIR/index.theme" << EOF
[Desktop Entry]
Type=X-GNOME-Metatheme
Name=Stalker-GTK
Comment=STALKER themed GTK theme with atmospheric green colors
Encoding=UTF-8

[X-GNOME-Metatheme]
GtkTheme=Stalker-GTK
MetacityTheme=Stalker-GTK
IconTheme=Papirus-Stalker
CursorTheme=default
ButtonLayout=close,minimize,maximize:menu
EOF

cat > "$SHELL_THEME_DIR/gnome-shell/theme.json" << EOF
{
  "name": "Stalker-Shell",
  "description": "STALKER themed GNOME Shell with green accents",
  "shell-version": ["42", "43", "44", "45", "46"]
}
EOF

# Apply themes
echo ""
echo "[8/8] Applying STALKER themes..."

# Apply GTK theme
gsettings set org.gnome.desktop.interface gtk-theme 'Stalker-GTK'

# For GNOME Shell theme, we need gnome-shell-extensions
if command -v gnome-extensions &> /dev/null; then
    # Check if user-themes extension is available
    if gnome-extensions list | grep -q "user-theme"; then
        gsettings set org.gnome.shell.extensions.user-theme name 'Stalker-Shell'
        echo "  ✓ GNOME Shell theme applied"
    else
        echo "  ⚠ Installing user-themes extension..."
        sudo apt install -y gnome-shell-extension-user-theme
        gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
        gsettings set org.gnome.shell.extensions.user-theme name 'Stalker-Shell'
    fi
else
    echo "  ⚠ GNOME Shell extensions not available"
    echo "     Install with: sudo apt install gnome-shell-extensions"
fi

echo ""
echo "========================================================="
echo "  STALKER SYSTEM UI THEME CREATED!"
echo "========================================================="
echo ""
echo "✓ GTK 3.0/4.0 theme created: $GTK_THEME_DIR"
echo "✓ GNOME Shell theme created: $SHELL_THEME_DIR"
echo ""
echo "Applied changes:"
echo "  • Quick Settings buttons (WiFi, Bluetooth, etc.) → STALKER green"
echo "  • Sliders and progress bars → STALKER green"
echo "  • Toggle switches → STALKER green"
echo "  • Selected items → STALKER green"
echo "  • Links → STALKER green-gray"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  IMPORTANT: RESTART REQUIRED"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "To see the Quick Settings changes, you need to:"
echo "  1. Press Alt+F2"
echo "  2. Type: r"
echo "  3. Press Enter"
echo ""
echo "OR (recommended):"
echo "  Log out and log back in"
echo ""
echo "To manually adjust themes:"
echo "  gnome-tweaks"
echo ""
