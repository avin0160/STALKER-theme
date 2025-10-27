#!/bin/bash

# STALKER CURSOR THEME - Enhanced Adwaita Style
# 25% bigger, brighter grey outer ring, dark green inner circle
# Complete cursor set adapted to STALKER theme

echo "========================================================="
echo "  STALKER CURSOR THEME CREATOR"
echo "  Enhanced Size | Brighter Grey | STALKER Dark Green"
echo "========================================================="
echo ""

# Check dependencies
if ! command -v python3 &> /dev/null; then
    echo "Error: Python3 is required"
    exit 1
fi

if ! command -v xcursorgen &> /dev/null; then
    echo "Installing xcursorgen..."
    sudo apt install -y x11-apps
fi

# Create cursor directories
CURSOR_NAME="STALKER-Cursors"
CURSOR_DIR="$HOME/.icons/$CURSOR_NAME/cursors"
SOURCE_DIR="/tmp/stalker-cursor-build"

mkdir -p "$CURSOR_DIR"
mkdir -p "$SOURCE_DIR"

echo "[1/3] Generating cursor images with Python..."
echo ""

# Create Python script for cursor generation
cat > "$SOURCE_DIR/generate_stalker_cursors.py" << 'EOFPYTHON'
#!/usr/bin/env python3
import os
from PIL import Image, ImageDraw, ImageFilter
import math

# STALKER Color Palette
GREY_BRIGHT = (180, 180, 185)        # Brighter grey for outer ring (was 140,140,145)
GREY_MEDIUM = (140, 145, 140)        # Medium grey
GREY_DARK = (80, 85, 80)             # Dark grey for shadows
STALKER_DARK_GREEN = (58, 77, 62)    # #3a4d3e - inner circle
STALKER_GREEN = (95, 112, 96)        # #5f7060 - accents
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)

# Base size multiplier - 25% bigger
SIZE_MULTIPLIER=1.25
BASE_SIZE=$(echo "32 * $SIZE_MULTIPLIER" | bc | cut -d'.' -f1)  # 40 pixels

def add_shadow(draw, shape_func, offset=1, blur=2):
    """Add soft shadow to cursor"""
    pass  # Shadows are drawn before main shape

def draw_circle_cursor(size, inner_color=STALKER_DARK_GREEN, outer_color=GREY_BRIGHT, 
                       border_width=3, inner_size_ratio=0.4):
    """
    Create circular cursor with brighter grey outer ring and dark green inner circle
    """
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center = size // 2
    outer_radius = size // 3
    inner_radius = int(outer_radius * inner_size_ratio)
    
    # Shadow
    shadow_offset = 2
    draw.ellipse([center - outer_radius + shadow_offset, 
                  center - outer_radius + shadow_offset,
                  center + outer_radius + shadow_offset, 
                  center + outer_radius + shadow_offset],
                 fill=(0, 0, 0, 60))
    
    # Outer ring (brighter grey)
    draw.ellipse([center - outer_radius, center - outer_radius,
                  center + outer_radius, center + outer_radius],
                 fill=outer_color, outline=GREY_DARK, width=border_width)
    
    # Inner circle (STALKER dark green)
    draw.ellipse([center - inner_radius, center - inner_radius,
                  center + inner_radius, center + inner_radius],
                 fill=inner_color, outline=STALKER_GREEN, width=2)
    
    return img

