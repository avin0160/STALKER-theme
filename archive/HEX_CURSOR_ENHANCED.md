# STALKER Hex-Minimal Cursor - Enhanced Version

## 🎉 Changes Applied

### ✨ Enhancements Made

1. **UPSCALED to 48x48 pixels**
   - Was: 32x32 pixels
   - Now: 48x48 pixels (1.5x bigger)
   - Better visibility on all displays

2. **GREEN CENTER CIRCLES**
   - Added to: pointer, text, crosshair, move, and all animated cursors
   - Solid green color: `#5f7060` (STALKER green)
   - Radius: 3-4 pixels
   - Helps identify cursor center point

3. **NO Green Circle on Clickables**
   - Hand/pointing cursor: Uses subtle accent dot instead
   - Maintains clean clickable indicator

4. **ANIMATED Resize Cursors** (NEW!)
   - All 4 resize directions now animated
   - 12 frames each (was static)
   - 70ms per frame
   - Effects:
     - Hexagon pulses (grows/shrinks)
     - Arrows flow in/out
     - Connecting line opacity changes
     - Green center circle pulses

## 📊 Cursor Statistics

### Generated Files
- **Static cursors**: 5 (pointer, hand, text, crosshair, move)
- **Resize animations**: 48 frames (4 directions × 12 frames)
- **Breathing animation**: 16 frames
- **Rotating animation**: 24 frames
- **Total PNG images**: 93 files

### Cursor Files Installed
- **Binary cursors**: 11 main cursor files
- **Symlinks**: 26 aliases for compatibility
- **Total in ~/.icons/Stalker-Hex-Minimal/cursors/**: 37 files

## 🎬 Animations

### 1. Resize Cursors (NEW!)
- **Frames**: 12
- **Speed**: 70ms per frame
- **Duration**: ~840ms per cycle
- **Types**: 
  - `size_fdiag` - Diagonal NW-SE
  - `size_bdiag` - Diagonal NE-SW
  - `size_hor` - Horizontal
  - `size_ver` - Vertical
- **Effects**:
  - Center hexagon pulses
  - Arrows move in and out
  - Line opacity changes
  - Green center pulses

### 2. Breathing Animation (watch)
- **Frames**: 16
- **Speed**: 75ms per frame
- **Duration**: ~1.2 seconds per cycle
- **Effect**: Gentle pulsing hexagon with green center

### 3. Rotating Animation (wait)
- **Frames**: 24
- **Speed**: 60ms per frame
- **Duration**: ~1.4 seconds per cycle
- **Effect**: Smooth hexagon rotation with indicator dot

## 🎨 Design Specifications

### Size
- **Base**: 48×48 pixels
- **Hotspots**: Centered at 24,24 (or appropriate corner)

### Colors
```python
STALKER_PRIMARY = (95, 112, 96, 200)      # Hexagon outline
STALKER_ACCENT = (122, 138, 125, 180)     # Secondary elements
STALKER_GREEN_CENTER = (95, 112, 96, 255) # Solid green center
STALKER_DARK = (58, 77, 62, 220)          # Shadow/dark outline
```

### Hexagon
- **Size**: 7-10 pixels radius (varies by cursor)
- **Line width**: 2-3 pixels
- **Style**: Outline only (not filled)

### Green Center Circle
- **Radius**: 3-4 pixels
- **Color**: Solid STALKER green
- **Applied to**: All cursors except hand/clickable

## 📁 File Locations

### Installed Theme
```
~/.icons/Stalker-Hex-Minimal/
├── cursors/
│   ├── left_ptr              (pointer with green center)
│   ├── hand2                 (clickable, no green center)
│   ├── xterm                 (text with green center)
│   ├── crosshair             (crosshair with green center)
│   ├── fleur                 (move with green center)
│   ├── size_fdiag            (animated resize NW-SE)
│   ├── size_bdiag            (animated resize NE-SW)
│   ├── size_hor              (animated resize horizontal)
│   ├── size_ver              (animated resize vertical)
│   ├── watch                 (breathing animation)
│   ├── wait                  (rotating animation)
│   └── [26 symlink aliases]
└── index.theme
```

### Source Images
```
/tmp/stalker-cursor-minimal/
├── pointer.png               (48x48)
├── hand.png                  (48x48, no green center)
├── text.png                  (48x48)
├── crosshair.png             (48x48)
├── move.png                  (48x48)
├── resize-nw-se-00.png       (first frame)
├── resize-nw-se-01.png       ...
├── ...                       (48 resize frames total)
├── loading-breath-00.png     (16 frames)
└── loading-rotate-00.png     (24 frames)
```

## 🚀 Usage

### Already Applied
If you had `Stalker-Hex-Minimal` set before, the changes are automatically active!

### Manual Application
```bash
gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex-Minimal'
```

### Verify
```bash
gsettings get org.gnome.desktop.interface cursor-theme
# Should output: 'Stalker-Hex-Minimal'
```

## 🔄 Regenerate Cursors

To regenerate with modifications:

```bash
cd ~/Music/evryscript\ but\ shit/STALKER-Theme-Project
./update_hex_minimal_cursors.sh
```

Edit the script to change:
- Colors (at top of Python section)
- Size (change `SIZE = 48`)
- Animation speeds (frame delays in cursor configs)
- Green circle radius (in `draw_center_circle()`)

## 🎯 Comparison: Before vs After

| Feature | Before | After |
|---------|--------|-------|
| **Size** | 32×32 | 48×48 (50% bigger) |
| **Green Center** | No | Yes (except hand) |
| **Resize Animation** | Static | Animated (12 frames) |
| **Breathing** | 16 frames | 16 frames (same) |
| **Rotating** | 24 frames | 24 frames (same) |
| **Total Frames** | 40 | 93 |

## ✅ Testing Checklist

- [x] Cursors generated without errors
- [x] All 93 PNG files created
- [x] X11 cursor files built successfully
- [x] Theme applied automatically
- [x] Green circles visible on most cursors
- [x] No green circle on hand cursor
- [x] Resize animations working
- [x] Breathing animation intact
- [x] Rotating animation intact

## 🐛 Troubleshooting

### Cursor Not Updating
```bash
# Reload cursor cache
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex-Minimal'
```

### Can't See Green Circles
- Green circles are small (3-4px)
- Look at the exact center of the hexagon
- More visible on darker backgrounds
- Hand cursor intentionally has NO green circle

### Animations Not Smooth
- Animations require compositor (enabled by default)
- May appear choppy on slow systems
- Wayland vs X11 may affect smoothness

## 📝 Notes

- Original minimal hex cursors archived
- New version overwrites previous installation
- All changes are reversible by running original script from archive
- Green circles enhance center identification
- Animated resizes add polish and feedback

## 🎮 Version

- **Version**: 2.0 (Enhanced)
- **Created**: October 27, 2025
- **Original**: Stalker-Hex-Minimal v1.0
- **Base Size**: 48×48 pixels
- **Total Animations**: 52 frames (12×4 resize + 16 breathing + 24 rotating)

---

**Your enhanced STALKER hex cursor theme is now active!** 🎉

Move your cursor around to see:
- Green center dots
- Animated resize cursors
- Smooth breathing/rotating wait animations
