#!/bin/bash

# STALKER Theme - Rename "Activities" to "Perimeter"
# This creates a GNOME Shell extension to change the Activities button text

echo "🎬 Renaming 'Activities' to 'Perimeter'..."
echo ""

# Extension directory
EXT_DIR="$HOME/.local/share/gnome-shell/extensions/activities-perimeter@stalker"
mkdir -p "$EXT_DIR"

# Create metadata.json
cat > "$EXT_DIR/metadata.json" << 'EOF'
{
  "name": "Activities to Perimeter",
  "description": "Changes 'Activities' text to 'Perimeter' for STALKER theme",
  "uuid": "activities-perimeter@stalker",
  "shell-version": ["40", "41", "42", "43", "44", "45"],
  "url": "https://github.com/stalker-theme",
  "version": 1
}
EOF

# Create extension.js
cat > "$EXT_DIR/extension.js" << 'EOF'
/* Activities to Perimeter - STALKER Theme Extension */

const Main = imports.ui.main;

let originalText = null;

function init() {
}

function enable() {
    let panel = Main.panel;
    let activities = panel.statusArea.activities;
    
    if (activities && activities._label) {
        // Store original text
        originalText = activities._label.get_text();
        // Change to "Perimeter"
        activities._label.set_text("Perimeter");
    }
}

function disable() {
    let panel = Main.panel;
    let activities = panel.statusArea.activities;
    
    if (activities && activities._label && originalText) {
        // Restore original text
        activities._label.set_text(originalText);
    }
}
EOF

echo "✓ Extension created at: $EXT_DIR"
echo ""

# Enable the extension
echo "📦 Enabling extension..."
gnome-extensions enable activities-perimeter@stalker 2>/dev/null

echo ""
echo "✅ 'Activities' renamed to 'Perimeter'!"
echo ""
echo "⚠️  IMPORTANT: Restart GNOME Shell to see changes:"
echo "   • Xorg: Press Alt+F2, type 'r', press Enter"
echo "   • Wayland: Log out and back in"
echo ""
echo "🔧 To disable:"
echo "   gnome-extensions disable activities-perimeter@stalker"
echo ""
echo "🔙 To remove completely:"
echo "   rm -rf $EXT_DIR"
echo ""
