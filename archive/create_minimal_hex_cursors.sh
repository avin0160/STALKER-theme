#!/bin/bash

# STALKER Minimal Hexagonal Cursor Theme Creator
# Minimalist, soft design with subtle animations

echo "========================================================="
echo "  STALKER MINIMAL HEXAGONAL CURSOR THEME"
echo "  Clean, soft design with subtle animations"
echo "========================================================="
echo ""

# Create cursor directory
CURSOR_NAME="Stalker-Hex-Minimal"
CURSOR_DIR="$HOME/.icons/$CURSOR_NAME/cursors"
SOURCE_DIR="/tmp/stalker-cursor-minimal"

mkdir -p "$CURSOR_DIR"
mkdir -p "$SOURCE_DIR"

echo "[1/4] Creating minimal hexagonal cursor designs..."

# Create Python script to generate minimal cursors
cat > "$SOURCE_DIR/generate_minimal_cursors.py" << 'EOFPYTHON'
#!/usr/bin/env python3
import os
from PIL import Image, ImageDraw, ImageFilter
import math

# STALKER colors - softer, more muted
STALKER_PRIMARY = (95, 112, 96, 200)       # #5f7060 with transparency
STALKER_ACCENT = (122, 138, 125, 180)      # #7a8a7d lighter
STALKER_DARK = (58, 77, 62, 220)           # #3a4d3e for outlines
STALKER_LIGHT = (201, 197, 180, 150)       # #c9c5b4 very light
BRIGHT_GREEN = (0, 255, 100, 255)          # Very bright, colorful green center dot
WHITE = (255, 255, 255, 255)
BLACK = (0, 0, 0, 100)

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

def add_soft_glow(img):
    """Add subtle soft glow effect"""
    # Create a slightly blurred version for glow
    glow = img.filter(ImageFilter.GaussianBlur(radius=1))
    # Composite original over glow
    result = Image.alpha_composite(glow, img)
    return result

def create_minimal_pointer(size=32):
    """Minimal pointer - just hexagon outline"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    # Small hexagon at pointer tip
    hex_x, hex_y = 8, 8
    hex_size = 6
    
    # Subtle shadow
    draw_minimal_hexagon(draw, hex_x + 0.5, hex_y + 0.5, hex_size, BLACK, 2)
    
    # Main hexagon outline
    draw_minimal_hexagon(draw, hex_x, hex_y, hex_size, STALKER_PRIMARY, 2)
    
    # Very bright green center dot
    draw.ellipse([hex_x-1.5, hex_y-1.5, hex_x+1.5, hex_y+1.5], fill=BRIGHT_GREEN)
    
    return add_soft_glow(img)

def create_minimal_hand(size=32):
    """Minimal hand cursor"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    hex_size = 7
    
    # Hexagon outline only
    draw_minimal_hexagon(draw, center_x, center_y, hex_size, STALKER_PRIMARY, 2)
    
    # Very bright green center dot
    draw.ellipse([center_x-1.5, center_y-1.5, center_x+1.5, center_y+1.5], fill=BRIGHT_GREEN)
    
    return add_soft_glow(img)

