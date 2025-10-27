#!/bin/bash

# STALKER GNOME Shell Theme Creator
# Converts all blues to STALKER greens in GNOME Shell interface

echo "🎬 Creating STALKER GNOME Shell Theme..."

# STALKER color palette
STALKER_PRIMARY="#3a4d3e"      # Dark green
STALKER_ACCENT="#5f7060"        # Medium green
STALKER_SELECTION="#6a7a6d"     # Grey-green (selection)
STALKER_LIGHT="#7a8a7d"         # Light green
STALKER_RED_DARK="#6d4545"      # Dark red
STALKER_RED_MEDIUM="#8b5a5a"    # Medium red
STALKER_BEIGE="#a39e8f"         # Beige
STALKER_GREY_GREEN="#7f9080"    # Zone grey-green

# Create theme directory
THEME_DIR="$HOME/.themes/STALKER-Theme/gnome-shell"
mkdir -p "$THEME_DIR"

echo "📁 Creating GNOME Shell CSS..."

# Create gnome-shell.css with STALKER colors
cat > "$THEME_DIR/gnome-shell.css" << 'SHELLCSS'
/* STALKER GNOME Shell Theme
 * "Let everything that's been planned come true."
 * 
 * Replaces all blue UI elements with STALKER greens
 */

/* === Color Definitions === */
stage {
  color: #e6e6e6;
}

/* === Selection/Highlight Colors (BLUE → GREEN) === */
.popup-menu-item:checked,
.popup-menu-item:active,
.popup-menu-item:focus,
.popup-menu-item:hover {
  background-color: #6a7a6d !important;  /* STALKER grey-green instead of blue */
  color: #ffffff !important;
}

/* === Toggle Switches (BLUE → GREEN) - COMPREHENSIVE === */
.toggle-switch,
.toggle-switch-us,
switch {
  background-color: #3a3a3a !important;
  border: 1px solid #5a5a5a !important;
}

.toggle-switch:checked,
.toggle-switch-us:checked,
switch:checked {
  background-color: #5f7060 !important;  /* STALKER accent green */
  border-color: #7f9080 !important;
}

.toggle-switch:hover,
.toggle-switch-us:hover {
  background-color: #4a4a4a !important;
}

.toggle-switch:checked:hover,
.toggle-switch-us:checked:hover {
  background-color: #7f9080 !important;  /* Brighter green on hover */
}

/* === Sliders (BLUE → GREEN) === */
.slider {
  -barlevel-height: 0.3em;
  -barlevel-background-color: #3a3a3a;
  -barlevel-active-background-color: #5f7060 !important;  /* STALKER green */
  -barlevel-overdrive-color: #8b5a5a;  /* Red for warnings */
  -barlevel-overdrive-separator-width: 0.2em;
  color: #5f7060 !important;
}

/* === Buttons (Focus/Hover) === */
.button {
  background-color: #3a3a3a;
  border: 1px solid #5a5a5a;
  color: #e6e6e6;
  border-radius: 6px;
  padding: 8px 16px;
}

.button:hover {
  background-color: #4a4a4a;
  border-color: #6a7a6d !important;  /* STALKER grey-green */
}

.button:focus {
  border-color: #5f7060 !important;  /* STALKER accent */
  box-shadow: 0 0 0 2px rgba(95, 112, 96, 0.3) !important;
}

.button:active,
.button:checked {
  background-color: #5f7060 !important;  /* STALKER green */
  border-color: #3a4d3e !important;
  color: #ffffff;
}

/* === Radio Buttons (BLUE → GREEN) === */
.check-box,
.radio-button {
  border: 2px solid #5a5a5a;
  background-color: transparent;
}

.check-box:checked,
.radio-button:checked {
  background-color: #5f7060 !important;  /* STALKER green */
  border-color: #3a4d3e !important;
}

/* === Links (BLUE → GREEN) === */
.url-highlighter {
  link-color: #7a8a7d !important;  /* Light STALKER green */
}

a,
a:link {
  color: #7a8a7d !important;
}

a:hover {
  color: #5f7060 !important;
}

/* === Workspace Switcher (BLUE → GREEN) === */
.workspace-thumbnail-indicator {
  border: 3px solid #5f7060 !important;  /* STALKER green border */
  background-color: transparent;
}

.workspace-background {
  background-color: #2a2a2a;
}

/* === Window Selection (BLUE → GREEN) === */
.window-clone-border {
  border: 4px solid #5f7060 !important;  /* STALKER green */
  border-radius: 6px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
}

