#!/bin/bash

# Fast Aggressive Color Muting for STALKER Theme
# Only keeps greens, reds, and beiges

echo "============================================================"
echo "  STALKER FAST COLOR MUTING"
echo "  Keeping only: Greens, Reds, Beiges"
echo "============================================================"
echo ""

ICON_DIR="$HOME/.local/share/icons/Papirus-Stalker"

if [ ! -d "$ICON_DIR" ]; then
    echo "❌ Papirus-Stalker icon theme not found!"
    exit 1
fi

echo "[1/3] Muting all blues, cyans, purples to grey-greens..."
echo "  (This processes 8000+ files - takes ~2 minutes)"

# Use single sed command with multiple replacements - MUCH faster
find "$ICON_DIR" -name "*.svg" -type f -print0 | xargs -0 sed -i \
    -e 's/#000080/#6a7a6d/gI' \
    -e 's/#0000cd/#6a7a6d/gI' \
    -e 's/#0000ff/#7f9080/gI' \
    -e 's/#1e3a8a/#6a7a6d/gI' \
    -e 's/#1e40af/#6a7a6d/gI' \
    -e 's/#1e88e5/#7f9080/gI' \
    -e 's/#2196f3/#7f9080/gI' \
    -e 's/#2563eb/#7f9080/gI' \
    -e 's/#3b82f6/#7f9080/gI' \
    -e 's/#42a5f5/#9ca69a/gI' \
    -e 's/#4285f4/#7f9080/gI' \
    -e 's/#4dabf7/#9ca69a/gI' \
    -e 's/#5294e2/#7f9080/gI' \
    -e 's/#64b5f6/#9ca69a/gI' \
    -e 's/#90caf9/#9ca69a/gI' \
    -e 's/#add8e6/#c9c5b4/gI' \
    -e 's/#b3e5fc/#c9c5b4/gI' \
    -e 's/#bbdefb/#c9c5b4/gI' \
    -e 's/#e3f2fd/#c9c5b4/gI' \
    -e 's/#00bcd4/#9ca69a/gI' \
    -e 's/#00acc1/#7f9080/gI' \
    -e 's/#0097a7/#7f9080/gI' \
    -e 's/#00838f/#6a7a6d/gI' \
    -e 's/#006064/#6a7a6d/gI' \
    -e 's/#26c6da/#9ca69a/gI' \
    -e 's/#4dd0e1/#9ca69a/gI' \
    -e 's/#80deea/#c9c5b4/gI' \
    -e 's/#b2ebf2/#c9c5b4/gI' \
    -e 's/#e0f7fa/#c9c5b4/gI' \
    -e 's/#4a148c/#6d4545/gI' \
    -e 's/#6a1b9a/#6d4545/gI' \
    -e 's/#7b1fa2/#8b5a5a/gI' \
    -e 's/#8e24aa/#8b5a5a/gI' \
    -e 's/#9c27b0/#8b5a5a/gI' \
    -e 's/#ab47bc/#b87a7a/gI' \
    -e 's/#ba68c8/#b87a7a/gI' \
    -e 's/#ce93d8/#a39e8f/gI' \
    -e 's/#e1bee7/#c9c5b4/gI' \
    -e 's/#f3e5f5/#c9c5b4/gI' \
    -e 's/#c2185b/#6d4545/gI' \
    -e 's/#d81b60/#8b5a5a/gI' \
    -e 's/#e91e63/#8b5a5a/gI' \
    -e 's/#ec407a/#b87a7a/gI' \
    -e 's/#f06292/#b87a7a/gI' \
    -e 's/#f48fb1/#a39e8f/gI' \
    -e 's/#f8bbd0/#c9c5b4/gI' \
    -e 's/#fce4ec/#c9c5b4/gI' \
    -e 's/#ffeb3b/#c9c5b4/gI' \
    -e 's/#ffee58/#c9c5b4/gI' \
    -e 's/#fff59d/#c9c5b4/gI' \
    -e 's/#fff9c4/#c9c5b4/gI' \
    -e 's/#fffde7/#c9c5b4/gI' \
    -e 's/#ffd700/#a39e8f/gI' \
    -e 's/#ffa500/#a39e8f/gI' \
    -e 's/#ff8c00/#a39e8f/gI' \
    -e 's/#009688/#7f9080/gI' \
    -e 's/#00897b/#7f9080/gI' \
    -e 's/#00796b/#6a7a6d/gI' \
    -e 's/#00695c/#6a7a6d/gI' \
    -e 's/#004d40/#6a7a6d/gI' \
    -e 's/#26a69a/#9ca69a/gI' \
    -e 's/#4db6ac/#9ca69a/gI' \
    -e 's/#80cbc4/#c9c5b4/gI' \
    -e 's/#b2dfdb/#c9c5b4/gI' \
    -e 's/#e0f2f1/#c9c5b4/gI'

echo "  ✓ Icons processed"

echo ""
echo "[2/3] Updating GTK themes..."

# GTK 3.0
cat >> "$HOME/.themes/STALKER-Theme/gtk-3.0/gtk.css" << 'EOF'

/* Aggressive color muting */
selection, *:selected { background-color: #6a7a6d; color: #c9c5b4; }
link, *:link { color: #5f7060; }
link:hover { color: #7a8a7d; }
progressbar progress { background-color: #7a8a7d; }
scale highlight { background-color: #7a8a7d; }
switch:checked { background-color: #5f7060; }
scrollbar slider { background-color: #9ca69a; }
checkbutton:checked { background-color: #7a8a7d; }
entry:focus, button:focus { border-color: #7a8a7d; }
EOF

# GTK 4.0
cat >> "$HOME/.themes/STALKER-Theme/gtk-4.0/gtk.css" << 'EOF'

/* Aggressive color muting */
* { accent-color: #7a8a7d; }
selection { background-color: #6a7a6d; color: #c9c5b4; }
link { color: #5f7060; }
progressbar > trough > progress { background-color: #7a8a7d; }
switch:checked { background-color: #5f7060; }
EOF

echo "  ✓ GTK themes updated"

echo ""
echo "[3/3] Applying to system (lock screen)..."

sudo cp -r ~/.themes/STALKER-Theme/* /usr/share/themes/STALKER-Theme/ 2>/dev/null && echo "  ✓ GTK system theme updated"
sudo cp -r ~/.local/share/icons/Papirus-Stalker/* /usr/share/icons/Papirus-Stalker/ 2>/dev/null && echo "  ✓ Icons system theme updated"

gtk-update-icon-cache "$ICON_DIR" 2>/dev/null
sudo gtk-update-icon-cache /usr/share/icons/Papirus-Stalker 2>/dev/null

echo ""
echo "============================================================"
echo "  ✓ AGGRESSIVE COLOR MUTING COMPLETE!"
echo "============================================================"
echo ""
echo "✓ All blues → grey-greens"
echo "✓ All purples → reds"
echo "✓ All cyans/teals → grey-greens"
echo "✓ Bright colors → beiges"
echo ""
echo "Only greens, reds, and beiges remain!"
echo ""
