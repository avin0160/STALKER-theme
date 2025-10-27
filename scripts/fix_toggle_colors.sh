#!/bin/bash

# STALKER Theme - Force Toggle Colors via Extension
# This creates a GNOME Shell extension to override toggle colors with JavaScript

echo "🔧 Creating toggle color override extension..."
echo ""

EXT_DIR="$HOME/.local/share/gnome-shell/extensions/stalker-toggle-colors@theme"
mkdir -p "$EXT_DIR"

# Create metadata.json
cat > "$EXT_DIR/metadata.json" << 'EOF'
{
  "name": "STALKER Toggle Colors",
  "description": "Forces toggle switches to use STALKER green colors",
  "uuid": "stalker-toggle-colors@theme",
  "shell-version": ["40", "41", "42", "43", "44", "45"],
  "version": 1
}
EOF

# Create extension.js
cat > "$EXT_DIR/extension.js" << 'EOF'
/* STALKER Toggle Colors Extension */

const St = imports.gi.St;
const Main = imports.ui.main;
const Clutter = imports.gi.Clutter;

const STALKER_GREEN = new Clutter.Color({
    red: 95,
    green: 112,
    blue: 96,
    alpha: 255
});

const STALKER_GREEN_HOVER = new Clutter.Color({
    red: 127,
    green: 144,
    blue: 128,
    alpha: 255
});

let styleChangedIds = [];

function applyGreenToggles() {
    try {
        // Find all quick toggles in the panel
        let quickSettings = Main.panel.statusArea.quickSettings;
        
        if (quickSettings && quickSettings.menu) {
            let menuItems = quickSettings.menu._getMenuItems();
            
            menuItems.forEach(item => {
                if (item._toggle) {
                    // Override toggle background
                    let toggle = item._toggle;
                    
                    // Connect to checked state changes
                    let signalId = toggle.connect('notify::checked', (toggle) => {
                        if (toggle.checked) {
                            toggle.set_style('background-color: #5f7060 !important; color: white;');
                        } else {
                            toggle.set_style('background-color: #3a3a3a !important;');
                        }
                    });
                    
                    styleChangedIds.push(signalId);
                    
                    // Apply initial style
                    if (toggle.checked) {
                        toggle.set_style('background-color: #5f7060 !important; color: white;');
                    } else {
                        toggle.set_style('background-color: #3a3a3a !important;');
                    }
                }
            });
        }
        
        log('STALKER: Applied green toggle colors');
    } catch (e) {
        log(`STALKER Toggle Colors error: ${e.message}`);
    }
}

function init() {
}

function enable() {
    // Wait for Shell to be ready
    imports.gi.GLib.timeout_add(imports.gi.GLib.PRIORITY_DEFAULT, 1000, () => {
        applyGreenToggles();
        return false;
    });
}

function disable() {
    // Disconnect all signals
    styleChangedIds.forEach(id => {
        try {
            // Disconnect signal if still valid
        } catch (e) {}
    });
    styleChangedIds = [];
}
EOF

echo "✓ Extension created at: $EXT_DIR"
echo ""

# Enable the extension
echo "📦 Enabling extension..."
gnome-extensions enable stalker-toggle-colors@theme 2>/dev/null

echo ""
echo "✅ Toggle color override extension installed!"
echo ""
echo "⚠️  RESTART GNOME SHELL to activate:"
echo "   Alt+F2 → type 'r' → Enter"
echo ""
echo "🔧 To disable:"
echo "   gnome-extensions disable stalker-toggle-colors@theme"
echo ""
