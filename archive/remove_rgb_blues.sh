#!/bin/bash

# RGB Color Converter - Removes blue even from RGB() values
# This catches blues that are defined as rgb(R,G,B) instead of hex

echo "========================================================="
echo "  RGB BLUE REMOVER"
echo "  Converts rgb() color values to STALKER green"
echo "========================================================="
echo ""

ICON_THEME="Papirus-Stalker"
ICON_DIR="$HOME/.local/share/icons/$ICON_THEME"

if [ ! -d "$ICON_DIR" ]; then
    echo "Error: $ICON_DIR not found!"
    exit 1
fi

echo "Processing RGB color values in SVG files..."
echo ""

# Common RGB blue values and their STALKER replacements
declare -A RGB_BLUES=(
    # RGB equivalents of common blues
    ["rgb(82,148,226)"]="rgb(95,112,96)"      # #5294e2 → STALKER primary
    ["rgb(66,133,244)"]="rgb(95,112,96)"      # #4285f4 → STALKER primary
    ["rgb(72,119,177)"]="rgb(58,77,62)"       # #4877b1 → STALKER dark
    ["rgb(33,150,243)"]="rgb(95,112,96)"      # #2196f3 → STALKER primary
    ["rgb(66,165,245)"]="rgb(122,138,125)"    # #42a5f5 → STALKER accent
    ["rgb(0,188,212)"]="rgb(122,138,125)"     # #00bcd4 → STALKER accent
    ["rgb(3,169,244)"]="rgb(95,112,96)"       # #03a9f4 → STALKER primary
    ["rgb(25,118,210)"]="rgb(58,77,62)"       # #1976d2 → STALKER dark
    
    # With spaces
    ["rgb(82, 148, 226)"]="rgb(95, 112, 96)"
    ["rgb(66, 133, 244)"]="rgb(95, 112, 96)"
    ["rgb(72, 119, 177)"]="rgb(58, 77, 62)"
    ["rgb(33, 150, 243)"]="rgb(95, 112, 96)"
    ["rgb(66, 165, 245)"]="rgb(122, 138, 125)"
    ["rgb(0, 188, 212)"]="rgb(122, 138, 125)"
    
    # RGBA with various opacities
    ["rgba(82,148,226"]="rgba(95,112,96"
    ["rgba(66,133,244"]="rgba(95,112,96"
    ["rgba(72,119,177"]="rgba(58,77,62"
    ["rgba(82, 148, 226"]="rgba(95, 112, 96"
    ["rgba(66, 133, 244"]="rgba(95, 112, 96"
    ["rgba(72, 119, 177"]="rgba(58, 77, 62"
)

# Process all SVG files
echo "[1/3] Processing RGB values in all icons..."
COUNTER=0

find "$ICON_DIR" -name "*.svg" -type f | while read svg_file; do
    COUNTER=$((COUNTER + 1))
    
    if [ $((COUNTER % 200)) -eq 0 ]; then
        echo "  Processed $COUNTER files..."
    fi
    
    # Replace RGB values
    for old_rgb in "${!RGB_BLUES[@]}"; do
        new_rgb="${RGB_BLUES[$old_rgb]}"
        sed -i "s/${old_rgb}/${new_rgb}/g" "$svg_file" 2>/dev/null
    done
    
    # Also do a smart replacement for any remaining high-blue RGB values
    # This catches rgb(R, G, B) where B > G and B > R (blue is dominant)
    # We'll use Python for this more complex operation if available
done

echo "  ✓ RGB values processed!"
echo ""

# Use Python for intelligent blue detection if available
if command -v python3 &> /dev/null; then
    echo "[2/3] Running intelligent blue detection with Python..."
    
    python3 << 'PYEOF'
import re
import os
import glob

icon_dir = os.path.expanduser("~/.local/share/icons/Papirus-Stalker")

# STALKER colors
stalker_primary = (95, 112, 96)   # #5f7060
stalker_accent = (122, 138, 125)  # #7a8a7d
stalker_dark = (58, 77, 62)       # #3a4d3e

def is_blue_dominant(r, g, b):
    """Check if blue is the dominant color"""
    return b > g and b > r and b > 100

def replace_blue_rgb(content):
    """Replace blue RGB values with STALKER greens"""
    
    # Pattern for rgb() and rgba()
    rgb_pattern = r'rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*[\d.]+)?\)'
    
    def replacer(match):
        r, g, b = int(match.group(1)), int(match.group(2)), int(match.group(3))
        
        if is_blue_dominant(r, g, b):
            # Choose replacement based on brightness
            brightness = (r + g + b) / 3
            if brightness < 100:
                new_color = stalker_dark
            elif brightness > 150:
                new_color = stalker_accent
            else:
                new_color = stalker_primary
            
            # Check if it's rgba or rgb
            if 'rgba' in match.group(0):
                # Extract alpha
                alpha_match = re.search(r',\s*([\d.]+)\)$', match.group(0))
                if alpha_match:
                    alpha = alpha_match.group(1)
                    return f'rgba({new_color[0]}, {new_color[1]}, {new_color[2]}, {alpha})'
            
            return f'rgb({new_color[0]}, {new_color[1]}, {new_color[2]})'
        
        return match.group(0)
    
    return re.sub(rgb_pattern, replacer, content)

# Process all SVG files
svg_files = glob.glob(os.path.join(icon_dir, "**/*.svg"), recursive=True)
processed = 0

for svg_file in svg_files:
    try:
        with open(svg_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        new_content = replace_blue_rgb(content)
        
        if new_content != content:
            with open(svg_file, 'w', encoding='utf-8') as f:
                f.write(new_content)
            processed += 1
        
        if processed > 0 and processed % 50 == 0:
            print(f"  Modified {processed} files with blue RGB values...")
    except Exception as e:
        pass

print(f"  ✓ Intelligent blue detection complete! Modified {processed} files.")
PYEOF
else
    echo "  ⊘ Python3 not available, skipping intelligent detection"
fi
echo ""

# Update icon cache
echo "[3/3] Updating icon cache..."
gtk-update-icon-cache -f -t "$ICON_DIR" 2>/dev/null || true
echo "  ✓ Icon cache updated!"
echo ""

echo "========================================================="
echo "  RGB BLUE REMOVAL COMPLETE!"
echo "========================================================="
echo ""
echo "To reload icons:"
echo "  gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'"
echo "  sleep 1"
echo "  gsettings set org.gnome.desktop.interface icon-theme '$ICON_THEME'"
echo ""
