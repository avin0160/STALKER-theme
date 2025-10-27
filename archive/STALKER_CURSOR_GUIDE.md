# STALKER Cursor Theme - Complete Guide

## Overview
Custom STALKER-themed cursor set with enhanced visibility and atmospheric styling.

## Specifications

### Size
- **Base Size**: 40x40 pixels (25% larger than standard 32x32)
- Improved visibility without being obtrusive
- Scaled proportionally for all cursor types

### Colors

#### Outer Ring
- **Brighter Grey**: RGB(180, 180, 185)
- Highly visible against both dark and light backgrounds
- Maintains STALKER's muted, industrial aesthetic

#### Inner Circle
- **STALKER Dark Green**: RGB(58, 77, 62) / #3a4d3e
- Signature STALKER color from the atmospheric palette
- Provides clear visual contrast with outer ring

#### Accents
- **STALKER Green**: RGB(95, 112, 96) / #5f7060
- Used for borders and highlights
- **Medium Grey**: RGB(140, 145, 140) - For secondary elements
- **Dark Grey**: RGB(80, 85, 80) - For shadows

## Cursor Types Included

### Basic Cursors
1. **Default Pointer** - Arrow cursor with STALKER styling
   - Grey outer border
   - Dark green inner accent stripe
   - Enhanced visibility with soft shadow

2. **Hand/Pointing** - Link and clickable element cursor
   - Simplified hand shape
   - Green accent on fingertip
   - Clear pointing indication

3. **Text Selection (I-beam)** - Text editing cursor
   - Vertical bar with top/bottom caps
   - Green center accent dot
   - Precise text positioning

### Precision Cursors
4. **Crosshair** - Precision selection cursor
   - Four-way crosshair design
   - Dark green center circle
   - Gap in center for clear target visibility

5. **Move/Grab** - Drag and move cursor
   - Four arrows pointing outward
   - Dark green center circle
   - Clear directional indicators

### Resize Cursors
6. **Vertical Resize** - Up/down sizing
7. **Horizontal Resize** - Left/right sizing
8. **Forward Diagonal Resize** - NW-SE sizing
9. **Backward Diagonal Resize** - NE-SW sizing

All resize cursors feature:
- Double-headed arrows
- Green center accent
- Clear directional indication

### Status Cursors
10. **Wait/Loading** - Animated waiting indicator
    - Circular design with rotating segment
    - 8-frame animation
    - Smooth rotation effect

11. **Not Allowed** - Forbidden/disabled action
    - Circle with diagonal prohibition line
    - Clear visual "stop" indication

## Installation Location
```
~/.icons/STALKER-Cursors/
├── cursors/          # Binary cursor files
│   ├── default
│   ├── pointer
│   ├── text
│   ├── crosshair
│   ├── move
│   ├── wait
│   ├── not-allowed
│   ├── size_ver
│   ├── size_hor
│   ├── size_fdiag
│   ├── size_bdiag
│   └── [various symlinks]
└── index.theme       # Theme metadata
```

## Cursor Name Aliases
The theme includes proper symlinks for compatibility:

### Default Pointer
- `left_ptr`, `arrow`, `top_left_arrow`

### Hand/Pointer
- `hand`, `hand1`, `hand2`, `pointing_hand`

### Text
- `xterm`, `ibeam`

### Wait
- `watch`, `left_ptr_watch`

### Not Allowed
- `forbidden`, `crossed_circle`

### Move
- `fleur`, `all-scroll`

### Resize
- Vertical: `v_double_arrow`, `sb_v_double_arrow`, `split_v`, `col-resize`
- Horizontal: `h_double_arrow`, `sb_h_double_arrow`, `split_h`, `row-resize`
- Diagonal: `fd_double_arrow`, `bd_double_arrow`, `nwse-resize`, `nesw-resize`

## Applying the Theme

### Method 1: GNOME Tweaks
1. Open **GNOME Tweaks**
2. Go to **Appearance** section
3. Click on **Cursor** dropdown
4. Select **STALKER Cursors**

### Method 2: Command Line
```bash
gsettings set org.gnome.desktop.interface cursor-theme 'STALKER-Cursors'
```

### Method 3: Settings (GNOME 40+)
1. Open **Settings**
2. Go to **Appearance**
3. Select **STALKER Cursors** from cursor options

## Regenerating Cursors

To rebuild the cursor theme with modifications:

```bash
cd ~/Music/evryscript\ but\ shit/STALKER-Theme-Project
./create_stalker_adwaita_cursors.sh
```

The script will:
1. Generate all cursor images (40x40 PNG files)
2. Create X11 cursor configuration files
3. Build binary cursor files
4. Create proper symlinks
5. Apply the theme

## Design Philosophy

### Visibility
- 25% larger size ensures cursors are easy to locate
- Brighter grey outer ring provides contrast on all backgrounds
- Soft shadows enhance depth and visibility

### Atmosphere
- STALKER dark green inner circle ties to game aesthetic
- Industrial, mechanical feel matches STALKER's atmosphere
- Muted color palette avoids distracting brightness

### Functionality
- Complete cursor set covers all use cases
- Proper hotspot positioning for accuracy
- Smooth animations for loading states
- Clear visual communication of cursor function

## Color Harmony with Theme

The cursor colors are carefully selected to complement the full STALKER theme:

- **Matches**: File manager dark green accents (#3a4d3e)
- **Contrasts**: Provides visibility against all theme backgrounds
- **Complements**: Works with both light and dark theme variants
- **Consistent**: Uses the same core STALKER color palette

## Technical Details

### Image Format
- PNG with alpha channel (RGBA)
- 40x40 pixels base size
- Anti-aliased edges for smoothness

### Hotspot Positions
- **Default**: (2, 2) - Top-left point
- **Hand**: (10, 10) - Finger pointing position
- **Text**: (20, 20) - Center of I-beam
- **Crosshair**: (20, 20) - Center point
- **Move**: (20, 20) - Center of cross
- **Resize**: (20, 20) - Center of arrow line

### Animation
- **Wait cursor**: 8 frames, 50ms per frame
- Total animation time: 400ms per rotation
- Smooth, continuous loop

## Troubleshooting

### Cursors not showing
```bash
# Update cursor cache
sudo update-icon-caches ~/.icons/STALKER-Cursors
```

### Theme not appearing in list
```bash
# Check theme directory exists
ls -la ~/.icons/STALKER-Cursors/

# Verify index.theme file
cat ~/.icons/STALKER-Cursors/index.theme
```

### Reverting to default
```bash
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
```

### Cursor appears too small on HiDPI
The 25% size increase helps, but for 4K displays you may want to:
```bash
gsettings set org.gnome.desktop.interface cursor-size 32
```

## Customization

To modify cursor appearance:

1. Edit `create_stalker_adwaita_cursors.py` in the script
2. Change color constants at the top:
   - `GREY_BRIGHT` - Outer ring color
   - `STALKER_DARK_GREEN` - Inner circle color
   - `SIZE_MULTIPLIER` - Overall size (currently 1.25)

3. Regenerate cursors:
   ```bash
   ./create_stalker_adwaita_cursors.sh
   ```

## Credits

- **Style**: Inspired by GNOME Adwaita cursor theme
- **Colors**: Extracted from STALKER game atmosphere
- **Design**: Industrial, post-apocalyptic aesthetic
- **Size**: Enhanced for modern high-resolution displays

## Version
- Version: 1.0
- Created: October 2025
- Compatibility: GNOME 3.36+, X11 and Wayland
