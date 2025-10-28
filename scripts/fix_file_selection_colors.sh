#!/bin/bash

# Fix file manager selection colors that turned blue

echo "🔧 Fixing file manager selection colors..."

# Create very specific CSS for Nautilus (Files) and all file managers
cat > ~/.config/gtk-3.0/gtk.css << 'EOF'
@define-color theme_selected_bg_color #6f7e6f;
@define-color theme_selected_fg_color #e9e5d4;

/* === FILE MANAGER SELECTIONS - FORCE GREEN === */

/* Nautilus (Files) specific */
.nautilus-window .view:selected,
.nautilus-window .view:selected:focus,
.nautilus-window .view selection,
.nautilus-window iconview:selected,
.nautilus-window iconview:selected:focus,
.nautilus-canvas-item.dim-label:selected,
.nautilus-list-dim-label:selected {
    background-color: #6f7e6f;
    background-image: none;
    color: #e9e5d4;
}

/* Generic file manager selections */
.view:selected,
.view:selected:focus,
.view selection,
iconview:selected,
iconview:selected:focus {
    background-color: #6f7e6f;
    background-image: none;
    color: #e9e5d4;
}

/* List and tree selections */
list row:selected,
list row:selected:focus,
listbox row:selected,
listbox row:selected:focus {
    background-color: #6f7e6f;
    background-image: none;
    color: #e9e5d4;
}

treeview.view:selected,
treeview.view:selected:focus,
treeview.view:selected:hover {
    background-color: #6f7e6f;
    background-image: none;
    color: #e9e5d4;
}

/* Icon view selections */
.view.content-view.icon-view:selected,
.content-view iconview:selected {
    background-color: #6f7e6f;
    background-image: none;
}

/* File chooser dialogs */
filechooser .view:selected,
filechooser iconview:selected,
filechooser list row:selected {
    background-color: #6f7e6f;
    background-image: none;
    color: #e9e5d4;
}

/* Pathbar selections */
.pathbar button:checked,
.path-bar button:checked {
    background-color: #6f7e6f;
    background-image: none;
    color: #e9e5d4;
}

/* === GTK SWITCHES === */
switch {
    background-color: #4d4d4d;
    background-image: none;
    border: 1px solid #3a3a3a;
}

switch:checked {
    background-color: #6f7e6f;
    background-image: none;
    border-color: #8b9b8c;
}

switch slider {
    background-color: #e9e5d4;
    background-image: none;
}

switch:checked slider {
    background-color: #ffffff;
    background-image: none;
}

/* === ADDITIONAL GREEN ACCENTS === */
scrollbar slider {
    background-color: #6f7e6f;
    background-image: none;
}

scrollbar slider:hover {
    background-color: #8b9b8c;
}

progressbar progress {
    background-color: #7a8a7d;
    background-image: none;
}

checkbutton:checked {
    background-color: #6f7e6f;
    background-image: none;
}

radiobutton:checked {
    background-color: #6f7e6f;
    background-image: none;
}

entry:focus {
    border-color: #6f7e6f;
}

button:hover {
    background-color: #5a6d5b;
    background-image: none;
}

button:active,
button:checked {
    background-color: #6f7e6f;
    background-image: none;
}
EOF

# Copy to GTK 4
cp ~/.config/gtk-3.0/gtk.css ~/.config/gtk-4.0/gtk.css

echo "✅ File manager CSS fixed!"
echo ""
echo "🔄 Restart file manager to apply:"
echo "   killall nautilus && nautilus &"
