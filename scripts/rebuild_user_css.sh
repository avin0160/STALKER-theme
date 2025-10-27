#!/bin/bash

echo "🔧 Rebuilding user CSS from scratch..."

# Backup
cp ~/.config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css.old 2>/dev/null

# Create clean CSS file
cat > ~/.config/gtk-3.0/gtk.css << 'ENDCSS'
/* STALKER Theme - User CSS Overrides */

/* Color definitions */
@define-color theme_selected_bg_color #6f7e6f;
@define-color theme_selected_fg_color #e9e5d4;

/* File selections */
.view:selected,
.view:selected:focus,
.view selection,
iconview:selected,
iconview:selected:focus {
    background-color: #6f7e6f;
    color: #e9e5d4;
}

/* List selections */
list row:selected,
listbox row:selected {
    background-color: #6f7e6f;
    color: #e9e5d4;
}

/* Treeview selections */
treeview.view:selected,
treeview.view:selected:focus {
    background-color: #6f7e6f;
    color: #e9e5d4;
}

/* GTK Switches (Toggles) */
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

/* Additional green accents */
scrollbar slider {
    background-color: #6f7e6f;
}

scrollbar slider:hover {
    background-color: #8b9b8c;
}

progressbar progress {
    background-color: #7a8a7d;
}

checkbutton:checked {
    background-color: #6f7e6f;
    border-color: #8b9b8c;
}

radiobutton:checked {
    background-color: #6f7e6f;
    border-color: #8b9b8c;
}

entry:focus {
    border-color: #6f7e6f;
}

button:hover {
    background-color: #5a6d5b;
}

button:active {
    background-color: #6f7e6f;
}

ENDCSS

# Copy to GTK 4
cp ~/.config/gtk-3.0/gtk.css ~/.config/gtk-4.0/gtk.css

echo "✅ User CSS rebuilt successfully!"
echo ""
echo "🔄 Close and reopen Tweaks now"
