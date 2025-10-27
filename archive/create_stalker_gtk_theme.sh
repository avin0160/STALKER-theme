#!/bin/bash

# STALKER GTK THEME CREATOR
# Creates a GTK theme with muted blues and enhanced greens/reds

echo "========================================================="
echo "  STALKER GTK THEME CREATOR"
echo "  For File Manager & Application Colors"
echo "========================================================="
echo ""

THEME_NAME="STALKER-Theme"
THEME_DIR="$HOME/.themes/$THEME_NAME"
GTK3_DIR="$THEME_DIR/gtk-3.0"
GTK4_DIR="$THEME_DIR/gtk-4.0"

# Create theme directories
mkdir -p "$GTK3_DIR"
mkdir -p "$GTK4_DIR"

echo "Creating theme at: $THEME_DIR"
echo ""

# STALKER Color Definitions
cat > "$GTK3_DIR/gtk.css" << 'EOF'
/* STALKER GTK Theme - Muted Blues, Enhanced Greens & Reds */

@define-color theme_base_color #1e2920;
@define-color theme_bg_color #3a4d3e;
@define-color theme_fg_color #c9c5b4;
@define-color theme_text_color #c9c5b4;
@define-color theme_selected_bg_color #5f7060;
@define-color theme_selected_fg_color #e9e5d4;

/* Muted colors for less important elements */
@define-color insensitive_bg_color #2a3a2e;
@define-color insensitive_fg_color #6a7a6d;
@define-color borders #4a5a4d;
@define-color unfocused_borders #3a4d3e;

/* Enhanced GREEN colors - Make them POP */
@define-color success_color #7f9080;
@define-color success_color_bright #9aaaa9d;
@define-color warning_color #bcc6ba;

/* Enhanced RED colors - Make them POP */
@define-color error_color #b87a7a;
@define-color error_color_bright #b87a7a;
@define-color destructive_color #8b5a5a;

/* Purple accent for special elements */
@define-color accent_color #6b5f7b;

/* Completely MUTE all blue tones */
@define-color link_color #7a8a7d;  /* Changed from blue to muted green */
@define-color link_visited_color #6a7a6d;  /* Even more muted */

/* ===== FILE MANAGER SPECIFIC ===== */

/* Nautilus/Files sidebar */
.nautilus-window .sidebar,
.nautilus-window sidebar {
    background-color: #3a4d3e;
    color: #c9c5b4;
}

.nautilus-window .sidebar:selected,
.nautilus-window sidebar:selected {
    background-color: #5f7060;
    color: #e9e5d4;
}

/* File/folder list view */
.nautilus-list-view {
    background-color: #1e2920;
    color: #c9c5b4;
}

.nautilus-list-view:selected {
    background-color: #5f7060;
    color: #e9e5d4;
}

/* Icon view */
.nautilus-canvas-item {
    color: #c9c5b4;
}

.nautilus-canvas-item:selected {
    background-color: #5f7060;
    color: #e9e5d4;
}

/* ===== MUTE ALL BLUE ELEMENTS ===== */

/* Remove blue from links */
link,
*:link,
a {
    color: #7a8a7d;  /* Muted green instead of blue */
}

link:hover,
*:link:hover,
a:hover {
    color: #9ca69a;  /* Lighter muted green */
}

link:visited,
*:link:visited,
a:visited {
    color: #6a7a6d;  /* Even more muted */
}