def create_minimal_text(size=32):
    """Traditional I-beam text cursor with STALKER theme"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x = size // 2
    center_y = size // 2
    
    # I-beam dimensions
    beam_height = 20
    beam_width = 8
    stem_width = 2
    
    top_y = center_y - beam_height // 2
    bottom_y = center_y + beam_height // 2
    
    # Shadow for depth
    shadow_offset = 1
    shadow_color = (0, 0, 0, 80)
    
    # Top bar shadow
    draw.rectangle([
        center_x - beam_width // 2 + shadow_offset,
        top_y + shadow_offset,
        center_x + beam_width // 2 + shadow_offset,
        top_y + 2 + shadow_offset
    ], fill=shadow_color)
    
    # Vertical stem shadow
    draw.rectangle([
        center_x - stem_width // 2 + shadow_offset,
        top_y + shadow_offset,
        center_x + stem_width // 2 + shadow_offset,
        bottom_y + shadow_offset
    ], fill=shadow_color)
    
    # Bottom bar shadow
    draw.rectangle([
        center_x - beam_width // 2 + shadow_offset,
        bottom_y - 2 + shadow_offset,
        center_x + beam_width // 2 + shadow_offset,
        bottom_y + shadow_offset
    ], fill=shadow_color)
    
    # Top horizontal bar (STALKER green)
    draw.rectangle([
        center_x - beam_width // 2,
        top_y,
        center_x + beam_width // 2,
        top_y + 2
    ], fill=STALKER_PRIMARY)
    
    # Vertical stem (STALKER green)
    draw.rectangle([
        center_x - stem_width // 2,
        top_y,
        center_x + stem_width // 2,
        bottom_y
    ], fill=STALKER_PRIMARY)
    
    # Bottom horizontal bar (STALKER green)
    draw.rectangle([
        center_x - beam_width // 2,
        bottom_y - 2,
        center_x + beam_width // 2,
        bottom_y
    ], fill=STALKER_PRIMARY)
    
    # Very bright green center dot
    draw.ellipse([center_x-2, center_y-2, center_x+2, center_y+2], fill=BRIGHT_GREEN)
    
    # Subtle outline for definition
    outline_color = STALKER_DARK[:3] + (150,)
    draw.rectangle([
        center_x - beam_width // 2,
        top_y,
        center_x + beam_width // 2,
        top_y + 2
    ], outline=outline_color, width=1)
    
    draw.rectangle([
        center_x - beam_width // 2,
        bottom_y - 2,
        center_x + beam_width // 2,
        bottom_y
    ], outline=outline_color, width=1)
    
    return add_soft_glow(img)

def create_minimal_crosshair(size=32):
    """Minimal crosshair"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    hex_size = 5
    
    # Center hexagon
    draw_minimal_hexagon(draw, center_x, center_y, hex_size, STALKER_PRIMARY, 2)
    
    # Very bright green center dot
    draw.ellipse([center_x-1.5, center_y-1.5, center_x+1.5, center_y+1.5], fill=BRIGHT_GREEN)
    
    # Thin crosshair lines
    line_length = size // 2 - 8
    line_color = STALKER_ACCENT[:3] + (150,)
    # Top
    draw.line([(center_x, center_y - hex_size - 2), (center_x, center_y - line_length)], 
              fill=line_color, width=1)
    # Bottom
    draw.line([(center_x, center_y + hex_size + 2), (center_x, center_y + line_length)], 
              fill=line_color, width=1)
    # Left
    draw.line([(center_x - hex_size - 2, center_y), (center_x - line_length, center_y)], 
              fill=line_color, width=1)
    # Right
    draw.line([(center_x + hex_size + 2, center_y), (center_x + line_length, center_y)], 
              fill=line_color, width=1)
    
    return add_soft_glow(img)

