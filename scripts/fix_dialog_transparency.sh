#!/bin/bash

# STALKER Theme - Fix Dialog Transparency
# Makes file chooser dialogs and windows fully opaque

echo "🔧 Fixing dialog transparency..."
echo ""

GTK3_CSS="$HOME/.themes/STALKER-Theme/gtk-3.0/gtk.css"
GTK4_CSS="$HOME/.themes/STALKER-Theme/gtk-4.0/gtk.css"

# Add explicit opacity rules to GTK3
cat >> "$GTK3_CSS" << 'EOF'

/* === FIX TRANSPARENCY - Force Opaque Dialogs === */

window,
window.background,
window.csd {
    opacity: 1.0 !important;
}

/* File chooser - make SOLID */
filechooser,
.filechooser,
filechooserdialog,
.filechooserdialog {
    background-color: #3a4d3e !important;
    opacity: 1.0 !important;
}

filechooser * {
    opacity: 1.0 !important;
}

/* All dialogs - make SOLID */
dialog,
.dialog,
messagedialog,
.messagedialog {
    background-color: #3a4d3e !important;
    opacity: 1.0 !important;
}

/* Window decorations */
decoration {
    opacity: 1.0 !important;
}

/* Backdrop (unfocused windows) */
window:backdrop,
dialog:backdrop {
    opacity: 1.0 !important;
}

/* Override any transparency */
* {
    -gtk-icon-shadow: none;
}

window.background {
    background-color: #3a4d3e !important;
}

EOF

# Copy to GTK4
cp "$GTK3_CSS" "$GTK4_CSS"

echo "✅ Dialog transparency fixed!"
echo ""
echo "   All windows and dialogs are now fully opaque"
echo ""
echo "🔄 Changes will apply to new windows"
echo "   Close and reopen file dialogs to see the fix"
echo ""
