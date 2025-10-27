#!/bin/bash

# STALKER Minimal Hexagonal Cursor Theme - ENHANCED
# Upscaled with green center circles and animated resize cursors

echo "========================================================="
echo "  STALKER MINIMAL HEX CURSOR - ENHANCED VERSION"
echo "  Upscaled | Green Center | Animated Resize"
echo "========================================================="
echo ""

# Create cursor directory
CURSOR_NAME="Stalker-Hex-Minimal"
CURSOR_DIR="$HOME/.icons/$CURSOR_NAME/cursors"
SOURCE_DIR="/tmp/stalker-cursor-minimal"

mkdir -p "$CURSOR_DIR"
mkdir -p "$SOURCE_DIR"

echo "[1/4] Creating enhanced minimal cursor designs..."

# Create Python script to generate enhanced cursors
cat > "$SOURCE_DIR/generate_minimal_cursors.py" << 'EOFPYTHON'
#!/usr/bin/env python3
import os
from PIL import Image, ImageDraw, ImageFilter
import math

# STALKER colors - softer, more muted
STALKER_PRIMARY = (95, 112, 96, 200)       # #5f7060 with transparency
STALKER_ACCENT = (122, 138, 125, 180)      # #7a8a7d lighter
STALKER_DARK = (58, 77, 62, 220)           # #3a4d3e for outlines
STALKER_GREEN_CENTER = (95, 112, 96, 255)  # Solid green for center circle
STALKER_LIGHT = (201, 197, 180, 150)       # #c9c5b4 very light
WHITE = (255, 255, 255, 255)
BLACK = (0, 0, 0, 100)

# UPSCALED SIZE - 1.5x bigger
SIZE = 48  # Was 32

def draw_minimal_hexagon(draw, center_x, center_y, size, color, line_width=2, filled=False):
    """Draw a minimal hexagon outline or filled"""
    angles = [i * 60 for i in range(6)]
    points = []
    for angle in angles:
        rad = math.radians(angle)
        x = center_x + size * math.cos(rad)
        y = center_y + size * math.sin(rad)
        points.append((x, y))
    
    if filled:
        draw.polygon(points, fill=color, outline=None)
    else:
        draw.polygon(points, outline=color, width=line_width, fill=None)

def draw_center_circle(draw, center_x, center_y, radius=3):
    """Draw green center circle"""
    draw.ellipse([
        center_x - radius, center_y - radius,
        center_x + radius, center_y + radius
    ], fill=STALKER_GREEN_CENTER)

def add_soft_glow(img):
    """Add subtle soft glow effect"""
    glow = img.filter(ImageFilter.GaussianBlur(radius=1.5))
    result = Image.alpha_composite(glow, img)
    return result

def create_minimal_pointer(size=SIZE):
    """Minimal pointer - hexagon with green center"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    # Small hexagon at pointer tip
    hex_x, hex_y = 12, 12
    hex_size = 9
    
    # Subtle shadow
    draw_minimal_hexagon(draw, hex_x + 0.5, hex_y + 0.5, hex_size, BLACK, 3)
    
    # Main hexagon outline
    draw_minimal_hexagon(draw, hex_x, hex_y, hex_size, STALKER_PRIMARY, 3)
    
    # GREEN CENTER CIRCLE
    draw_center_circle(draw, hex_x, hex_y, 4)
    
    return add_soft_glow(img)

def create_minimal_hand(size=SIZE):
    """Minimal hand cursor - NO green center (clickable)"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    hex_size = 10
    
    # Hexagon outline only
    draw_minimal_hexagon(draw, center_x, center_y, hex_size, STALKER_PRIMARY, 3)
    
    # Small accent dot instead of green circle
    draw.ellipse([center_x-2, center_y-2, center_x+2, center_y+2], fill=STALKER_ACCENT)
    
    return add_soft_glow(img)

