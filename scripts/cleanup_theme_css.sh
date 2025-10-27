#!/bin/bash

echo "🧹 Cleaning up broken CSS from theme files..."

# Backup
cp ~/.themes/STALKER-Theme/gtk-3.0/gtk.css ~/.themes/STALKER-Theme/gtk-3.0/gtk.css.broken

# Find where the broken CSS starts (line with "ENHANCED GREEN ACCENTS")
BREAK_LINE=$(grep -n "ENHANCED GREEN ACCENTS" ~/.themes/STALKER-Theme/gtk-3.0/gtk.css | head -1 | cut -d: -f1)

if [ -n "$BREAK_LINE" ]; then
    # Keep everything before the broken section
    head -n $((BREAK_LINE - 1)) ~/.themes/STALKER-Theme/gtk-3.0/gtk.css > ~/.themes/STALKER-Theme/gtk-3.0/gtk.css.tmp
    mv ~/.themes/STALKER-Theme/gtk-3.0/gtk.css.tmp ~/.themes/STALKER-Theme/gtk-3.0/gtk.css
    echo "✅ Removed broken CSS from line $BREAK_LINE onwards"
else
    echo "⚠️  Could not find broken section marker"
fi

# Now add clean switch CSS only
cat >> ~/.themes/STALKER-Theme/gtk-3.0/gtk.css << 'ENDCSS'

/* GTK Switches (Toggles) - Clean Version */
switch {
    background-color: #4d4d4d;
    border: 1px solid #3a3a3a;
    border-radius: 14px;
}

switch:checked {
    background-color: #6f7e6f;
    border-color: #8b9b8c;
}

switch slider {
    background-color: #e9e5d4;
    border-radius: 50%;
}

switch:checked slider {
    background-color: #ffffff;
}
ENDCSS

echo "✅ Theme CSS cleaned and fixed!"
echo ""
echo "🔄 Restart Tweaks to see green switches"
