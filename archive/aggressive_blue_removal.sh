#!/bin/bash

# AGGRESSIVE STALKER ICON RECOLORER
# Removes ALL blue tones and replaces with STALKER green palette

echo "========================================================="
echo "  AGGRESSIVE BLUE → GREEN ICON RECOLORER"
echo "========================================================="
echo ""

# STALKER color palette
STALKER_PRIMARY="#5f7060"    # Main green
STALKER_ACCENT="#7a8a7d"     # Light green-gray
STALKER_DARK="#3a4d3e"       # Dark green
STALKER_PURPLE="#6b5f7b"     # Accent purple
STALKER_LIGHT="#c9c5b4"      # Beige

# Comprehensive list of blue colors to replace
declare -A BLUE_COLORS=(
    # Common blue shades
    ["#5294e2"]="$STALKER_PRIMARY"
    ["#4285f4"]="$STALKER_PRIMARY"
    ["#4877b1"]="$STALKER_DARK"
    ["#42a5f5"]="$STALKER_ACCENT"
    ["#3f51b5"]="$STALKER_PRIMARY"
    ["#2196f3"]="$STALKER_PRIMARY"
    ["#1976d2"]="$STALKER_DARK"
    ["#0d47a1"]="$STALKER_DARK"
    ["#64b5f6"]="$STALKER_ACCENT"
    ["#90caf9"]="$STALKER_ACCENT"
    ["#bbdefb"]="$STALKER_LIGHT"
    
    # Cyan/light blue shades
    ["#00bcd4"]="$STALKER_ACCENT"
    ["#00acc1"]="$STALKER_PRIMARY"
    ["#0097a7"]="$STALKER_DARK"
    ["#26c6da"]="$STALKER_ACCENT"
    ["#4dd0e1"]="$STALKER_ACCENT"
    ["#80deea"]="$STALKER_LIGHT"
    
    # Sky blue shades
    ["#03a9f4"]="$STALKER_PRIMARY"
    ["#039be5"]="$STALKER_PRIMARY"
    ["#0288d1"]="$STALKER_DARK"
    ["#29b6f6"]="$STALKER_ACCENT"
    ["#4fc3f7"]="$STALKER_ACCENT"
    
    # Dark blue shades
    ["#1565c0"]="$STALKER_DARK"
    ["#1e88e5"]="$STALKER_PRIMARY"
    ["#1976d2"]="$STALKER_DARK"
    ["#0d47a1"]="$STALKER_DARK"
    ["#283593"]="$STALKER_DARK"
    
    # Papirus specific blues
    ["#5c6bc0"]="$STALKER_PRIMARY"
    ["#7986cb"]="$STALKER_ACCENT"
    ["#3949ab"]="$STALKER_DARK"
    
    # Material design blues
    ["#448aff"]="$STALKER_PRIMARY"
    ["#2979ff"]="$STALKER_PRIMARY"
    ["#2962ff"]="$STALKER_DARK"
    
    # Other common blues
    ["#0000ff"]="$STALKER_PRIMARY"
    ["#0080ff"]="$STALKER_PRIMARY"
    ["#00ffff"]="$STALKER_ACCENT"
    ["#add8e6"]="$STALKER_LIGHT"
    ["#87ceeb"]="$STALKER_ACCENT"
    ["#4169e1"]="$STALKER_PRIMARY"
    ["#1e90ff"]="$STALKER_PRIMARY"
    ["#6495ed"]="$STALKER_ACCENT"
)

ICON_THEME="Papirus-Stalker"
ICON_DIR="$HOME/.local/share/icons/$ICON_THEME"

if [ ! -d "$ICON_DIR" ]; then
    echo "Error: $ICON_DIR not found!"
    echo "Please run ./create_stalker_icons.sh first"
    exit 1
fi

echo "Target directory: $ICON_DIR"
echo ""
echo "This will aggressively replace ALL blue colors with STALKER green."
echo "Processing may take a few minutes..."
echo ""

# Function to replace colors in SVG files
recolor_svg_aggressive() {
    local file=$1
    local temp_file="${file}.tmp"
    
    # Build sed command with all color replacements
    local sed_command="sed"
    
    for old_color in "${!BLUE_COLORS[@]}"; do
        new_color="${BLUE_COLORS[$old_color]}"
        # Add both lowercase and uppercase versions
        sed_command="$sed_command -e 's/${old_color}/${new_color}/gi'"
        sed_command="$sed_command -e 's/${old_color^^}/${new_color}/gi'"
    done
    
    sed_command="$sed_command '$file' > '$temp_file'"
    
    eval $sed_command
    
    if [ -f "$temp_file" ]; then
        mv "$temp_file" "$file"
    fi
}

