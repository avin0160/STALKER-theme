#!/bin/bash

echo "🔄 Complete CSS rebuild - no errors this time..."

# Restore from backup if exists, otherwise start fresh
if [ -f ~/.config/gtk-3.0/gtk.css.old ]; then
    cp ~/.config/gtk-3.0/gtk.css.old ~/.config/gtk-3.0/gtk.css.backup
fi

# Create completely clean CSS file
cat > ~/.config/gtk-3.0/gtk.css << 'ENDCSS'
@define-color theme_selected_bg_color #6f7e6f;
@define-color theme_selected_fg_color #e9e5d4;

.view:selected {
    background-color: #6f7e6f;
    color: #e9e5d4;
}

list row:selected {
    background-color: #6f7e6f;
    color: #e9e5d4;
}

treeview.view:selected {
    background-color: #6f7e6f;
    color: #e9e5d4;
}

switch {
    background-color: #4d4d4d;
    border: 1px solid #3a3a3a;
}

switch:checked {
    background-color: #6f7e6f;
    border-color: #8b9b8c;
}

switch slider {
    background-color: #e9e5d4;
}

switch:checked slider {
    background-color: #ffffff;
}
ENDCSS

# Copy to GTK 4
cp ~/.config/gtk-3.0/gtk.css ~/.config/gtk-4.0/gtk.css

echo "✅ Clean CSS created!"
echo ""
echo "Now testing..."

# Kill and restart tweaks
killall gnome-tweaks 2>/dev/null
sleep 2
gnome-tweaks &

echo ""
echo "🟢 Check if switches are green now!"
