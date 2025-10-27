#!/bin/bash

# STALKER Hexagonal Cursor Theme Creator
# Creates industrial-themed cursors based on hexagonal nut design

echo "========================================================="
echo "  STALKER HEXAGONAL CURSOR THEME CREATOR"
echo "  Industrial mechanical cursor design"
echo "========================================================="
echo ""

# Install required packages
echo "[1/7] Installing cursor creation tools..."
sudo apt install -y inkscape imagemagick xcursorgen

# Create cursor directory
CURSOR_NAME="Stalker-Hex"
CURSOR_DIR="$HOME/.icons/$CURSOR_NAME/cursors"
SOURCE_DIR="/tmp/stalker-cursor-source"

mkdir -p "$CURSOR_DIR"
mkdir -p "$SOURCE_DIR"

echo ""
echo "[2/7] Creating hexagonal cursor designs with Python..."

# Create Python script to generate hexagonal cursors
cat > "$SOURCE_DIR/generate_cursors.py" << 'EOFPYTHON'
#!/usr/bin/env python3
import os
from PIL import Image, ImageDraw, ImageFont
import math

# STALKER colors
STALKER_PRIMARY = (95, 112, 96)      # #5f7060
STALKER_ACCENT = (122, 138, 125)     # #7a8a7d
STALKER_DARK = (58, 77, 62)          # #3a4d3e
STALKER_LIGHT = (201, 197, 180)      # #c9c5b4
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)

def draw_hexagon(draw, center_x, center_y, size, outline_color, fill_color, outline_width=3):
    """Draw a hexagon shape"""
    angles = [i * 60 for i in range(6)]
    points = []
    for angle in angles:
        rad = math.radians(angle)
        x = center_x + size * math.cos(rad)
        y = center_y + size * math.sin(rad)
        points.append((x, y))
    
    draw.polygon(points, fill=fill_color, outline=outline_color, width=outline_width)

def draw_inner_circle(draw, center_x, center_y, radius, outline_color, fill_color, outline_width=2):
    """Draw inner circle (the hole in the nut)"""
    bbox = [
        center_x - radius,
        center_y - radius,
        center_x + radius,
        center_y + radius
    ]
    draw.ellipse(bbox, fill=fill_color, outline=outline_color, width=outline_width)