def draw_pointer(size, angle=0):
    """Create arrow pointer cursor"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    # Arrow shape - classic pointer
    arrow_points = [
        (4, 4),           # Top point
        (4, size - 12),   # Bottom of shaft
        (10, size - 18),  # Bottom right
        (14, size - 4),   # Far bottom right
        (16, size - 6),   # Right tip
        (12, size - 20),  # Upper right
        (18, size - 20),  # Right point
        (4, 4)            # Back to start
    ]
    
    # Scale points
    scaled_points = [(int(x * SIZE_MULTIPLIER), int(y * SIZE_MULTIPLIER)) for x, y in arrow_points]
    
    # Shadow
    shadow_points = [(x + 2, y + 2) for x, y in scaled_points]
    draw.polygon(shadow_points, fill=(0, 0, 0, 80))
    
    # Outer border (brighter grey)
    draw.polygon(scaled_points, fill=GREY_BRIGHT, outline=GREY_DARK, width=2)
    
    # Inner accent (dark green stripe)
    inner_stripe = [
        scaled_points[0],
        (scaled_points[0][0] + 3, scaled_points[0][1] + 3),
        (scaled_points[1][0] + 3, scaled_points[1][1] - 8),
        scaled_points[1]
    ]
    draw.polygon(inner_stripe, fill=STALKER_DARK_GREEN)
    
    return img

def draw_hand(size):
    """Create hand/pointing finger cursor"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    # Simplified hand shape
    base_x, base_y = size // 4, size // 4
    
    # Palm
    palm_points = [
        (base_x, base_y + 10),
        (base_x + 8, base_y + 8),
        (base_x + 12, base_y + 12),
        (base_x + 10, base_y + 20),
        (base_x, base_y + 18)
    ]
    scaled_palm = [(int(x * SIZE_MULTIPLIER), int(y * SIZE_MULTIPLIER)) for x, y in palm_points]
    
    # Shadow
    shadow_palm = [(x + 2, y + 2) for x, y in scaled_palm]
    draw.polygon(shadow_palm, fill=(0, 0, 0, 60))
    
    # Draw palm
    draw.polygon(scaled_palm, fill=GREY_BRIGHT, outline=GREY_DARK, width=2)
    
    # Finger pointing up
    finger_points = [
        (base_x + 3, base_y),
        (base_x + 7, base_y),
        (base_x + 7, base_y + 12),
        (base_x + 3, base_y + 12)
    ]
    scaled_finger = [(int(x * SIZE_MULTIPLIER), int(y * SIZE_MULTIPLIER)) for x, y in finger_points]
    draw.polygon(scaled_finger, fill=GREY_BRIGHT, outline=GREY_DARK, width=2)
    
    # Add green accent on fingertip
    tip_center = scaled_finger[0]
    draw.ellipse([tip_center[0] - 2, tip_center[1] - 2,
                  tip_center[0] + 2, tip_center[1] + 2],
                 fill=STALKER_DARK_GREEN)
    
    return img

def draw_text_cursor(size):
    """Create I-beam text cursor"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x = size // 2
    top = size // 4
    bottom = size - size // 4
    
    bar_width = int(2 * SIZE_MULTIPLIER)
    cap_width = int(6 * SIZE_MULTIPLIER)
    
    # Shadow
    draw.line([(center_x + 1, top + 1), (center_x + 1, bottom + 1)], 
              fill=(0, 0, 0, 60), width=bar_width)
    
    # Vertical bar (brighter grey)
    draw.line([(center_x, top), (center_x, bottom)], 
              fill=GREY_BRIGHT, width=bar_width)
    
    # Top cap
    draw.line([(center_x - cap_width//2, top), (center_x + cap_width//2, top)],
              fill=GREY_BRIGHT, width=bar_width)
    
    # Bottom cap
    draw.line([(center_x - cap_width//2, bottom), (center_x + cap_width//2, bottom)],
              fill=GREY_BRIGHT, width=bar_width)
    
    # Green center accent
    draw.ellipse([center_x - 2, center_x - 2, center_x + 2, center_x + 2],
                 fill=STALKER_DARK_GREEN)
    
    return img

def draw_crosshair(size):
    """Create crosshair/precision cursor"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center = size // 2
    line_len = size // 3
    gap = size // 8
    
    # Shadow
    offset = 1
    draw.line([(center + offset, center - line_len + offset), 
               (center + offset, center - gap + offset)], 
              fill=(0, 0, 0, 60), width=2)
    draw.line([(center + offset, center + gap + offset), 
               (center + offset, center + line_len + offset)], 
              fill=(0, 0, 0, 60), width=2)
    draw.line([(center - line_len + offset, center + offset), 
               (center - gap + offset, center + offset)], 
              fill=(0, 0, 0, 60), width=2)
    draw.line([(center + gap + offset, center + offset), 
               (center + line_len + offset, center + offset)], 
              fill=(0, 0, 0, 60), width=2)
    
    # Vertical line (top)
    draw.line([(center, center - line_len), (center, center - gap)], 
              fill=GREY_BRIGHT, width=2)
    # Vertical line (bottom)
    draw.line([(center, center + gap), (center, center + line_len)], 
              fill=GREY_BRIGHT, width=2)
    # Horizontal line (left)
    draw.line([(center - line_len, center), (center - gap, center)], 
              fill=GREY_BRIGHT, width=2)
    # Horizontal line (right)
    draw.line([(center + gap, center), (center + line_len, center)], 
              fill=GREY_BRIGHT, width=2)
    
    # Center circle (dark green)
    circle_radius = gap - 2
    draw.ellipse([center - circle_radius, center - circle_radius,
                  center + circle_radius, center + circle_radius],
                 outline=STALKER_DARK_GREEN, width=2)
    
    return img