def create_minimal_text(size=SIZE):
    """Minimal text cursor - with green center"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x = size // 2
    hex_size = 6
    
    # Top small hexagon
    draw_minimal_hexagon(draw, center_x, hex_size + 5, hex_size, STALKER_PRIMARY, 2)
    
    # Thin vertical line
    draw.line([(center_x, hex_size + 5), (center_x, size - hex_size - 5)], 
              fill=STALKER_ACCENT, width=2)
    
    # Bottom small hexagon
    draw_minimal_hexagon(draw, center_x, size - hex_size - 5, hex_size, STALKER_PRIMARY, 2)
    
    # GREEN CENTER CIRCLE
    draw_center_circle(draw, center_x, center_x, 3)
    
    return add_soft_glow(img)

def create_minimal_crosshair(size=SIZE):
    """Minimal crosshair with green center"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    hex_size = 7
    
    # Center hexagon
    draw_minimal_hexagon(draw, center_x, center_y, hex_size, STALKER_PRIMARY, 3)
    
    # Thin crosshair lines
    line_length = size // 2 - 12
    line_color = STALKER_ACCENT[:3] + (150,)
    # Top
    draw.line([(center_x, center_y - hex_size - 3), (center_x, center_y - line_length)], 
              fill=line_color, width=2)
    # Bottom
    draw.line([(center_x, center_y + hex_size + 3), (center_x, center_y + line_length)], 
              fill=line_color, width=2)
    # Left
    draw.line([(center_x - hex_size - 3, center_y), (center_x - line_length, center_y)], 
              fill=line_color, width=2)
    # Right
    draw.line([(center_x + hex_size + 3, center_y), (center_x + line_length, center_y)], 
              fill=line_color, width=2)
    
    # GREEN CENTER CIRCLE
    draw_center_circle(draw, center_x, center_y, 4)
    
    return add_soft_glow(img)

def create_minimal_move(size=SIZE):
    """Minimal move cursor with green center"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    hex_size = 9
    
    # Center hexagon
    draw_minimal_hexagon(draw, center_x, center_y, hex_size, STALKER_PRIMARY, 3)
    
    # Minimal directional indicators
    arrow_distance = hex_size + 9
    arrow_size = 5
    arrow_color = STALKER_ACCENT[:3] + (180,)
    
    # Up
    draw.line([(center_x, center_y - hex_size - 3), (center_x, center_y - arrow_distance)], 
              fill=STALKER_ACCENT, width=2)
    draw.polygon([
        (center_x, center_y - arrow_distance),
        (center_x - arrow_size, center_y - arrow_distance + arrow_size),
        (center_x + arrow_size, center_y - arrow_distance + arrow_size)
    ], fill=arrow_color)
    
    # Down
    draw.line([(center_x, center_y + hex_size + 3), (center_x, center_y + arrow_distance)], 
              fill=STALKER_ACCENT, width=2)
    draw.polygon([
        (center_x, center_y + arrow_distance),
        (center_x - arrow_size, center_y + arrow_distance - arrow_size),
        (center_x + arrow_size, center_y + arrow_distance - arrow_size)
    ], fill=arrow_color)
    
    # Left
    draw.line([(center_x - hex_size - 3, center_y), (center_x - arrow_distance, center_y)], 
              fill=STALKER_ACCENT, width=2)
    draw.polygon([
        (center_x - arrow_distance, center_y),
        (center_x - arrow_distance + arrow_size, center_y - arrow_size),
        (center_x - arrow_distance + arrow_size, center_y + arrow_size)
    ], fill=arrow_color)
    
    # Right
    draw.line([(center_x + hex_size + 3, center_y), (center_x + arrow_distance, center_y)], 
              fill=STALKER_ACCENT, width=2)
    draw.polygon([
        (center_x + arrow_distance, center_y),
        (center_x + arrow_distance - arrow_size, center_y - arrow_size),
        (center_x + arrow_distance - arrow_size, center_y + arrow_size)
    ], fill=arrow_color)
    
    # GREEN CENTER CIRCLE
    draw_center_circle(draw, center_x, center_y, 4)
    
    return add_soft_glow(img)

def create_animated_resize(size=SIZE, direction='nw-se', frame=0, total_frames=12):
    """ANIMATED resize cursor - pulses and flows"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    
    # Pulse effect
    progress = frame / total_frames
    pulse = math.sin(progress * 2 * math.pi) * 0.5 + 0.5
    hex_size = 7 + (pulse * 2)
    
    # Center hexagon with pulse
    draw_minimal_hexagon(draw, center_x, center_y, hex_size, STALKER_PRIMARY, 2)
    
    arrow_size = 5
    offset = pulse * 3  # Arrows move in/out
    arrow_fill = STALKER_ACCENT[:3] + (180,)
    line_opacity = int(100 + pulse * 50)
    
    if direction == 'nw-se':
        # Top-left arrow with animation
        start_pos = 9 + offset
        draw.polygon([
            (start_pos, start_pos), 
            (start_pos + 8, start_pos), 
            (start_pos, start_pos + 8)
        ], fill=arrow_fill)
        
        # Bottom-right arrow
        end_pos = size - 9 - offset
        draw.polygon([
            (end_pos, end_pos), 
            (end_pos - 8, end_pos), 
            (end_pos, end_pos - 8)
        ], fill=arrow_fill)
        
        # Diagonal line
        draw.line([(18, 18), (size-18, size-18)], 
                 fill=STALKER_ACCENT[:3] + (line_opacity,), width=2)
        
    elif direction == 'ne-sw':
        # Top-right arrow
        start_pos_x = size - 9 - offset
        start_pos_y = 9 + offset
        draw.polygon([
            (start_pos_x, start_pos_y), 
            (start_pos_x - 8, start_pos_y), 
            (start_pos_x, start_pos_y + 8)
        ], fill=arrow_fill)
        
        # Bottom-left arrow
        end_pos_x = 9 + offset
        end_pos_y = size - 9 - offset
        draw.polygon([
            (end_pos_x, end_pos_y), 
            (end_pos_x + 8, end_pos_y), 
            (end_pos_x, end_pos_y - 8)
        ], fill=arrow_fill)
        
        # Diagonal line
        draw.line([(size-18, 18), (18, size-18)], 
                 fill=STALKER_ACCENT[:3] + (line_opacity,), width=2)
        
    elif direction == 'horizontal':
        # Left arrow
        start_pos = 9 + offset
        draw.polygon([
            (start_pos, center_y),
            (start_pos + 8, center_y - arrow_size),
            (start_pos + 8, center_y + arrow_size)
        ], fill=arrow_fill)
        
        # Right arrow
        end_pos = size - 9 - offset
        draw.polygon([
            (end_pos, center_y),
            (end_pos - 8, center_y - arrow_size),
            (end_pos - 8, center_y + arrow_size)
        ], fill=arrow_fill)
        
        # Horizontal line
        draw.line([(18, center_y), (size-18, center_y)], 
                 fill=STALKER_ACCENT[:3] + (line_opacity,), width=2)
        
    elif direction == 'vertical':
        # Top arrow
        start_pos = 9 + offset
        draw.polygon([
            (center_x, start_pos),
            (center_x - arrow_size, start_pos + 8),
            (center_x + arrow_size, start_pos + 8)
        ], fill=arrow_fill)
        
        # Bottom arrow
        end_pos = size - 9 - offset
        draw.polygon([
            (center_x, end_pos),
            (center_x - arrow_size, end_pos - 8),
            (center_x + arrow_size, end_pos - 8)
        ], fill=arrow_fill)
        
        # Vertical line
        draw.line([(center_x, 18), (center_x, size-18)], 
                 fill=STALKER_ACCENT[:3] + (line_opacity,), width=2)
    
    # GREEN CENTER CIRCLE with pulse
    circle_radius = 3 + pulse * 1
    draw_center_circle(draw, center_x, center_y, int(circle_radius))
    
    return add_soft_glow(img)