def create_default_cursor(size=32):
    """Create default pointer cursor"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    # Draw hexagonal cursor
    center_x, center_y = size // 2, size // 2
    hex_size = size // 3
    
    # Shadow
    draw_hexagon(draw, center_x + 1, center_y + 1, hex_size, BLACK, BLACK + (100,), 2)
    
    # Main hexagon
    draw_hexagon(draw, center_x, center_y, hex_size, STALKER_DARK, STALKER_PRIMARY, 3)
    
    # Inner circle
    circle_radius = hex_size // 3
    draw_inner_circle(draw, center_x, center_y, circle_radius, STALKER_DARK, WHITE + (255,), 2)
    
    # Add small details (bolts)
    bolt_radius = 2
    bolt_distance = hex_size * 0.7
    for i in range(6):
        angle = math.radians(i * 60)
        bx = center_x + bolt_distance * math.cos(angle)
        by = center_y + bolt_distance * math.sin(angle)
        draw.ellipse([bx-bolt_radius, by-bolt_radius, bx+bolt_radius, by+bolt_radius], 
                    fill=STALKER_DARK)
    
    return img

def create_pointer_cursor(size=32, rotation=0):
    """Create arrow pointer with hexagon base"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    # Hexagon at the pointer position
    hex_x, hex_y = 10, 10
    hex_size = 8
    
    draw_hexagon(draw, hex_x, hex_y, hex_size, STALKER_DARK, STALKER_PRIMARY, 2)
    draw_inner_circle(draw, hex_x, hex_y, hex_size // 3, STALKER_DARK, WHITE, 1)
    
    # Arrow extending from hexagon
    arrow_points = [
        (hex_x + hex_size, hex_y),
        (hex_x + size - 8, hex_y - 8),
        (hex_x + size - 8, hex_y + 8)
    ]
    draw.polygon(arrow_points, fill=STALKER_ACCENT, outline=STALKER_DARK, width=2)
    
    return img

def create_hand_cursor(size=32):
    """Create hand/pointer cursor"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    hex_size = size // 3
    
    # Hexagon
    draw_hexagon(draw, center_x, center_y, hex_size, STALKER_ACCENT, STALKER_PRIMARY, 3)
    draw_inner_circle(draw, center_x, center_y, hex_size // 3, STALKER_DARK, STALKER_LIGHT, 2)
    
    # Add pointing indicator
    points = [
        (center_x + hex_size, center_y - 3),
        (center_x + hex_size + 8, center_y),
        (center_x + hex_size, center_y + 3)
    ]
    draw.polygon(points, fill=STALKER_ACCENT)
    
    return img

def create_loading_cursor(size=32, frame=0, total_frames=8):
    """Create animated loading cursor"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    hex_size = size // 3
    
    # Rotating hexagon
    rotation = (frame / total_frames) * 60  # Rotate through one hex side
    
    # Main hexagon
    draw_hexagon(draw, center_x, center_y, hex_size, STALKER_DARK, STALKER_PRIMARY, 3)
    draw_inner_circle(draw, center_x, center_y, hex_size // 3, STALKER_DARK, WHITE, 2)
    
    # Rotating indicator
    angle = math.radians(rotation + frame * 45)
    indicator_distance = hex_size * 0.8
    ind_x = center_x + indicator_distance * math.cos(angle)
    ind_y = center_y + indicator_distance * math.sin(angle)
    
    draw.ellipse([ind_x-3, ind_y-3, ind_x+3, ind_y+3], fill=STALKER_ACCENT)
    
    return img

def create_text_cursor(size=32):
    """Create text/IBeam cursor"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x = size // 2
    
    # I-beam shape with hexagonal ends
    hex_size = 6
    
    # Top hexagon
    draw_hexagon(draw, center_x, hex_size + 2, hex_size, STALKER_DARK, STALKER_PRIMARY, 2)
    
    # Vertical line
    draw.line([(center_x, hex_size + 2), (center_x, size - hex_size - 2)], 
              fill=STALKER_PRIMARY, width=2)
    
    # Bottom hexagon
    draw_hexagon(draw, center_x, size - hex_size - 2, hex_size, STALKER_DARK, STALKER_PRIMARY, 2)
    
    return img

def create_crosshair(size=32):
    """Create crosshair cursor"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    
    # Central hexagon
    hex_size = 6
    draw_hexagon(draw, center_x, center_y, hex_size, STALKER_DARK, STALKER_PRIMARY, 2)
    draw_inner_circle(draw, center_x, center_y, 2, STALKER_DARK, (0, 0, 0, 0), 1)
    
    # Crosshair lines
    line_length = size // 2 - 10
    draw.line([(center_x, center_y - line_length), (center_x, center_y - hex_size - 2)], 
              fill=STALKER_ACCENT, width=2)
    draw.line([(center_x, center_y + hex_size + 2), (center_x, center_y + line_length)], 
              fill=STALKER_ACCENT, width=2)
    draw.line([(center_x - line_length, center_y), (center_x - hex_size - 2, center_y)], 
              fill=STALKER_ACCENT, width=2)
    draw.line([(center_x + hex_size + 2, center_y), (center_x + line_length, center_y)], 
              fill=STALKER_ACCENT, width=2)
    
    return img

def create_resize_cursor(size=32, direction='nw-se'):
    """Create resize cursor"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    hex_size = 8
    
    # Central hexagon
    draw_hexagon(draw, center_x, center_y, hex_size, STALKER_DARK, STALKER_PRIMARY, 2)
    
    # Directional arrows based on direction
    if direction == 'nw-se':
        # Top-left arrow
        draw.polygon([(5, 5), (15, 5), (5, 15)], fill=STALKER_ACCENT)
        # Bottom-right arrow
        draw.polygon([(size-5, size-5), (size-15, size-5), (size-5, size-15)], fill=STALKER_ACCENT)
    elif direction == 'ne-sw':
        # Top-right arrow
        draw.polygon([(size-5, 5), (size-15, 5), (size-5, 15)], fill=STALKER_ACCENT)
        # Bottom-left arrow
        draw.polygon([(5, size-5), (15, size-5), (5, size-15)], fill=STALKER_ACCENT)
    elif direction == 'horizontal':
        # Left arrow
        draw.polygon([(5, center_y), (15, center_y-5), (15, center_y+5)], fill=STALKER_ACCENT)
        # Right arrow
        draw.polygon([(size-5, center_y), (size-15, center_y-5), (size-15, center_y+5)], fill=STALKER_ACCENT)
    elif direction == 'vertical':
        # Top arrow
        draw.polygon([(center_x, 5), (center_x-5, 15), (center_x+5, 15)], fill=STALKER_ACCENT)
        # Bottom arrow
        draw.polygon([(center_x, size-5), (center_x-5, size-15), (center_x+5, size-15)], fill=STALKER_ACCENT)
    
    return img

def create_move_cursor(size=32):
    """Create move/grab cursor"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    hex_size = 10
    
    # Large hexagon
    draw_hexagon(draw, center_x, center_y, hex_size, STALKER_DARK, STALKER_PRIMARY, 3)
    draw_inner_circle(draw, center_x, center_y, hex_size // 3, STALKER_DARK, WHITE, 2)
    
    # Four directional arrows
    arrow_size = 6
    arrow_distance = hex_size + 8
    
    # Up
    draw.polygon([
        (center_x, center_y - arrow_distance),
        (center_x - arrow_size//2, center_y - arrow_distance + arrow_size),
        (center_x + arrow_size//2, center_y - arrow_distance + arrow_size)
    ], fill=STALKER_ACCENT)
    
    # Down
    draw.polygon([
        (center_x, center_y + arrow_distance),
        (center_x - arrow_size//2, center_y + arrow_distance - arrow_size),
        (center_x + arrow_size//2, center_y + arrow_distance - arrow_size)
    ], fill=STALKER_ACCENT)
    
    # Left
    draw.polygon([
        (center_x - arrow_distance, center_y),
        (center_x - arrow_distance + arrow_size, center_y - arrow_size//2),
        (center_x - arrow_distance + arrow_size, center_y + arrow_size//2)
    ], fill=STALKER_ACCENT)
    
    # Right
    draw.polygon([
        (center_x + arrow_distance, center_y),
        (center_x + arrow_distance - arrow_size, center_y - arrow_size//2),
        (center_x + arrow_distance - arrow_size, center_y + arrow_size//2)
    ], fill=STALKER_ACCENT)
    
    return img

def save_cursor_images(output_dir):
    """Generate and save all cursor images"""
    os.makedirs(output_dir, exist_ok=True)
    
    print("Generating cursor images...")
    
    # Default cursor
    img = create_default_cursor(32)
    img.save(f"{output_dir}/default.png")
    
    # Pointer
    img = create_pointer_cursor(32)
    img.save(f"{output_dir}/pointer.png")
    
    # Hand
    img = create_hand_cursor(32)
    img.save(f"{output_dir}/hand.png")
    
    # Text/IBeam
    img = create_text_cursor(32)
    img.save(f"{output_dir}/text.png")
    
    # Crosshair
    img = create_crosshair(32)
    img.save(f"{output_dir}/crosshair.png")
    
    # Resize cursors
    for direction in ['nw-se', 'ne-sw', 'horizontal', 'vertical']:
        img = create_resize_cursor(32, direction)
        img.save(f"{output_dir}/resize-{direction}.png")
    
    # Move cursor
    img = create_move_cursor(32)
    img.save(f"{output_dir}/move.png")
    
    # Loading animation frames
    for frame in range(8):
        img = create_loading_cursor(32, frame, 8)
        img.save(f"{output_dir}/loading-{frame:02d}.png")
    
    print(f"✓ Generated cursor images in {output_dir}")

if __name__ == "__main__":
    output_dir = "/tmp/stalker-cursor-source"
    save_cursor_images(output_dir)
EOFPYTHON

chmod +x "$SOURCE_DIR/generate_cursors.py"

# Run Python script to generate cursor images
echo ""
echo "[3/7] Generating hexagonal cursor images..."
python3 "$SOURCE_DIR/generate_cursors.py"

echo ""
echo "[4/7] Converting PNG to X11 cursor format..."

# Create cursor config files
cat > "$SOURCE_DIR/default.cursor" << EOF
32 16 16 default.png
EOF

cat > "$SOURCE_DIR/pointer.cursor" << EOF
32 4 4 pointer.png
EOF

cat > "$SOURCE_DIR/hand.cursor" << EOF
32 16 16 hand.png
EOF

cat > "$SOURCE_DIR/text.cursor" << EOF
32 16 16 text.png
EOF

cat > "$SOURCE_DIR/crosshair.cursor" << EOF
32 16 16 crosshair.png
EOF

cat > "$SOURCE_DIR/move.cursor" << EOF
32 16 16 move.png
EOF

# Resize cursors
for direction in nw-se ne-sw horizontal vertical; do
    cat > "$SOURCE_DIR/resize-${direction}.cursor" << EOF
32 16 16 resize-${direction}.png
EOF
done

# Loading animation
cat > "$SOURCE_DIR/loading.cursor" << EOF
32 16 16 loading-00.png 50
32 16 16 loading-01.png 50
32 16 16 loading-02.png 50
32 16 16 loading-03.png 50
32 16 16 loading-04.png 50
32 16 16 loading-05.png 50
32 16 16 loading-06.png 50
32 16 16 loading-07.png 50
EOF

# Convert to X11 cursor format
cd "$SOURCE_DIR"

xcursorgen default.cursor "$CURSOR_DIR/default"
xcursorgen pointer.cursor "$CURSOR_DIR/left_ptr"
xcursorgen hand.cursor "$CURSOR_DIR/hand2"
xcursorgen text.cursor "$CURSOR_DIR/xterm"
xcursorgen crosshair.cursor "$CURSOR_DIR/crosshair"
xcursorgen move.cursor "$CURSOR_DIR/fleur"
xcursorgen resize-nw-se.cursor "$CURSOR_DIR/size_fdiag"
xcursorgen resize-ne-sw.cursor "$CURSOR_DIR/size_bdiag"
xcursorgen resize-horizontal.cursor "$CURSOR_DIR/size_hor"
xcursorgen resize-vertical.cursor "$CURSOR_DIR/size_ver"
xcursorgen loading.cursor "$CURSOR_DIR/watch"

echo ""
echo "[5/7] Creating cursor theme aliases..."

# Create symbolic links for various cursor names
cd "$CURSOR_DIR"
ln -sf left_ptr arrow
ln -sf left_ptr top_left_arrow
ln -sf hand2 hand
ln -sf hand2 hand1
ln -sf hand2 pointer
ln -sf xterm ibeam
ln -sf xterm text
ln -sf watch left_ptr_watch
ln -sf watch progress
ln -sf fleur all-scroll
ln -sf fleur move
ln -sf size_fdiag nwse-resize
ln -sf size_bdiag nesw-resize
ln -sf size_hor ew-resize
ln -sf size_hor h_double_arrow
ln -sf size_ver ns-resize
ln -sf size_ver v_double_arrow

echo ""
echo "[6/7] Creating cursor theme index..."

cat > "$HOME/.icons/$CURSOR_NAME/index.theme" << EOF
[Icon Theme]
Name=Stalker-Hex
Comment=Industrial hexagonal cursor theme inspired by STALKER
Example=default
EOF

echo ""
echo "[7/7] Creating installation helper script..."

cat > "$HOME/.icons/$CURSOR_NAME/install.sh" << 'EOFINSTALL'
#!/bin/bash
# Apply Stalker-Hex cursor theme

gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex'
gsettings set org.gnome.desktop.interface cursor-size 32

echo "Stalker-Hex cursor theme applied!"
echo "You may need to log out and back in for full effect."
EOFINSTALL

chmod +x "$HOME/.icons/$CURSOR_NAME/install.sh"

echo ""
echo "========================================================="
echo "  STALKER HEXAGONAL CURSOR THEME CREATED!"
echo "========================================================="
echo ""
echo "Theme Name: $CURSOR_NAME"
echo "Location: $HOME/.icons/$CURSOR_NAME/"
echo ""
echo "Cursor types created:"
echo "  ✓ Default pointer (hexagonal)"
echo "  ✓ Arrow pointer"
echo "  ✓ Hand/link pointer"
echo "  ✓ Text/IBeam cursor"
echo "  ✓ Crosshair"
echo "  ✓ Move/grab cursor (4-way)"
echo "  ✓ Resize cursors (4 directions)"
echo "  ✓ Loading animation (8 frames, rotating)"
echo ""
echo "To apply the cursor theme:"
echo "  gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex'"
echo ""
echo "Or run the helper script:"
echo "  $HOME/.icons/$CURSOR_NAME/install.sh"
echo ""
echo "To preview cursors, use: gnome-tweaks (Appearance → Cursor)"
echo ""
