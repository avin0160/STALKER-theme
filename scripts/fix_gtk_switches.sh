#!/bin/bash

# Fix GTK toggle switches (like in Tweaks app) to be STALKER green

STALKER_GREEN="#6f7e6f"
STALKER_GREEN_HOVER="#8b9b8c"
STALKER_GREEN_DARK="#5a6d5b"

echo "🔧 Fixing GTK toggle switches to STALKER green..."

# Create comprehensive switch CSS for GTK 3
cat >> ~/.config/gtk-3.0/gtk.css << 'EOF'

/* ═══════════════════════════════════════════════════════════
   STALKER GTK SWITCHES (Toggle Buttons) - FORCE GREEN
   ═══════════════════════════════════════════════════════════ */

/* GtkSwitch - The toggle widget used in Settings/Tweaks */
switch {
    background-color: #4d4d4d !important;
    border: 1px solid #3a3a3a !important;
    border-radius: 14px !important;
    min-height: 28px !important;
}

switch:checked {
    background-color: #6f7e6f !important;
    background-image: none !important;
    border-color: #8b9b8c !important;
}

switch:hover {
    background-color: #5a5a5a !important;
}

switch:checked:hover {
    background-color: #8b9b8c !important;
}

/* Switch slider (the moving part) */
switch slider {
    background-color: #e9e5d4 !important;
    background-image: none !important;
    border: none !important;
    border-radius: 50% !important;
    min-width: 24px !important;
    min-height: 24px !important;
    margin: 2px !important;
}

switch:checked slider {
    background-color: #ffffff !important;
}

/* Additional switch states */
switch:disabled {
    opacity: 0.5 !important;
}

switch:backdrop {
    background-color: #3a3a3a !important;
}

switch:checked:backdrop {
    background-color: #5a6d5b !important;
}

/* Force remove any blue backgrounds */
switch, switch * {
    background-image: none !important;
}

switch:checked, switch:checked * {
    background-image: none !important;
}

/* Row switches specifically (common in settings apps) */
row switch {
    background-color: #4d4d4d !important;
}

row switch:checked {
    background-color: #6f7e6f !important;
}

/* ListBox row switches */
list switch, listbox switch {
    background-color: #4d4d4d !important;
}

list switch:checked, listbox switch:checked {
    background-color: #6f7e6f !important;
}

EOF

# Copy to GTK 4
cp ~/.config/gtk-3.0/gtk.css ~/.config/gtk-4.0/gtk.css

# Also update the theme itself
cat >> ~/.themes/STALKER-Theme/gtk-3.0/gtk.css << 'EOF'

/* ═══════════════════════════════════════════════════════════
   GTK SWITCHES - STALKER GREEN (Added for toggle fix)
   ═══════════════════════════════════════════════════════════ */

switch {
    background-color: #4d4d4d !important;
    border: 1px solid #3a3a3a !important;
}

switch:checked {
    background-color: #6f7e6f !important;
    border-color: #8b9b8c !important;
}

switch:hover {
    background-color: #5a5a5a !important;
}

switch:checked:hover {
    background-color: #8b9b8c !important;
}

switch slider {
    background-color: #e9e5d4 !important;
    border-radius: 50% !important;
}

switch:checked slider {
    background-color: #ffffff !important;
}

EOF

# Copy to GTK 4 theme as well
if [ -d ~/.themes/STALKER-Theme/gtk-4.0 ]; then
    cat >> ~/.themes/STALKER-Theme/gtk-4.0/gtk.css << 'EOF'

/* GTK 4 Switches */
switch {
    background-color: #4d4d4d !important;
}

switch:checked {
    background-color: #6f7e6f !important;
}

switch slider {
    background-color: #e9e5d4 !important;
}

switch:checked slider {
    background-color: #ffffff !important;
}

EOF
fi

echo ""
echo "✅ GTK switch CSS added!"
echo ""
echo "🔄 To apply:"
echo "   1. Close Tweaks completely"
echo "   2. Run: killall gnome-tweaks"
echo "   3. Reopen Tweaks"
echo ""
echo "Or restart the GNOME session (logout/login)"
echo ""
echo "🟢 Switches should now be STALKER GREEN!"