/* Remove blue from focus indicators */
*:focus {
    outline-color: #5f7060;  /* Green outline instead of blue */
    box-shadow: inset 0 0 0 1px alpha(#5f7060, 0.5);
}

/* Remove blue from selections */
selection,
*:selected,
.view:selected,
.view selection,
iconview:selected,
textview selection {
    background-color: #5f7060;
    color: #e9e5d4;
}

/* Remove blue from progress bars */
progressbar progress {
    background-color: #7f9080;  /* STALKER green */
}

progressbar trough {
    background-color: #3a4d3e;
}

/* Remove blue from switches */
switch:checked {
    background-color: #5f7060;  /* Green instead of blue */
}

switch:checked slider {
    background-color: #e9e5d4;
}

/* Remove blue from check boxes */
checkbutton:checked,
radiobutton:checked {
    color: #5f7060;
}

checkbutton:checked check,
radiobutton:checked radio {
    background-color: #5f7060;
    border-color: #5f7060;
}

/* ===== ENHANCE GREENS ===== */

/* Make success/positive elements bright green */
.success,
.success-color {
    color: #7f9080;
}

button.success,
button.suggested-action {
    background-color: #5f7060;
    color: #e9e5d4;
}

button.success:hover,
button.suggested-action:hover {
    background-color: #7f9080;
}

/* Green badges/labels */
.badge.success,
label.success {
    background-color: #7f9080;
    color: #1e2920;
}

/* ===== ENHANCE REDS ===== */

/* Make error/destructive elements bright red */
.error,
.error-color {
    color: #b87a7a;
}

button.error,
button.destructive-action {
    background-color: #8b5a5a;
    color: #e9e5d4;
}

button.error:hover,
button.destructive-action:hover {
    background-color: #b87a7a;
}

/* Red badges/labels */
.badge.error,
label.error {
    background-color: #b87a7a;
    color: #1e2920;
}

/* Warning elements (orange-red) */
.warning,
.warning-color {
    color: #bcc6ba;
}

/* ===== GENERAL UI ELEMENTS ===== */

/* Windows */
window {
    background-color: #3a4d3e;
    color: #c9c5b4;
}

/* Buttons */
button {
    background-color: #4a5a4d;
    color: #c9c5b4;
    border: 1px solid #5f7060;
}

button:hover {
    background-color: #5f7060;
    border-color: #7a8a7d;
}

button:active {
    background-color: #3a4d3e;
}

/* Entries/text inputs */
entry {
    background-color: #1e2920;
    color: #c9c5b4;
    border: 1px solid #4a5a4d;
}

entry:focus {
    border-color: #5f7060;
    box-shadow: inset 0 0 0 1px alpha(#5f7060, 0.3);
}

/* Scrollbars */
scrollbar {
    background-color: #3a4d3e;
}

scrollbar slider {
    background-color: #5f7060;
    border-radius: 3px;
}

scrollbar slider:hover {
    background-color: #7a8a7d;
}

/* Notebooks/tabs */
notebook {
    background-color: #3a4d3e;
}

notebook header {
    background-color: #2a3a2e;
}

notebook tab {
    background-color: #3a4d3e;
    color: #9ca69a;
}

notebook tab:checked {
    background-color: #5f7060;
    color: #e9e5d4;
}

/* Menus */
menu,
.menu {
    background-color: #3a4d3e;
    color: #c9c5b4;
}

menuitem:hover,
.menuitem:hover {
    background-color: #5f7060;
    color: #e9e5d4;
}

/* Popovers */
popover {
    background-color: #3a4d3e;
    color: #c9c5b4;
    border: 1px solid #5f7060;
}

/* Headers/titlebars */
headerbar {
    background-color: #2a3a2e;
    color: #c9c5b4;
    border-bottom: 1px solid #4a5a4d;
}

headerbar button {
    background-color: transparent;
}

headerbar button:hover {
    background-color: #3a4d3e;
}

/* Sidebars */
.sidebar {
    background-color: #3a4d3e;
    color: #c9c5b4;
}

.sidebar:selected {
    background-color: #5f7060;
    color: #e9e5d4;
}

/* Lists */
list,
.list {
    background-color: #1e2920;
    color: #c9c5b4;
}

list row:selected,
.list row:selected {
    background-color: #5f7060;
    color: #e9e5d4;
}

/* Toolbars */
toolbar {
    background-color: #3a4d3e;
    color: #c9c5b4;
}

/* Status bars */
statusbar {
    background-color: #2a3a2e;
    color: #9ca69a;
}

/* Info bars */
.info {
    background-color: #5f7060;
    color: #e9e5d4;
}

/* Remove any remaining blue highlights */
*:active,
*:checked,
*:selected {
    /* Force no blue colors */
}

/* Ensure folder colors in file manager show properly */
.nautilus-window iconview {
    -gtk-icon-effect: none;  /* Don't desaturate icons */
}

EOF

# Copy to GTK4 (mostly compatible)
cp "$GTK3_DIR/gtk.css" "$GTK4_DIR/gtk.css"

# Create theme index file
cat > "$THEME_DIR/index.theme" << EOF
[Desktop Entry]
Type=X-GNOME-Metatheme
Name=STALKER-Theme
Comment=STALKER-inspired theme with muted blues and enhanced greens/reds
Encoding=UTF-8

[X-GNOME-Metatheme]
GtkTheme=STALKER-Theme
MetacityTheme=STALKER-Theme
IconTheme=Papirus-Stalker
CursorTheme=default
ButtonLayout=close,minimize,maximize:menu
EOF

echo "========================================================="
echo "  THEME CREATED SUCCESSFULLY!"
echo "========================================================="
echo ""
echo "Theme location: $THEME_DIR"
echo ""
echo "To apply the theme:"
echo "  1. Open GNOME Tweaks"
echo "  2. Go to 'Appearance'"
echo "  3. Select 'STALKER-Theme' as your Applications theme"
echo ""
echo "Or run these commands:"
echo "  gsettings set org.gnome.desktop.interface gtk-theme 'STALKER-Theme'"
echo "  gsettings set org.gnome.desktop.wm.preferences theme 'STALKER-Theme'"
echo ""
echo "For file manager (Nautilus):"
echo "  The theme will automatically apply when set as GTK theme"
echo ""
echo "Color scheme:"
echo "  • Blues: MUTED to gray-greens"
echo "  • Greens: ENHANCED (#7f9080, #5f7060)"
echo "  • Reds: ENHANCED (#b87a7a, #8b5a5a)"
echo ""
