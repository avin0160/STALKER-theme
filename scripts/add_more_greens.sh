#!/bin/bash

# STALKER Theme - Add More Green Accents
# Enhances GTK and GNOME Shell themes with additional green elements

echo "🌿 Adding more STALKER green throughout UI..."
echo ""

STALKER_GREEN="#6f7e6f"
STALKER_GREEN_BRIGHT="#8b9b8c"
STALKER_GREEN_DARK="#5a6d5b"
STALKER_GREEN_ACCENT="#7a8a7d"

# Enhanced GTK CSS with more greens
cat >> ~/.themes/STALKER-Theme/gtk-3.0/gtk.css << 'GTKEOF'

/* === ENHANCED GREEN ACCENTS === */

/* Scrollbar thumbs - green */
scrollbar slider {
    background-color: #6f7e6f !important;
    border: 1px solid #8b9b8c !important;
}

scrollbar slider:hover {
    background-color: #8b9b8c !important;
}

/* Progress bars - green */
progressbar progress {
    background-color: #7a8a7d !important;
    background-image: none !important;
}

progressbar trough {
    background-color: #3a4d3e !important;
}

/* Spinners/loading indicators */
spinner {
    color: #7a8a7d !important;
}

/* Scale/sliders - green */
scale slider {
    background-color: #6f7e6f !important;
    border: 2px solid #8b9b8c !important;
}

scale slider:hover {
    background-color: #8b9b8c !important;
}

scale trough {
    background-color: #3a4d3e !important;
}

scale highlight {
    background-color: #7a8a7d !important;
}

/* Checkboxes - green when checked */
checkbutton:checked check,
checkbox:checked {
    background-color: #6f7e6f !important;
    border-color: #8b9b8c !important;
    color: white !important;
}

/* Radio buttons - green when checked */
radiobutton:checked radio {
    background-color: #6f7e6f !important;
    border-color: #8b9b8c !important;
}

/* Links - green tint */
link,
*:link {
    color: #7a8a7d !important;
}

link:hover,
*:link:hover {
    color: #8b9b8c !important;
}

/* Focus indicators - green glow */
*:focus {
    outline-color: #6f7e6f !important;
    outline-width: 2px !important;
    box-shadow: 0 0 0 2px rgba(111, 126, 111, 0.3) !important;
}

/* Entry focus - green border */
entry:focus {
    border-color: #6f7e6f !important;
    box-shadow: inset 0 0 0 1px #6f7e6f !important;
}

/* Buttons - green accents */
button:hover {
    background-color: #5a6d5b !important;
    border-color: #6f7e6f !important;
}

button:active,
button:checked {
    background-color: #6f7e6f !important;
    border-color: #8b9b8c !important;
}

/* Suggested/default buttons - bright green */
button.suggested-action,
button.default {
    background-color: #6f7e6f !important;
    color: white !important;
    border-color: #8b9b8c !important;
}

button.suggested-action:hover,
button.default:hover {
    background-color: #8b9b8c !important;
}

/* Notebook tabs - green active tab */
notebook tab:checked {
    background-color: #6f7e6f !important;
    color: #e9e5d4 !important;
    border-bottom: 2px solid #8b9b8c !important;
}

notebook tab:hover {
    background-color: #5a6d5b !important;
}

/* Sidebar selected items - green */
.sidebar row:selected,
.sidebar .view:selected {
    background-color: #6f7e6f !important;
    color: #e9e5d4 !important;
    border-left: 3px solid #8b9b8c !important;
}

/* Menu items - green highlight */
menuitem:hover,
.menuitem:hover {
    background-color: #6f7e6f !important;
    color: #e9e5d4 !important;
}

/* Popover items */
popover .view:selected,
popover row:selected {
    background-color: #6f7e6f !important;
}

/* Info bars - green tint for info */
.info,
infobar.info {
    background-color: #5a6d5b !important;
    border: 1px solid #6f7e6f !important;
}

/* Headerbar buttons - green on hover */
headerbar button:hover {
    background-color: #5a6d5b !important;
}

headerbar button:active,
headerbar button:checked {
    background-color: #6f7e6f !important;
}

/* Level bars - green */
levelbar trough {
    background-color: #3a4d3e !important;
}

levelbar block.filled {
    background-color: #7a8a7d !important;
}

levelbar block.high {
    background-color: #8b9b8c !important;
}

/* Separators - subtle green */
separator {
    background-color: #5a6d5b !important;
}

/* Badges/labels - green accent */
.badge {
    background-color: #6f7e6f !important;
    color: white !important;
}

/* Accent borders everywhere */
.view:selected,
*:selected {
    border-left: 2px solid #8b9b8c !important;
}
GTKEOF

# Copy to GTK4
cp ~/.themes/STALKER-Theme/gtk-3.0/gtk.css ~/.themes/STALKER-Theme/gtk-4.0/gtk.css

echo "✅ GTK themes enhanced with green accents"
echo ""

# Enhanced GNOME Shell CSS with more greens
cat >> ~/.themes/STALKER-Theme/gnome-shell/gnome-shell.css << 'SHELLEOF'

/* === ENHANCED GREEN ACCENTS FOR GNOME SHELL === */

/* Panel items - green on hover */
.panel-button:hover {
  background-color: rgba(111, 126, 111, 0.2) !important;
  border-radius: 4px !important;
}