def create_minimal_move(size=32):
    """Minimal move cursor - hex with subtle arrows"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    hex_size = 6
    
    # Center hexagon
    draw_minimal_hexagon(draw, center_x, center_y, hex_size, STALKER_PRIMARY, 2)
    
    # Very bright green center dot
    draw.ellipse([center_x-1.5, center_y-1.5, center_x+1.5, center_y+1.5], fill=BRIGHT_GREEN)
    
    # Minimal directional indicators (small lines)
    arrow_distance = hex_size + 6
    arrow_size = 3
    arrow_fill = STALKER_ACCENT[:3] + (180,)
    
    # Up
    draw.line([(center_x, center_y - hex_size - 2), (center_x, center_y - arrow_distance)], 
              fill=STALKER_ACCENT, width=1)
    draw.polygon([
        (center_x, center_y - arrow_distance),
        (center_x - arrow_size, center_y - arrow_distance + arrow_size),
        (center_x + arrow_size, center_y - arrow_distance + arrow_size)
    ], fill=arrow_fill)
    
    # Down
    draw.line([(center_x, center_y + hex_size + 2), (center_x, center_y + arrow_distance)], 
              fill=STALKER_ACCENT, width=1)
    draw.polygon([
        (center_x, center_y + arrow_distance),
        (center_x - arrow_size, center_y + arrow_distance - arrow_size),
        (center_x + arrow_size, center_y + arrow_distance - arrow_size)
    ], fill=arrow_fill)
    
    # Left
    draw.line([(center_x - hex_size - 2, center_y), (center_x - arrow_distance, center_y)], 
              fill=STALKER_ACCENT, width=1)
    draw.polygon([
        (center_x - arrow_distance, center_y),
        (center_x - arrow_distance + arrow_size, center_y - arrow_size),
        (center_x - arrow_distance + arrow_size, center_y + arrow_size)
    ], fill=arrow_fill)
    
    # Right
    draw.line([(center_x + hex_size + 2, center_y), (center_x + arrow_distance, center_y)], 
              fill=STALKER_ACCENT, width=1)
    draw.polygon([
        (center_x + arrow_distance, center_y),
        (center_x + arrow_distance - arrow_size, center_y - arrow_size),
        (center_x + arrow_distance - arrow_size, center_y + arrow_size)
    ], fill=arrow_fill)
    
    return add_soft_glow(img)

def create_minimal_resize(size=32, direction='nw-se'):
    """Minimal resize cursor"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    hex_size = 5
    
    # Center small hexagon
    draw_minimal_hexagon(draw, center_x, center_y, hex_size, STALKER_PRIMARY, 1)
    
    # Very bright green center dot
    draw.ellipse([center_x-1.5, center_y-1.5, center_x+1.5, center_y+1.5], fill=BRIGHT_GREEN)
    
    arrow_size = 4
    
    arrow_fill = STALKER_ACCENT[:3] + (180,)
    line_fill = STALKER_ACCENT[:3] + (100,)
    
    if direction == 'nw-se':
        # Top-left arrow
        draw.polygon([(6, 6), (12, 6), (6, 12)], fill=arrow_fill)
        # Bottom-right arrow
        draw.polygon([(size-6, size-6), (size-12, size-6), (size-6, size-12)], 
                    fill=arrow_fill)
        # Diagonal line
        draw.line([(12, 12), (size-12, size-12)], fill=line_fill, width=1)
        
    elif direction == 'ne-sw':
        # Top-right arrow
        draw.polygon([(size-6, 6), (size-12, 6), (size-6, 12)], fill=arrow_fill)
        # Bottom-left arrow
        draw.polygon([(6, size-6), (12, size-6), (6, size-12)], fill=arrow_fill)
        # Diagonal line
        draw.line([(size-12, 12), (12, size-12)], fill=line_fill, width=1)
        
    elif direction == 'horizontal':
        # Left arrow
        draw.polygon([
            (6, center_y),
            (12, center_y - arrow_size),
            (12, center_y + arrow_size)
        ], fill=arrow_fill)
        # Right arrow
        draw.polygon([
            (size-6, center_y),
            (size-12, center_y - arrow_size),
            (size-12, center_y + arrow_size)
        ], fill=arrow_fill)
        # Horizontal line
        draw.line([(12, center_y), (size-12, center_y)], fill=line_fill, width=1)
        
    elif direction == 'vertical':
        # Top arrow
        draw.polygon([
            (center_x, 6),
            (center_x - arrow_size, 12),
            (center_x + arrow_size, 12)
        ], fill=arrow_fill)
        # Bottom arrow
        draw.polygon([
            (center_x, size-6),
            (center_x - arrow_size, size-12),
            (center_x + arrow_size, size-12)
        ], fill=arrow_fill)
        # Vertical line
        draw.line([(center_x, 12), (center_x, size-12)], fill=line_fill, width=1)
    
    return add_soft_glow(img)