def draw_move_cursor(size):
    """Create move/grab cursor (four arrows)"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center = size // 2
    arrow_len = size // 4
    arrow_head = 4
    
    # Draw four arrows pointing out
    for angle in [0, 90, 180, 270]:
        rad = math.radians(angle)
        
        # Calculate end point
        end_x = center + int(arrow_len * math.cos(rad))
        end_y = center + int(arrow_len * math.sin(rad))
        
        # Shadow
        draw.line([(center + 1, center + 1), (end_x + 1, end_y + 1)], 
                  fill=(0, 0, 0, 60), width=2)
        
        # Main line
        draw.line([(center, center), (end_x, end_y)], 
                  fill=GREY_BRIGHT, width=2)
        
        # Arrow head
        head_angle1 = rad + math.radians(150)
        head_angle2 = rad - math.radians(150)
        
        head_x1 = end_x + int(arrow_head * math.cos(head_angle1))
        head_y1 = end_y + int(arrow_head * math.sin(head_angle1))
        head_x2 = end_x + int(arrow_head * math.cos(head_angle2))
        head_y2 = end_y + int(arrow_head * math.sin(head_angle2))
        
        draw.polygon([(end_x, end_y), (head_x1, head_y1), (head_x2, head_y2)],
                     fill=GREY_BRIGHT)
    
    # Center circle (dark green)
    center_radius = 4
    draw.ellipse([center - center_radius, center - center_radius,
                  center + center_radius, center + center_radius],
                 fill=STALKER_DARK_GREEN, outline=STALKER_GREEN, width=2)
    
    return img

def draw_resize_cursor(size, angle=0):
    """Create resize cursor (double arrow)"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center = size // 2
    length = size // 2
    arrow_head = 5
    
    rad = math.radians(angle)
    
    # Calculate end points
    x1 = center - int(length * math.cos(rad))
    y1 = center - int(length * math.sin(rad))
    x2 = center + int(length * math.cos(rad))
    y2 = center + int(length * math.sin(rad))
    
    # Shadow
    draw.line([(x1 + 1, y1 + 1), (x2 + 1, y2 + 1)], 
              fill=(0, 0, 0, 60), width=3)
    
    # Main line
    draw.line([(x1, y1), (x2, y2)], fill=GREY_BRIGHT, width=3)
    
    # Arrow heads
    for (end_x, end_y, flip) in [(x1, y1, 180), (x2, y2, 0)]:
        head_angle_base = rad + math.radians(flip)
        head_angle1 = head_angle_base + math.radians(30)
        head_angle2 = head_angle_base - math.radians(30)
        
        head_x1 = end_x + int(arrow_head * math.cos(head_angle1))
        head_y1 = end_y + int(arrow_head * math.sin(head_angle1))
        head_x2 = end_x + int(arrow_head * math.cos(head_angle2))
        head_y2 = end_y + int(arrow_head * math.sin(head_angle2))
        
        draw.polygon([(end_x, end_y), (head_x1, head_y1), (head_x2, head_y2)],
                     fill=GREY_BRIGHT)
    
    # Center accent (dark green)
    draw.ellipse([center - 3, center - 3, center + 3, center + 3],
                 fill=STALKER_DARK_GREEN)
    
    return img

