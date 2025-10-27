#!/bin/bash

# Ultimate GTK switch fix - Force with highest CSS priority

echo "🎯 Applying ultimate switch color fix..."

# Create VERY aggressive CSS with maximum specificity
cat > ~/.config/gtk-3.0/gtk-switches-override.css << 'ENDCSS'
/* STALKER Switches - Maximum Priority Override */

* switch,
row switch,
list switch,
listbox switch,
box switch,
window switch,
.content switch,
.view switch {
    background-color: #4d4d4d;
    background-image: none;
    border: 1px solid #3a3a3a;
    border-radius: 14px;
    min-height: 28px;
}

* switch:checked,
row switch:checked,
list switch:checked,
listbox switch:checked,
box switch:checked,
window switch:checked,
.content switch:checked,
.view switch:checked {
    background-color: #6f7e6f;
    background-image: none;
    border-color: #8b9b8c;
}

* switch slider,
row switch slider,
list switch slider,
listbox switch slider,
box switch slider,
window switch slider,
.content switch slider,
.view switch slider {
    background-color: #e9e5d4;
    background-image: none;
    border: none;
    border-radius: 50%;
    min-width: 24px;
    min-height: 24px;
    margin: 2px;
}

* switch:checked slider,
row switch:checked slider,
list switch:checked slider,
listbox switch:checked slider,
box switch:checked slider,
window switch:checked slider,
.content switch:checked slider,
.view switch:checked slider {
    background-color: #ffffff;
    background-image: none;
}
ENDCSS

# Import this into main user CSS at the TOP (highest priority)
cat ~/.config/gtk-3.0/gtk-switches-override.css > /tmp/gtk-css-new
cat ~/.config/gtk-3.0/gtk.css >> /tmp/gtk-css-new
mv /tmp/gtk-css-new ~/.config/gtk-3.0/gtk.css

# Copy to GTK 4
cp ~/.config/gtk-3.0/gtk.css ~/.config/gtk-4.0/gtk.css

echo "✅ Maximum priority switch CSS applied!"
echo ""
echo "🔄 Testing: Close ALL GTK apps and reopen them"
echo "   Run: killall gnome-tweaks && gnome-tweaks"