def create_breathing_animation(size=32, frame=0, total_frames=16):
    """Soft breathing animation - hexagon gently pulses"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    
    # Smooth sine wave for breathing effect
    progress = frame / total_frames
    pulse = math.sin(progress * 2 * math.pi) * 0.5 + 0.5  # 0 to 1
    
    # Size varies from 6 to 8
    hex_size = 6 + (pulse * 2)
    
    # Opacity varies from 180 to 220
    opacity = int(180 + (pulse * 40))
    
    # Outer subtle glow
    glow_size = hex_size + 2
    glow_color = STALKER_ACCENT[:3] + (int(50 + pulse * 30),)
    draw_minimal_hexagon(draw, center_x, center_y, glow_size, glow_color, 3, filled=True)
    
    # Main hexagon
    hex_color = STALKER_PRIMARY[:3] + (opacity,)
    draw_minimal_hexagon(draw, center_x, center_y, hex_size, hex_color, 2)
    
    return add_soft_glow(img)

def create_rotating_animation(size=32, frame=0, total_frames=24):
    """Smooth rotating animation - hexagon slowly rotates"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    hex_size = 7
    
    # Rotation angle
    rotation = (frame / total_frames) * 60  # One side rotation per cycle
    
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
    glow_fill = STALKER_ACCENT[:3] + (40,)
    for angle in angles:
        rad = math.radians(angle)
        x = center_x + (hex_size + 2) * math.cos(rad)
        y = center_y + (hex_size + 2) * math.sin(rad)
        glow_points.append((x, y))
    draw.polygon(glow_points, fill=glow_fill, outline=None)
    
    # Main hexagon
    draw.polygon(points, outline=STALKER_PRIMARY, width=2, fill=None)
    
    # Small rotating indicator
    indicator_angle = math.radians(rotation + 30)
    ind_distance = hex_size * 0.7
    ind_x = center_x + ind_distance * math.cos(indicator_angle)
    ind_y = center_y + ind_distance * math.sin(indicator_angle)
    
    ind_fill = STALKER_ACCENT[:3] + (200,)
    draw.ellipse([ind_x-1.5, ind_y-1.5, ind_x+1.5, ind_y+1.5], 
                fill=ind_fill)
    
    return add_soft_glow(img)

def save_cursor_images(output_dir):
    """Generate and save all minimal cursor images"""
    os.makedirs(output_dir, exist_ok=True)
    
    print("  Generating minimal cursor designs...")
    
    # Static cursors
    create_minimal_pointer(32).save(f"{output_dir}/pointer.png")
    create_minimal_hand(32).save(f"{output_dir}/hand.png")
    create_minimal_text(32).save(f"{output_dir}/text.png")
    create_minimal_crosshair(32).save(f"{output_dir}/crosshair.png")
    create_minimal_move(32).save(f"{output_dir}/move.png")
    
    # Resize cursors
    for direction in ['nw-se', 'ne-sw', 'horizontal', 'vertical']:
        create_minimal_resize(32, direction).save(f"{output_dir}/resize-{direction}.png")
    
    # Breathing animation (16 frames for smooth effect)
    print("  Creating breathing animation (16 frames)...")
    for frame in range(16):
        create_breathing_animation(32, frame, 16).save(
            f"{output_dir}/loading-breath-{frame:02d}.png")
    
    # Rotating animation (24 frames for ultra-smooth)
    print("  Creating rotating animation (24 frames)...")
    for frame in range(24):
        create_rotating_animation(32, frame, 24).save(
            f"{output_dir}/loading-rotate-{frame:02d}.png")
    
    print("  ✓ All minimal cursor images generated")

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
32 4 4 pointer.png
EOF

cat > "hand.cursor" << EOF
32 16 16 hand.png
EOF

cat > "text.cursor" << EOF
32 16 16 text.png
EOF

cat > "crosshair.cursor" << EOF
32 16 16 crosshair.png
EOF

cat > "move.cursor" << EOF
32 16 16 move.png
EOF

for direction in nw-se ne-sw horizontal vertical; do
    cat > "resize-${direction}.cursor" << EOF