def draw_wait_cursor(size, frame=0, total_frames=8):
    """Create animated waiting cursor (circle with rotating segment)"""
    img = draw_circle_cursor(size, STALKER_DARK_GREEN, GREY_BRIGHT)
    draw = ImageDraw.Draw(img)
    
    center = size // 2
    radius = size // 3 + 2
    
    # Calculate rotation angle
    angle = (360 / total_frames) * frame
    start_angle = angle - 45
    end_angle = angle + 45
    
    # Draw loading segment (brighter green)
    draw.arc([center - radius, center - radius, center + radius, center + radius],
             start_angle, end_angle, fill=STALKER_GREEN, width=4)
    
    return img

def draw_not_allowed(size):
    """Create not-allowed/forbidden cursor"""
    img = draw_circle_cursor(size, STALKER_DARK_GREEN, GREY_BRIGHT)
    draw = ImageDraw.Draw(img)
    
    center = size // 2
    radius = size // 3
    
    # Diagonal line (red-ish grey for prohibition)
    line_offset = int(radius * 0.7)
    draw.line([(center - line_offset, center - line_offset),
               (center + line_offset, center + line_offset)],
              fill=(150, 90, 90), width=4)
    
    return img

# Generate all cursor types
output_dir = '/tmp/stalker-cursor-build/images'
os.makedirs(output_dir, exist_ok=True)

print("Generating STALKER cursor images...")
print(f"  Size: {BASE_SIZE}x{BASE_SIZE} (25% bigger)")
print(f"  Colors: Brighter Grey ({GREY_BRIGHT}) | Dark Green ({STALKER_DARK_GREEN})")
print()

cursors = {
    'default': draw_pointer(BASE_SIZE),
    'pointer': draw_hand(BASE_SIZE),
    'text': draw_text_cursor(BASE_SIZE),
    'crosshair': draw_crosshair(BASE_SIZE),
    'move': draw_move_cursor(BASE_SIZE),
    'not-allowed': draw_not_allowed(BASE_SIZE),
    'wait': draw_circle_cursor(BASE_SIZE),
    
    # Resize cursors (different angles)
    'size_ver': draw_resize_cursor(BASE_SIZE, 90),   # vertical
    'size_hor': draw_resize_cursor(BASE_SIZE, 0),    # horizontal
    'size_fdiag': draw_resize_cursor(BASE_SIZE, 45), # forward diagonal
    'size_bdiag': draw_resize_cursor(BASE_SIZE, 135), # backward diagonal
}

# Save base cursors
for name, img in cursors.items():
    img.save(f'{output_dir}/{name}.png')
    print(f"  ✓ Generated {name}.png")

# Generate wait animation frames
print("\nGenerating wait animation frames...")
for i in range(8):
    img = draw_wait_cursor(BASE_SIZE, i, 8)
    img.save(f'{output_dir}/wait-{i:02d}.png')
    print(f"  ✓ Generated wait-{i:02d}.png")

print("\n✓ All cursor images generated!")

EOFPYTHON

# Run Python script
python3 "$SOURCE_DIR/generate_stalker_cursors.py"

# Define BASE_SIZE for bash (25% bigger than 32)
BASE_SIZE=40

echo ""
echo "[2/3] Creating cursor configuration files..."

# Create cursor configs for xcursorgen
create_cursor_config() {
    local name=$1
    local image=$2
    local hotspot_x=$3
    local hotspot_y=$4
    local config_file="$SOURCE_DIR/${name}.cfg"
    
    # Format: size xhot yhot filename
    echo "$BASE_SIZE $hotspot_x $hotspot_y $SOURCE_DIR/images/${image}.png" > "$config_file"
}

create_animated_config() {
    local name=$1
    local config_file="$SOURCE_DIR/${name}.cfg"
    
    > "$config_file"  # Clear file
    for i in {0..7}; do
        # Format: size xhot yhot filename delay-ms
        printf "%d %d %d %s %d\n" "$BASE_SIZE" "$((BASE_SIZE/2))" "$((BASE_SIZE/2))" \
               "$SOURCE_DIR/images/wait-$(printf '%02d' $i).png" "50" >> "$config_file"
    done
}