/* === Overview Search (BLUE → GREEN) === */
#searchEntry {
  background-color: #3a3a3a;
  border: 2px solid #5a5a5a;
  color: #e6e6e6;
  border-radius: 24px;
  padding: 8px 16px;
}

#searchEntry:focus {
  border-color: #5f7060 !important;  /* STALKER green */
  box-shadow: 0 0 0 3px rgba(95, 112, 96, 0.2) !important;
}

/* === App Grid Selection (BLUE → GREEN) === */
.app-well-app:hover .overview-icon,
.app-well-app:focus .overview-icon,
.app-well-app:selected .overview-icon {
  background-color: rgba(106, 122, 109, 0.3) !important;  /* STALKER grey-green */
  border-radius: 12px;
}

.app-well-app.running .overview-icon {
  background-image: none;
  background-color: rgba(95, 112, 96, 0.2);  /* Subtle green for running apps */
}

/* === Dash (BLUE → GREEN) === */
.dash-item-container > StButton {
  background-color: transparent;
}

.dash-item-container > StButton:hover {
  background-color: rgba(106, 122, 109, 0.3) !important;  /* STALKER grey-green */
}

.dash-item-container > StButton:checked {
  background-color: rgba(95, 112, 96, 0.4) !important;  /* STALKER green */
}

/* === Notifications (BLUE → GREEN) === */
.notification-banner {
  background-color: #3a3a3a;
  border: 1px solid #5a5a5a;
  border-left: 4px solid #5f7060 !important;  /* STALKER green accent */
}

.notification-banner:hover {
  background-color: #4a4a4a;
  border-left-color: #7a8a7d !important;
}

/* === Quick Settings (BLUE → GREEN) === */
.quick-toggle {
  background-color: #3a3a3a;
  border: 1px solid #5a5a5a;
  border-radius: 12px;
}

.quick-toggle:hover {
  background-color: #4a4a4a;
  border-color: #6a7a6d !important;
}

.quick-toggle:checked {
  background-color: #5f7060 !important;  /* STALKER green */
  border-color: #3a4d3e !important;
  color: #ffffff;
}

/* === Calendar (BLUE → GREEN) === */
.calendar-day-base {
  background-color: transparent;
  border: 1px solid transparent;
}

.calendar-day-base:hover,
.calendar-day-base:focus {
  background-color: rgba(106, 122, 109, 0.2) !important;  /* STALKER grey-green */
}

.calendar-day-base:active,
.calendar-day-base:selected {
  background-color: #5f7060 !important;  /* STALKER green */
  color: #ffffff;
  font-weight: bold;
}

.calendar-today {
  background-color: rgba(95, 112, 96, 0.3) !important;  /* Light STALKER green */
  border: 2px solid #5f7060 !important;
  font-weight: bold;
}

/* === Progress Bars (BLUE → GREEN) === */
.progress-bar {
  background-color: #3a3a3a;
  border-radius: 4px;
  height: 6px;
}

.progress-bar .progress {
  background-color: #5f7060 !important;  /* STALKER green */
  border-radius: 4px;
}

/* === Panel (Top Bar) === */
.panel {
  background-color: rgba(40, 40, 40, 0.95);
  color: #e6e6e6;
}

.panel .panel-button {
  color: #e6e6e6;
}

.panel .panel-button:hover {
  background-color: rgba(106, 122, 109, 0.2) !important;  /* STALKER grey-green */
}

.panel .panel-button:active,
.panel .panel-button:checked,
.panel .panel-button:focus {
  background-color: rgba(95, 112, 96, 0.3) !important;  /* STALKER green */
}

/* === System Menu === */
.popup-menu {
  background-color: #3a3a3a;
  border: 1px solid #5a5a5a;
  border-radius: 12px;
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.6);
}

.popup-menu-item {
  border-radius: 8px;
}

.popup-menu-item:hover {
  background-color: rgba(106, 122, 109, 0.3) !important;  /* STALKER grey-green */
}

.popup-menu-item:active {
  background-color: #5f7060 !important;  /* STALKER green */
  color: #ffffff;
}

/* === Modal Dialogs (BLUE → GREEN) === */
.modal-dialog {
  background-color: #3a3a3a;
  border: 2px solid #5a5a5a;
  border-radius: 12px;
}