def create_breathing_animation(size=SIZE, frame=0, total_frames=16):
    """Soft breathing animation with green center"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    
    # Smooth sine wave for breathing effect
    progress = frame / total_frames
    pulse = math.sin(progress * 2 * math.pi) * 0.5 + 0.5
    
    # Size varies
    hex_size = 9 + (pulse * 3)
    
    # Opacity varies
    opacity = int(180 + (pulse * 40))
    
    # Outer subtle glow
    glow_size = hex_size + 3
    glow_color = STALKER_ACCENT[:3] + (int(50 + pulse * 30),)
    draw_minimal_hexagon(draw, center_x, center_y, glow_size, glow_color, 4, filled=True)
    
    # Main hexagon
    hex_color = STALKER_PRIMARY[:3] + (opacity,)
    draw_minimal_hexagon(draw, center_x, center_y, hex_size, hex_color, 3)
    
    # GREEN CENTER CIRCLE that pulses
    circle_radius = 3 + pulse * 1.5
    draw_center_circle(draw, center_x, center_y, int(circle_radius))
    
    return add_soft_glow(img)

def create_rotating_animation(size=SIZE, frame=0, total_frames=24):
    """Smooth rotating animation with green center"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    hex_size = 10
    
    # Rotation angle
    rotation = (frame / total_frames) * 60
    
    # Draw rotating hexagon
    angles = [i * 60 + rotation for i in range(6)]
    points = []
    for angle in angles:
        rad = math.radians(angle)
        x = center_x + hex_size * math.cos(rad)
        y = center_y + hex_size * math.sin(rad)
        points.append((x, y))
    
    # Subtle outer glow
    glow_points = []
    for angle in angles:
        rad = math.radians(angle)
        x = center_x + (hex_size + 3) * math.cos(rad)
        y = center_y + (hex_size + 3) * math.sin(rad)
        glow_points.append((x, y))
    draw.polygon(glow_points, fill=STALKER_ACCENT[:3] + (40,), outline=None)
    
    # Main hexagon
    draw.polygon(points, outline=STALKER_PRIMARY, width=3, fill=None)
    
    # Small rotating indicator
    indicator_angle = math.radians(rotation + 30)
    ind_distance = hex_size * 0.7
    ind_x = center_x + ind_distance * math.cos(indicator_angle)
    ind_y = center_y + ind_distance * math.sin(indicator_angle)
    
    draw.ellipse([ind_x-2, ind_y-2, ind_x+2, ind_y+2], 
                fill=STALKER_ACCENT[:3] + (200,))
    
    # GREEN CENTER CIRCLE
    draw_center_circle(draw, center_x, center_y, 4)
    
    return add_soft_glow(img)