# Count total files
echo "[1/5] Counting SVG files..."
TOTAL_FILES=$(find "$ICON_DIR" -name "*.svg" -type f | wc -l)
echo "Found $TOTAL_FILES SVG files to process"
echo ""

# Process all SVG files
echo "[2/5] Recoloring all SVG icons (this may take a while)..."
COUNTER=0

find "$ICON_DIR" -name "*.svg" -type f | while read svg_file; do
    COUNTER=$((COUNTER + 1))
    
    # Show progress every 100 files
    if [ $((COUNTER % 100)) -eq 0 ]; then
        echo "  Processed $COUNTER / $TOTAL_FILES files..."
    fi
    
    # Replace all blue colors with STALKER colors
    for old_color in "${!BLUE_COLORS[@]}"; do
        new_color="${BLUE_COLORS[$old_color]}"
        # Case-insensitive replacement
        sed -i "s/${old_color}/${new_color}/gI" "$svg_file" 2>/dev/null
        sed -i "s/${old_color^^}/${new_color}/g" "$svg_file" 2>/dev/null
    done
done

echo "  ✓ All SVG files processed!"
echo ""

# Also process symbolic links
echo "[3/5] Processing symbolic icons..."
if [ -d "$ICON_DIR/symbolic" ]; then
    find "$ICON_DIR/symbolic" -name "*.svg" -type f | while read svg_file; do
        for old_color in "${!BLUE_COLORS[@]}"; do
            new_color="${BLUE_COLORS[$old_color]}"
            sed -i "s/${old_color}/${new_color}/gI" "$svg_file" 2>/dev/null
        done
    done
    echo "  ✓ Symbolic icons processed!"
else
    echo "  ⊘ No symbolic icons directory found"
fi
echo ""

# Process places (folders, drives, etc.) more aggressively
echo "[4/5] Extra processing for folders and places..."
for size in 16x16 22x22 24x24 32x32 48x48 64x64; do
    if [ -d "$ICON_DIR/$size/places" ]; then
        find "$ICON_DIR/$size/places" -name "*.svg" -type f | while read svg_file; do
            # Additional replacements for folder-specific blues
            sed -i "s/#5294e2/$STALKER_PRIMARY/gI" "$svg_file"
            sed -i "s/#4285f4/$STALKER_PRIMARY/gI" "$svg_file"
            sed -i "s/#4877b1/$STALKER_DARK/gI" "$svg_file"
            sed -i "s/#42a5f5/$STALKER_ACCENT/gI" "$svg_file"
            sed -i "s/rgb(82,148,226)/rgb(95,112,96)/gI" "$svg_file"
            sed -i "s/rgb(66,133,244)/rgb(95,112,96)/gI" "$svg_file"
            sed -i "s/rgb(72,119,177)/rgb(58,77,62)/gI" "$svg_file"
        done
    fi
done
echo "  ✓ Folders and places recolored!"
echo ""

# Update icon cache
echo "[5/5] Updating icon cache..."
gtk-update-icon-cache -f -t "$ICON_DIR" 2>/dev/null || true
echo "  ✓ Icon cache updated!"
echo ""

echo "========================================================="
echo "  AGGRESSIVE RECOLORING COMPLETE!"
echo "========================================================="
echo ""
echo "Colors replaced:"
for old_color in "${!BLUE_COLORS[@]}"; do
    echo "  $old_color → ${BLUE_COLORS[$old_color]}"
done | head -10
echo "  ... and $(( ${#BLUE_COLORS[@]} - 10 )) more blue shades"
echo ""
echo "To apply the changes:"
echo "  1. Restart your session (log out and log back in)"
echo "  OR"
echo "  2. Press Alt+F2, type 'r' and press Enter (GNOME)"
echo "  OR"
echo "  3. Run: gsettings set org.gnome.desktop.interface icon-theme 'temp' && gsettings set org.gnome.desktop.interface icon-theme '$ICON_THEME'"
echo ""
echo "If you still see blue, run this script again - some icons"
echo "may use RGB values instead of hex codes."
echo ""