# Basic cursors
create_cursor_config "default" "default" "2" "2"
create_cursor_config "pointer" "pointer" "$((BASE_SIZE/4))" "$((BASE_SIZE/4))"
create_cursor_config "text" "text" "$((BASE_SIZE/2))" "$((BASE_SIZE/2))"
create_cursor_config "crosshair" "crosshair" "$((BASE_SIZE/2))" "$((BASE_SIZE/2))"
create_cursor_config "move" "move" "$((BASE_SIZE/2))" "$((BASE_SIZE/2))"
create_cursor_config "not-allowed" "not-allowed" "$((BASE_SIZE/2))" "$((BASE_SIZE/2))"

# Resize cursors
create_cursor_config "size_ver" "size_ver" "$((BASE_SIZE/2))" "$((BASE_SIZE/2))"
create_cursor_config "size_hor" "size_hor" "$((BASE_SIZE/2))" "$((BASE_SIZE/2))"
create_cursor_config "size_fdiag" "size_fdiag" "$((BASE_SIZE/2))" "$((BASE_SIZE/2))"
create_cursor_config "size_bdiag" "size_bdiag" "$((BASE_SIZE/2))" "$((BASE_SIZE/2))"

# Animated wait cursor
create_animated_config "wait"

echo ""
echo "[3/3] Building X11 cursor files..."

# Generate cursor files
for cfg in "$SOURCE_DIR"/*.cfg; do
    basename=$(basename "$cfg" .cfg)
    xcursorgen "$cfg" "$CURSOR_DIR/$basename"
    echo "  ✓ Created $basename cursor"
done

# Create symlinks for cursor name aliases
cd "$CURSOR_DIR"

# Default pointer aliases
ln -sf default left_ptr
ln -sf default arrow
ln -sf default top_left_arrow

# Hand/pointer aliases
ln -sf pointer hand
ln -sf pointer hand1
ln -sf pointer hand2
ln -sf pointer pointing_hand

# Text cursor aliases
ln -sf text xterm
ln -sf text ibeam

# Wait cursor aliases
ln -sf wait watch
ln -sf wait left_ptr_watch

# Not allowed aliases
ln -sf not-allowed forbidden
ln -sf not-allowed crossed_circle

# Move aliases
ln -sf move fleur
ln -sf move all-scroll

# Resize aliases
ln -sf size_ver v_double_arrow
ln -sf size_ver sb_v_double_arrow
ln -sf size_ver split_v
ln -sf size_ver col-resize

ln -sf size_hor h_double_arrow
ln -sf size_hor sb_h_double_arrow
ln -sf size_hor split_h
ln -sf size_hor row-resize

ln -sf size_fdiag fd_double_arrow
ln -sf size_fdiag size_fdiag
ln -sf size_fdiag nwse-resize

ln -sf size_bdiag bd_double_arrow
ln -sf size_bdiag size_bdiag
ln -sf size_bdiag nesw-resize

# Create index.theme
cat > "$HOME/.icons/$CURSOR_NAME/index.theme" << EOF
[Icon Theme]
Name=STALKER Cursors
Comment=STALKER-themed cursors - 25% bigger with brighter grey and dark green
EOF

echo ""
echo "========================================================="
echo "  STALKER CURSORS CREATED SUCCESSFULLY!"
echo "========================================================="
echo ""
echo "Cursor Features:"
echo "  • Size: 25% BIGGER than standard (40x40 base)"
echo "  • Outer Ring: BRIGHTER GREY (180,180,185)"
echo "  • Inner Circle: STALKER DARK GREEN (#3a4d3e)"
echo "  • Complete Adwaita-style cursor set"
echo ""
echo "Location: $HOME/.icons/$CURSOR_NAME"
echo ""
echo "To apply:"
echo "  1. Open GNOME Tweaks → Appearance → Cursor"
echo "  2. Select 'STALKER Cursors'"
echo ""
echo "Or run:"
echo "  gsettings set org.gnome.desktop.interface cursor-theme 'STALKER-Cursors'"
echo ""
echo "Cursor types included:"
echo "  ✓ Default pointer"
echo "  ✓ Hand/pointing"
echo "  ✓ Text selection (I-beam)"
echo "  ✓ Crosshair"
echo "  ✓ Move/grab"
echo "  ✓ Wait/loading (animated)"
echo "  ✓ Not allowed"
echo "  ✓ Resize (all directions)"
echo ""
