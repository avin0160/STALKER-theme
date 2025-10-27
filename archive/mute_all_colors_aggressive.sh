#!/bin/bash

# Aggressive Color Muting for STALKER Theme
# Only keeps greens, reds, and beiges - mutes everything else

echo "============================================================"
echo "  STALKER AGGRESSIVE COLOR MUTING"
echo "  Keeping only: Greens, Reds, Beiges"
echo "  Muting: Blues, Purples, Cyans, Magentas, Bright Colors"
echo "============================================================"
echo ""

# STALKER color palette
BEIGE_LIGHT="#c9c5b4"
BEIGE_MID="#a39e8f"
GREY_GREEN_DARK="#6a7a6d"
GREY_GREEN_MID="#7f9080"
GREY_GREEN_LIGHT="#9ca69a"
STALKER_GREEN_DARK="#3a4d3e"
STALKER_GREEN_MID="#5f7060"
STALKER_GREEN_LIGHT="#7a8a7d"
STALKER_RED_LIGHT="#b87a7a"
STALKER_RED_MID="#8b5a5a"
STALKER_RED_DARK="#6d4545"

ICON_DIR="$HOME/.local/share/icons/Papirus-Stalker"

if [ ! -d "$ICON_DIR" ]; then
    echo "❌ Papirus-Stalker icon theme not found!"
    exit 1
fi

echo "[1/4] Muting blues, cyans, and purples to grey-greens..."

# Comprehensive blue/cyan/purple to grey-green mapping
declare -A COLOR_MAP=(
    # All blues - dark to light
    ["#000080"]="$GREY_GREEN_DARK"  # navy
    ["#0000cd"]="$GREY_GREEN_DARK"  # mediumblue
    ["#0000ff"]="$GREY_GREEN_MID"   # blue
    ["#1e3a8a"]="$GREY_GREEN_DARK"  # dark blue
    ["#1e40af"]="$GREY_GREEN_DARK"
    ["#1e88e5"]="$GREY_GREEN_MID"
    ["#2196f3"]="$GREY_GREEN_MID"
    ["#2563eb"]="$GREY_GREEN_MID"
    ["#3b82f6"]="$GREY_GREEN_MID"
    ["#42a5f5"]="$GREY_GREEN_LIGHT"
    ["#4285f4"]="$GREY_GREEN_MID"
    ["#4dabf7"]="$GREY_GREEN_LIGHT"
    ["#5294e2"]="$GREY_GREEN_MID"
    ["#64b5f6"]="$GREY_GREEN_LIGHT"
    ["#90caf9"]="$GREY_GREEN_LIGHT"
    ["#add8e6"]="$BEIGE_LIGHT"      # lightblue
    ["#b3e5fc"]="$BEIGE_LIGHT"
    ["#bbdefb"]="$BEIGE_LIGHT"
    ["#e3f2fd"]="$BEIGE_LIGHT"
    
    # Cyans
    ["#00bcd4"]="$GREY_GREEN_LIGHT"
    ["#00acc1"]="$GREY_GREEN_MID"
    ["#0097a7"]="$GREY_GREEN_MID"
    ["#00838f"]="$GREY_GREEN_DARK"
    ["#006064"]="$GREY_GREEN_DARK"
    ["#26c6da"]="$GREY_GREEN_LIGHT"
    ["#4dd0e1"]="$GREY_GREEN_LIGHT"
    ["#80deea"]="$BEIGE_LIGHT"
    ["#b2ebf2"]="$BEIGE_LIGHT"
    ["#e0f7fa"]="$BEIGE_LIGHT"
    
    # Purples/Violets
    ["#4a148c"]="$STALKER_RED_DARK"
    ["#6a1b9a"]="$STALKER_RED_DARK"
    ["#7b1fa2"]="$STALKER_RED_MID"
    ["#8e24aa"]="$STALKER_RED_MID"
    ["#9c27b0"]="$STALKER_RED_MID"
    ["#ab47bc"]="$STALKER_RED_LIGHT"
    ["#ba68c8"]="$STALKER_RED_LIGHT"
    ["#ce93d8"]="$BEIGE_MID"
    ["#e1bee7"]="$BEIGE_LIGHT"
    ["#f3e5f5"]="$BEIGE_LIGHT"
    
    # Magentas/Pinks (keep some as reds)
    ["#c2185b"]="$STALKER_RED_DARK"
    ["#d81b60"]="$STALKER_RED_MID"
    ["#e91e63"]="$STALKER_RED_MID"
    ["#ec407a"]="$STALKER_RED_LIGHT"
    ["#f06292"]="$STALKER_RED_LIGHT"
    ["#f48fb1"]="$BEIGE_MID"
    ["#f8bbd0"]="$BEIGE_LIGHT"
    ["#fce4ec"]="$BEIGE_LIGHT"
    
    # Bright yellows to beige
    ["#ffeb3b"]="$BEIGE_LIGHT"
    ["#ffee58"]="$BEIGE_LIGHT"
    ["#fff59d"]="$BEIGE_LIGHT"
    ["#fff9c4"]="$BEIGE_LIGHT"
    ["#fffde7"]="$BEIGE_LIGHT"
    ["#ffd700"]="$BEIGE_MID"        # gold
    ["#ffa500"]="$BEIGE_MID"        # orange
    ["#ff8c00"]="$BEIGE_MID"        # darkorange
    
    # Teals
    ["#009688"]="$GREY_GREEN_MID"
    ["#00897b"]="$GREY_GREEN_MID"
    ["#00796b"]="$GREY_GREEN_DARK"
    ["#00695c"]="$GREY_GREEN_DARK"
    ["#004d40"]="$GREY_GREEN_DARK"
    ["#26a69a"]="$GREY_GREEN_LIGHT"
    ["#4db6ac"]="$GREY_GREEN_LIGHT"
    ["#80cbc4"]="$BEIGE_LIGHT"
    ["#b2dfdb"]="$BEIGE_LIGHT"
    ["#e0f2f1"]="$BEIGE_LIGHT"
)

