#!/bin/bash

# Clean fix for GTK switches without syntax errors

echo "🔧 Fixing GTK toggle switches (clean version)..."

# Backup current file
cp ~/.config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css.backup

# Remove the broken switch CSS we just added
sed -i '/STALKER GTK SWITCHES/,/EOF/d' ~/.config/gtk-3.0/gtk.css

# Add clean switch CSS
cat >> ~/.config/gtk-3.0/gtk.css << 'ENDCSS'

/* STALKER GTK Switches */
switch {
    background-color: #4d4d4d;
    border: 1px solid #3a3a3a;
    border-radius: 14px;
    min-height: 28px;
}

switch:checked {
    background-color: #6f7e6f;
    background-image: none;
    border-color: #8b9b8c;
}

switch:hover {
    background-color: #5a5a5a;
}

switch:checked:hover {
    background-color: #8b9b8c;
}

switch slider {
    background-color: #e9e5d4;
    background-image: none;
    border: none;
    border-radius: 50%;
    min-width: 24px;
    min-height: 24px;
    margin: 2px;
}

switch:checked slider {
    background-color: #ffffff;
}

ENDCSS

# Copy to GTK 4
cp ~/.config/gtk-3.0/gtk.css ~/.config/gtk-4.0/gtk.css

echo "✅ Clean switch CSS added!"
echo ""
echo "🔄 Close and reopen Tweaks to see green switches"