32 16 16 resize-${direction}.png
EOF
done

# Breathing animation (slower, softer)
cat > "loading-breath.cursor" << EOF
32 16 16 loading-breath-00.png 75
32 16 16 loading-breath-01.png 75
32 16 16 loading-breath-02.png 75
32 16 16 loading-breath-03.png 75
32 16 16 loading-breath-04.png 75
32 16 16 loading-breath-05.png 75
32 16 16 loading-breath-06.png 75
32 16 16 loading-breath-07.png 75
32 16 16 loading-breath-08.png 75
32 16 16 loading-breath-09.png 75
32 16 16 loading-breath-10.png 75
32 16 16 loading-breath-11.png 75
32 16 16 loading-breath-12.png 75
32 16 16 loading-breath-13.png 75
32 16 16 loading-breath-14.png 75
32 16 16 loading-breath-15.png 75
EOF

# Rotating animation (smooth)
cat > "loading-rotate.cursor" << EOF
32 16 16 loading-rotate-00.png 60
32 16 16 loading-rotate-01.png 60
32 16 16 loading-rotate-02.png 60
32 16 16 loading-rotate-03.png 60
32 16 16 loading-rotate-04.png 60
32 16 16 loading-rotate-05.png 60
32 16 16 loading-rotate-06.png 60
32 16 16 loading-rotate-07.png 60
32 16 16 loading-rotate-08.png 60
32 16 16 loading-rotate-09.png 60
32 16 16 loading-rotate-10.png 60
32 16 16 loading-rotate-11.png 60
32 16 16 loading-rotate-12.png 60
32 16 16 loading-rotate-13.png 60
32 16 16 loading-rotate-14.png 60
32 16 16 loading-rotate-15.png 60
32 16 16 loading-rotate-16.png 60
32 16 16 loading-rotate-17.png 60
32 16 16 loading-rotate-18.png 60
32 16 16 loading-rotate-19.png 60
32 16 16 loading-rotate-20.png 60
32 16 16 loading-rotate-21.png 60
32 16 16 loading-rotate-22.png 60
32 16 16 loading-rotate-23.png 60
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
Comment=Minimal hexagonal cursor with soft breathing and rotating animations
Example=default
EOF

cat > "$HOME/.icons/$CURSOR_NAME/README.md" << 'EOFREADME'
# Stalker-Hex-Minimal Cursor Theme

Minimalist hexagonal cursor design with two soft animations:

## Animations:
1. **Breathing** (watch) - Gentle pulsing hexagon (16 frames, 75ms)
2. **Rotating** (wait) - Smooth rotating hexagon (24 frames, 60ms)

## Design:
- Minimal hexagon outlines (2px)
- Soft transparency and glow effects
- Thin lines and subtle arrows
- STALKER green color palette
- Very clean and unobtrusive

## Apply:
```bash
gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex-Minimal'
```
EOFREADME

echo ""
echo "========================================================="
echo "  MINIMAL HEXAGONAL CURSOR THEME CREATED!"
echo "========================================================="
echo ""
echo "Theme: Stalker-Hex-Minimal"
echo "Location: $HOME/.icons/$CURSOR_NAME/"
echo ""
echo "✨ Design Features:"
echo "  • Minimal hexagon outlines (thin 2px lines)"
echo "  • Soft transparency and glow effects"
echo "  • Clean, unobtrusive design"
echo "  • Small size for better visibility"
echo ""
echo "🎬 Two Soft Animations:"
echo "  1. Breathing (watch) - Gentle pulsing effect"
echo "     - 16 smooth frames"
echo "     - 75ms per frame (~1.2 second cycle)"
echo "     - Size pulses from 6px to 8px"
echo ""
echo "  2. Rotating (wait) - Smooth rotation"
echo "     - 24 ultra-smooth frames"
echo "     - 60ms per frame (~1.4 second cycle)"
echo "     - Slow hexagon rotation with indicator"
echo ""
echo "To apply:"
echo "  gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex-Minimal'"
echo ""