def save_cursor_images(output_dir):
    """Generate and save all enhanced cursor images"""
    os.makedirs(output_dir, exist_ok=True)
    
    print("  Generating UPSCALED cursor designs (48x48)...")
    
    # Static cursors
    create_minimal_pointer(SIZE).save(f"{output_dir}/pointer.png")
    create_minimal_hand(SIZE).save(f"{output_dir}/hand.png")
    create_minimal_text(SIZE).save(f"{output_dir}/text.png")
    create_minimal_crosshair(SIZE).save(f"{output_dir}/crosshair.png")
    create_minimal_move(SIZE).save(f"{output_dir}/move.png")
    
    # ANIMATED Resize cursors (12 frames each)
    print("  Creating ANIMATED resize cursors (12 frames each)...")
    for direction in ['nw-se', 'ne-sw', 'horizontal', 'vertical']:
        for frame in range(12):
            create_animated_resize(SIZE, direction, frame, 12).save(
                f"{output_dir}/resize-{direction}-{frame:02d}.png")
    
    # Breathing animation (16 frames)
    print("  Creating breathing animation (16 frames)...")
    for frame in range(16):
        create_breathing_animation(SIZE, frame, 16).save(
            f"{output_dir}/loading-breath-{frame:02d}.png")
    
    # Rotating animation (24 frames)
    print("  Creating rotating animation (24 frames)...")
    for frame in range(24):
        create_rotating_animation(SIZE, frame, 24).save(
            f"{output_dir}/loading-rotate-{frame:02d}.png")
    
    print("  ✓ All enhanced cursor images generated!")

if __name__ == "__main__":
    output_dir = "/tmp/stalker-cursor-minimal"
    save_cursor_images(output_dir)
EOFPYTHON

chmod +x "$SOURCE_DIR/generate_minimal_cursors.py"

# Run Python script
python3 "$SOURCE_DIR/generate_minimal_cursors.py"

echo ""
echo "[2/4] Converting to X11 cursor format..."

# Create cursor config files
cd "$SOURCE_DIR"

cat > "pointer.cursor" << EOF
48 6 6 pointer.png
EOF

cat > "hand.cursor" << EOF
48 24 24 hand.png
EOF

cat > "text.cursor" << EOF
48 24 24 text.png
EOF

cat > "crosshair.cursor" << EOF
48 24 24 crosshair.png
EOF

cat > "move.cursor" << EOF
48 24 24 move.png
EOF

# Animated resize cursors (12 frames each)
for direction in nw-se ne-sw horizontal vertical; do
    cat > "resize-${direction}.cursor" << EOF
48 24 24 resize-${direction}-00.png 70
48 24 24 resize-${direction}-01.png 70
48 24 24 resize-${direction}-02.png 70
48 24 24 resize-${direction}-03.png 70
48 24 24 resize-${direction}-04.png 70
48 24 24 resize-${direction}-05.png 70
48 24 24 resize-${direction}-06.png 70
48 24 24 resize-${direction}-07.png 70
48 24 24 resize-${direction}-08.png 70
48 24 24 resize-${direction}-09.png 70
48 24 24 resize-${direction}-10.png 70
48 24 24 resize-${direction}-11.png 70
EOF
done