echo "  Processing ${#COLOR_MAP[@]} color replacements..."

total_changes=0
for original_color in "${!COLOR_MAP[@]}"; do
    replacement_color="${COLOR_MAP[$original_color]}"
    
    # Case-insensitive search and replace in all SVG files
    changes=$(find "$ICON_DIR" -name "*.svg" -type f -exec grep -l -i "$original_color" {} \; 2>/dev/null | wc -l)
    
    if [ "$changes" -gt 0 ]; then
        find "$ICON_DIR" -name "*.svg" -type f -exec sed -i "s/$original_color/$replacement_color/gI" {} \; 2>/dev/null
        total_changes=$((total_changes + changes))
    fi
done

echo "  ✓ Muted $total_changes icon files"

echo ""
echo "[2/4] Updating GTK theme to remove bright colors..."

GTK_CSS="$HOME/.themes/STALKER-Theme/gtk-3.0/gtk.css"

if [ -f "$GTK_CSS" ]; then
    # Make selections and highlights less vibrant
    cat >> "$GTK_CSS" << 'EOF'

/* Aggressive color muting - only greens, reds, beiges */
* {
    /* Remove any remaining blue highlights */
    -gtk-secondary-caret-color: #7f9080;
}

selection,
*:selected {
    background-color: #6a7a6d;
    color: #c9c5b4;
}

/* Mute any bright accent colors */
.accent {
    background-color: #7a8a7d;
    color: #3a4d3e;
}

/* Links should be green not blue */
link,
*:link {
    color: #5f7060;
}

link:hover,
*:link:hover {
    color: #7a8a7d;
}

link:visited,
*:link:visited {
    color: #6a7a6d;
}

/* Progress bars and sliders - green only */
progressbar progress,
levelbar block.filled {
    background-color: #7a8a7d;
}

scale highlight {
    background-color: #7a8a7d;
}

/* Switch widgets - green/red only */
switch:checked {
    background-color: #5f7060;
}

switch slider {
    background-color: #c9c5b4;
}

/* Scrollbars - grey-green */
scrollbar slider {
    background-color: #9ca69a;
}

scrollbar slider:hover {
    background-color: #7f9080;
}

/* Checkboxes and radio buttons */
checkbutton:checked,
radiobutton:checked {
    background-color: #7a8a7d;
    border-color: #5f7060;
}

/* Remove any colorful borders */
entry:focus,
button:focus {
    border-color: #7a8a7d;
    outline-color: #7a8a7d;
}
EOF
    echo "  ✓ GTK theme updated with aggressive color muting"
else
    echo "  ⚠ GTK theme not found, skipping"
fi

echo ""
echo "[3/4] Updating GTK-4.0 theme..."

GTK4_CSS="$HOME/.themes/STALKER-Theme/gtk-4.0/gtk.css"

if [ -f "$GTK4_CSS" ]; then
    cat >> "$GTK4_CSS" << 'EOF'

/* Aggressive color muting for GTK4 */
* {
    accent-color: #7a8a7d;
}

selection {
    background-color: #6a7a6d;
    color: #c9c5b4;
}

link {
    color: #5f7060;
}

link:hover {
    color: #7a8a7d;
}

progressbar > trough > progress {
    background-color: #7a8a7d;
}

switch:checked {
    background-color: #5f7060;
}

checkbutton:checked {
    background-color: #7a8a7d;
}

entry:focus-within {
    border-color: #7a8a7d;
    outline-color: #7a8a7d;
}
EOF
    echo "  ✓ GTK-4.0 theme updated"
else
    echo "  ⚠ GTK-4.0 theme not found, skipping"
fi

echo ""
echo "[4/4] Applying to system (for lock screen)..."

# Update system themes
sudo cp -r ~/.themes/STALKER-Theme/* /usr/share/themes/STALKER-Theme/ 2>/dev/null && echo "  ✓ GTK theme updated in system" ||  Skipped system GTK update"echo "  
sudo cp -r ~/.local/share/icons/Papirus-Stalker/* /usr/share/icons/Papirus-Stalker/ 2>/dev/null && echo "  ✓ Icons updated in system" || echo "  ⚠ Skipped system icons update"

# Update icon cache
gtk-update-icon-cache "$ICON_DIR" 2>/dev/null
sudo gtk-update-icon-cache /usr/share/icons/Papirus-Stalker 2>/dev/null

echo ""
echo "============================================================"
echo "  ✓ AGGRESSIVE COLOR MUTING COMPLETE!"
echo "============================================================"
echo ""
echo "Colors now visible:"
echo "  ✓ Greens: #3a4d3e → #7a8a7d → #9ca69a"
 #b87a7a"
echo "  ✓ Beiges: #a39e8f → #c9c5b4"
echo "  ✓ Grey-greens: #6a7a6d → #7f9080"
echo ""
echo "Colors removed/muted:"
echo "  ✗ All blues → grey-green"
echo "  ✗ All cyans → grey-green/beige"
echo "  ✗ All purples → reds"
echo "  ✗ All magentas → reds/beige"
echo "  ✗ Bright yellows → beige"
echo "  ✗ Bright oranges → beige"
echo ""
echo "Changes applied to:"
echo "  • User session (active immediately)"
echo "  • System themes (for lock screen)"
echo ""
echo "Restart applications to see full effect."
echo ""