.panel-button:active,
.panel-button:checked {
  background-color: rgba(111, 126, 111, 0.4) !important;
}

/* Workspace thumbnails - green border for active */
.workspace-thumbnail-indicator {
  border: 3px solid #6f7e6f !important;
}

/* App switcher - green highlight */
.switcher-list .item-box:selected {
  background-color: #6f7e6f !important;
  border: 2px solid #8b9b8c !important;
}

/* Search results - green selection */
.search-section-content .list-search-result:selected,
.search-section-content .list-search-result:focus {
  background-color: #6f7e6f !important;
  border-left: 3px solid #8b9b8c !important;
}

/* Overview search - green */
#searchEntry {
  border: 2px solid #5a6d5b !important;
}

#searchEntry:focus {
  border-color: #6f7e6f !important;
  box-shadow: 0 0 8px rgba(111, 126, 111, 0.4) !important;
}

/* Calendar - green for today */
.calendar-day-base.calendar-day-heading {
  color: #7a8a7d !important;
}

.calendar-today {
  background-color: #6f7e6f !important;
  color: white !important;
  border-radius: 50% !important;
  font-weight: bold !important;
}

.calendar-day:hover {
  background-color: rgba(111, 126, 111, 0.2) !important;
}

.calendar-day:selected {
  background-color: #6f7e6f !important;
  color: white !important;
}

/* Notifications - green accents */
.notification-banner {
  border-left: 3px solid #6f7e6f !important;
}

.notification-banner:hover {
  background-color: rgba(90, 109, 91, 0.3) !important;
}

.notification-button:hover {
  background-color: #5a6d5b !important;
}

/* Message list - green */
.message-list-section-title {
  color: #7a8a7d !important;
}

.message:hover {
  background-color: rgba(111, 126, 111, 0.1) !important;
}

/* System menu - green hover */
.popup-menu-item:hover {
  background-color: #6f7e6f !important;
}

/* Sliders - green fill */
.slider {
  -barlevel-active-background-color: #7a8a7d !important;
  -barlevel-active-border-color: #8b9b8c !important;
}

/* OSD (on-screen display) - green accents */
.osd-window {
  border: 2px solid #5a6d5b !important;
}

.level {
  background-color: #3a4d3e !important;
}

.level-bar {
  background-color: #7a8a7d !important;
}

/* Dash (app launcher) - green */
.dash-item-container .app-well-app:hover {
  background-color: rgba(111, 126, 111, 0.3) !important;
}

.dash-item-container .app-well-app:active,
.dash-item-container .app-well-app:checked {
  background-color: #6f7e6f !important;
}

/* Running app indicator - green dot */
.app-well-app-running-dot {
  background-color: #8b9b8c !important;
  width: 6px !important;
  height: 6px !important;
}

/* Window close button - keep red, but add green hover for minimize/maximize */
.window-button:hover {
  background-color: rgba(111, 126, 111, 0.5) !important;
}

/* Overview background - subtle green tint */
#overview {
  background-color: rgba(58, 77, 62, 0.95) !important;
}

/* App folders - green background */
.app-folder-dialog {
  border: 3px solid #6f7e6f !important;
}

.app-folder-dialog .folder-name-entry {
  border-bottom: 2px solid #6f7e6f !important;
}

/* Screenshots UI - green */
.screenshot-ui-area-indicator {
  border: 3px solid #8b9b8c !important;
  background-color: rgba(111, 126, 111, 0.2) !important;
}

.screenshot-ui-panel {
  border: 2px solid #5a6d5b !important;
}

/* Power/volume sliders - green */
.quick-slider {
  border: 1px solid #5a6d5b !important;
}

.quick-slider .slider-bin > StBoxLayout {
  background-color: #7a8a7d !important;
}
SHELLEOF

echo "✅ GNOME Shell theme enhanced with green accents"
echo ""

# Update user CSS with even more selections
cat >> ~/.config/gtk-3.0/gtk.css << 'USEREOF'

/* === ADDITIONAL GREEN HIGHLIGHTS === */

/* Treeview expanders - green */
treeview.view.expander {
    color: #7a8a7d !important;
}

/* List rows on hover - green tint */
row:hover {
    background-color: rgba(111, 126, 111, 0.1) !important;
}

/* Pathbar buttons (breadcrumbs) - green */
.path-bar button:checked {
    background-color: #6f7e6f !important;
    color: white !important;
}

/* Toolbar items */
toolbar button:checked {
    background-color: #6f7e6f !important;
}

/* Active accents */
*:active {
    border-color: #6f7e6f !important;
}
USEREOF

cp ~/.config/gtk-3.0/gtk.css ~/.config/gtk-4.0/gtk.css

echo "✅ User CSS updated with more green highlights"
echo ""
echo "🔄 Apply changes:"
echo "   1. Restart GNOME Shell: Alt+F2 → 'r' → Enter"
echo "   2. Restart applications to see changes"
echo ""
echo "🌿 Green accents added to:"
echo "   • Scrollbars, progress bars, sliders"
echo "   • Checkboxes, radio buttons"
echo "   • Focus indicators, entries"
echo "   • Buttons (hover, active)"
echo "   • Tabs, sidebars, menus"
echo "   • Panel, calendar, notifications"
echo "   • App launcher, window controls"
echo "   • Search, overview, screenshots"
echo "   • And much more!"
echo ""
echo "✨ Your UI is now VERY green! 🟢"