# Breathing animation
cat > "loading-breath.cursor" << EOF
48 24 24 loading-breath-00.png 75
48 24 24 loading-breath-01.png 75
48 24 24 loading-breath-02.png 75
48 24 24 loading-breath-03.png 75
48 24 24 loading-breath-04.png 75
48 24 24 loading-breath-05.png 75
48 24 24 loading-breath-06.png 75
48 24 24 loading-breath-07.png 75
48 24 24 loading-breath-08.png 75
48 24 24 loading-breath-09.png 75
48 24 24 loading-breath-10.png 75
48 24 24 loading-breath-11.png 75
48 24 24 loading-breath-12.png 75
48 24 24 loading-breath-13.png 75
48 24 24 loading-breath-14.png 75
48 24 24 loading-breath-15.png 75
EOF

# Rotating animation
cat > "loading-rotate.cursor" << EOF
48 24 24 loading-rotate-00.png 60
48 24 24 loading-rotate-01.png 60
48 24 24 loading-rotate-02.png 60
48 24 24 loading-rotate-03.png 60
48 24 24 loading-rotate-04.png 60
48 24 24 loading-rotate-05.png 60
48 24 24 loading-rotate-06.png 60
48 24 24 loading-rotate-07.png 60
48 24 24 loading-rotate-08.png 60
48 24 24 loading-rotate-09.png 60
48 24 24 loading-rotate-10.png 60
48 24 24 loading-rotate-11.png 60
48 24 24 loading-rotate-12.png 60
48 24 24 loading-rotate-13.png 60
48 24 24 loading-rotate-14.png 60
48 24 24 loading-rotate-15.png 60
48 24 24 loading-rotate-16.png 60
48 24 24 loading-rotate-17.png 60
48 24 24 loading-rotate-18.png 60
48 24 24 loading-rotate-19.png 60
48 24 24 loading-rotate-20.png 60
48 24 24 loading-rotate-21.png 60
48 24 24 loading-rotate-22.png 60
48 24 24 loading-rotate-23.png 60
EOF

# Convert to X11 format
echo "  Converting cursors..."
xcursorgen pointer.cursor "$CURSOR_DIR/left_ptr"
xcursorgen hand.cursor "$CURSOR_DIR/hand2"
xcursorgen text.cursor "$CURSOR_DIR/xterm"
xcursorgen crosshair.cursor "$CURSOR_DIR/crosshair"
xcursorgen move.cursor "$CURSOR_DIR/fleur"
xcursorgen resize-nw-se.cursor "$CURSOR_DIR/size_fdiag"
xcursorgen resize-ne-sw.cursor "$CURSOR_DIR/size_bdiag"
xcursorgen resize-horizontal.cursor "$CURSOR_DIR/size_hor"
xcursorgen resize-vertical.cursor "$CURSOR_DIR/size_ver"
xcursorgen loading-breath.cursor "$CURSOR_DIR/watch"
xcursorgen loading-rotate.cursor "$CURSOR_DIR/wait"

echo ""
echo "[3/4] Creating cursor aliases..."

cd "$CURSOR_DIR"
ln -sf left_ptr default
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
echo "[4/4] Creating theme metadata..."

cat > "$HOME/.icons/$CURSOR_NAME/index.theme" << EOF
[Icon Theme]
Name=Stalker-Hex-Minimal
Comment=Enhanced minimal hexagonal cursor - Upscaled with green center and animated resize
Example=default
EOF

echo ""
echo "========================================================="
echo "  ENHANCED MINIMAL CURSOR THEME COMPLETE!"
echo "========================================================="
echo ""
echo "✨ Enhancements:"
echo "  • UPSCALED to 48x48 (1.5x bigger)"
echo "  • GREEN center circles on all cursors"
echo "  • NO green circle on clickable (hand) cursor"
echo "  • ANIMATED resize cursors (12 frames each)"
echo "  • Smooth pulsing and flowing effects"
echo ""
echo "🎬 Animations:"
echo "  1. Resize cursors - Pulse + arrow flow (12 frames, 70ms)"
echo "  2. Breathing (watch) - Gentle pulse (16 frames, 75ms)"
echo "  3. Rotating (wait) - Smooth rotation (24 frames, 60ms)"
echo ""
echo "To apply:"
echo "  gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex-Minimal'"
echo ""
echo "Already applied if you had it set before!"
echo ""