.modal-dialog .modal-dialog-linked-button {
  background-color: #4a4a4a;
  border: 1px solid #5a5a5a;
  color: #e6e6e6;
}

.modal-dialog .modal-dialog-linked-button:hover {
  background-color: #5a5a5a;
  border-color: #6a7a6d !important;
}

.modal-dialog .modal-dialog-linked-button:focus {
  border-color: #5f7060 !important;
  box-shadow: 0 0 0 2px rgba(95, 112, 96, 0.3) !important;
}

/* === Screenshot UI (BLUE → GREEN) === */
.screenshot-ui-panel {
  background-color: #3a3a3a;
  border: 2px solid #5a5a5a;
}

.screenshot-ui-area-selector {
  border: 3px solid #5f7060 !important;  /* STALKER green */
}

/* === OSD (On-Screen Display) === */
.osd-window {
  background-color: rgba(40, 40, 40, 0.95);
  border: 1px solid #5a5a5a;
  border-radius: 12px;
}

.osd-window .level {
  background-color: #3a3a3a;
  border-radius: 4px;
}

.osd-window .level-bar {
  background-color: #5f7060 !important;  /* STALKER green */
  border-radius: 4px;
}

/* === Scrollbars === */
StScrollBar StButton#vhandle,
StScrollBar StButton#hhandle {
  background-color: #5a5a5a;
  border-radius: 4px;
}

StScrollBar StButton#vhandle:hover,
StScrollBar StButton#hhandle:hover {
  background-color: #6a7a6d !important;  /* STALKER grey-green */
}

/* === Entries/Text Inputs === */
StEntry {
  background-color: #3a3a3a;
  border: 2px solid #5a5a5a;
  color: #e6e6e6;
  border-radius: 6px;
  padding: 8px 12px;
}

StEntry:focus {
  border-color: #5f7060 !important;  /* STALKER green */
  box-shadow: 0 0 0 2px rgba(95, 112, 96, 0.2) !important;
}

StEntry:hover {
  border-color: #6a7a6d !important;
}

/* === Looking Glass (Alt+F2 Debug Console) === */
.lg-dialog {
  background-color: #2a2a2a;
  border: 2px solid #5f7060 !important;  /* STALKER green */
  border-radius: 8px;
}

.lg-dialog StEntry {
  background-color: #3a3a3a;
  border-color: #5a5a5a;
}

.lg-completions-text {
  color: #7a8a7d;  /* Light STALKER green */
}

/* === STALKER-specific overrides for selection boxes === */
StBoxLayout.vertical .popup-menu-item:checked,
StBoxLayout.horizontal .popup-menu-item:checked {
  background-color: #6a7a6d !important;  /* Force grey-green */
}

/* === Workspace preview boxes (Multi-Monitor settings) === */
.workspace-thumbnails {
  spacing: 8px;
}

.workspace-thumbnail {
  border: 3px solid transparent;
  background-color: #2a2a2a;
}

.workspace-thumbnail:hover {
  border-color: #6a7a6d !important;  /* STALKER grey-green */
}

.workspace-thumbnail:selected {
  border-color: #5f7060 !important;  /* STALKER green */
  background-color: rgba(95, 112, 96, 0.1);
}

/* === End STALKER Theme === */
SHELLCSS

echo "✓ GNOME Shell CSS created"

# Check GNOME Shell version
GNOME_VERSION=$(gnome-shell --version | grep -oP '(?<=GNOME Shell )[0-9]+')

echo ""
echo "📦 GNOME Shell version detected: $GNOME_VERSION"
echo ""
echo "✓ STALKER GNOME Shell theme created!"
echo ""
echo "⚠️  IMPORTANT: To apply GNOME Shell theme:"
echo ""
echo "  Option 1: Install GNOME Shell Extensions (User Themes)"
echo "    1. Install extension: sudo apt install gnome-shell-extension-user-theme"
echo "    2. Enable it: gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com"
echo "    3. Set theme: gsettings set org.gnome.shell.extensions.user-theme name 'STALKER-Theme'"
echo "    4. Restart GNOME Shell: Alt+F2, type 'r', press Enter (Xorg) or log out/in (Wayland)"
echo ""
echo "  Option 2: Manual system-wide installation (requires sudo)"
echo "    Run: sudo ./scripts/apply_gnome_shell_to_system.sh"
echo ""
echo "📝 Note: GNOME Shell themes require the User Themes extension."
echo "    Without it, shell elements will remain default Adwaita blue."
echo ""

