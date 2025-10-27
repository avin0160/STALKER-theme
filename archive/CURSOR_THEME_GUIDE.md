# STALKER Hexagonal Cursor Theme

## 🎯 Overview

The **Stalker-Hex** cursor theme features industrial, mechanical hexagonal nut designs inspired by your provided image. All cursors use the STALKER color palette with atmospheric greens and grays.

## 🎨 Design Features

### Visual Style
- **Hexagonal base** - Industrial nut/bolt aesthetic
- **Inner circle** - White center hole like a real nut
- **6 bolt details** - Small dots around hexagon perimeter
- **STALKER colors** - Muted greens, grays, and beige
- **Shadow effects** - Subtle depth and dimension

### Color Palette Used
- **Primary**: `#5f7060` - Muted green (hexagon body)
- **Accent**: `#7a8a7d` - Light green-gray (arrows, indicators)
- **Dark**: `#3a4d3e` - Dark green (outlines, shadows)
- **Light**: `#c9c5b4` - Beige (highlights)
- **White**: `#ffffff` - Inner circle

## 📋 Cursor Types Created

### 1. **Default Pointer** (`left_ptr`)
- Hexagonal shape with 6 bolt details
- White inner circle
- Shadow effect for depth
- Used for: Normal desktop pointing

### 2. **Arrow Pointer** (`pointer`)
- Small hexagon with extending arrow
- Clean directional indicator
- Used for: Precise pointing

### 3. **Hand/Link Pointer** (`hand2`)
- Hexagon with pointing indicator
- Accent color highlight
- Used for: Hovering over links and buttons
- Animations: None (static)

### 4. **Text Cursor** (`xterm`)
- I-beam shape with hexagonal ends
- Top and bottom hexagons connected by vertical line
- Used for: Text selection and editing
- Animations: None (static)

### 5. **Crosshair** (`crosshair`)
- Central small hexagon
- Four directional lines extending outward
- Hollow center for precision
- Used for: Graphic design, games, precise selection
- Animations: None (static)

### 6. **Move Cursor** (`fleur`)
- Large central hexagon
- Four arrows pointing in cardinal directions
- Used for: Moving windows, dragging objects
- Animations: None (static)

### 7. **Resize Cursors** (4 types)
- **NW-SE Diagonal** (`size_fdiag`): Top-left to bottom-right
- **NE-SW Diagonal** (`size_bdiag`): Top-right to bottom-left  
- **Horizontal** (`size_hor`): Left-right resizing
- **Vertical** (`size_ver`): Up-down resizing
- Each has hexagon center with directional arrows
- Used for: Window and element resizing
- Animations: None (static)

### 8. **Loading/Wait** (`watch`) ⭐ **ANIMATED**
- **8-frame animation** rotating indicator
- Hexagon with orbiting indicator dot
- Indicator rotates around hexagon
- Frame duration: 50ms per frame
- Total animation: ~400ms loop
- Used for: System busy, processing
- **This is your animated cursor!**

## 🎬 Animation Details

### Loading Cursor Animation
The loading cursor features a smooth 8-frame animation:

```
Frame 0: Indicator at 0°   (top)
Frame 1: Indicator at 45°  (rotating clockwise)
Frame 2: Indicator at 90°  (right)
Frame 3: Indicator at 135°
Frame 4: Indicator at 180° (bottom)
Frame 5: Indicator at 225°
Frame 6: Indicator at 270° (left)
Frame 7: Indicator at 315°
[Loop back to Frame 0]
```

- **Smooth rotation**: Each frame advances 45 degrees
- **Timing**: 50 milliseconds per frame
- **Visual**: Small accent-colored dot orbits the hexagon
- **Effect**: Gives industrial "working" appearance

## 📁 Installation Location

```
~/.icons/Stalker-Hex/
├── index.theme          # Theme metadata
├── install.sh           # Quick install script
└── cursors/
    ├── default          # Default cursor
    ├── left_ptr         # Standard pointer
    ├── hand2            # Hand/link
    ├── xterm            # Text cursor
    ├── crosshair        # Crosshair
    ├── fleur            # Move (4-way)
    ├── size_fdiag       # Diagonal resize NW-SE
    ├── size_bdiag       # Diagonal resize NE-SW
    ├── size_hor         # Horizontal resize
    ├── size_ver         # Vertical resize
    ├── watch            # Loading ANIMATED ⭐
    └── [various aliases and symlinks]
```

## 🚀 How to Use

### Already Applied!
The cursor theme has been applied to your system:
```bash
gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex'
gsettings set org.gnome.desktop.interface cursor-size 32
```

### Manual Application
If needed, you can reapply:
```bash
~/.icons/Stalker-Hex/install.sh
```

Or use GNOME Tweaks:
1. Open `gnome-tweaks`
2. Go to **Appearance**
3. Select **Stalker-Hex** under Cursor theme

### Preview Cursors
To see all cursor types:
```bash
gnome-tweaks
```
Navigate to Appearance → Cursor to preview different cursor states.

## 🎮 Testing the Cursors

### See the Loading Animation
1. Open a terminal
2. Run a long command: `sleep 10`
3. Watch the cursor change to the animated loading hexagon!

### Test Different Cursor Types
- **Normal cursor**: Desktop/file manager
- **Hand cursor**: Hover over links in browser
- **Text cursor**: Click in any text field
- **Move cursor**: Click and drag a window titlebar
- **Resize cursors**: Hover over window edges/corners
- **Loading cursor**: Wait for programs to load

## 🔧 Customization

### Source Files
PNG source images are in:
```
/tmp/stalker-cursor-source/
```

You can:
1. Edit `generate_cursors.py` to change designs
2. Modify colors in the Python script
3. Add more animation frames
4. Create new cursor types

### Regenerate Cursors
```bash
./create_hex_cursors.sh
```

### Change Size
```bash
# Make cursors larger
gsettings set org.gnome.desktop.interface cursor-size 48

# Make cursors smaller
gsettings set org.gnome.desktop.interface cursor-size 24

# Default size
gsettings set org.gnome.desktop.interface cursor-size 32
```

## 🎨 Color Modifications

To change cursor colors, edit the Python script:
```python
# In /tmp/stalker-cursor-source/generate_cursors.py
STALKER_PRIMARY = (95, 112, 96)      # Change hexagon color
STALKER_ACCENT = (122, 138, 125)     # Change accent/arrows
STALKER_DARK = (58, 77, 62)          # Change outlines
```

Then regenerate:
```bash
python3 /tmp/stalker-cursor-source/generate_cursors.py
cd /tmp/stalker-cursor-source
for cursor in *.cursor; do 
    xcursorgen "$cursor" "$HOME/.icons/Stalker-Hex/cursors/$(basename $cursor .cursor)"
done
```

## 📊 Technical Specifications

| Property | Value |
|----------|-------|
| **Format** | X11 Cursor |
| **Base Size** | 32x32 pixels |
| **Color Depth** | RGBA (32-bit with alpha) |
| **Animation Frames** | 8 (loading only) |
| **Frame Delay** | 50ms |
| **Hotspot** | 16,16 (center) for most cursors |

## ✨ Features Summary

✅ **10+ cursor types** - All common cursor states covered
✅ **1 animated cursor** - Smooth 8-frame loading animation
✅ **STALKER themed** - Matches your complete theme
✅ **Hexagonal design** - Industrial, mechanical aesthetic
✅ **High quality** - Crisp PNG-based rendering
✅ **Fully functional** - Works with all GTK/GNOME apps
✅ **Easy to customize** - Python-based generation
✅ **Symbolic links** - Compatible with various cursor names

## 🔄 Reverting to Default

To go back to the default cursor:
```bash
gsettings reset org.gnome.desktop.interface cursor-theme
gsettings reset org.gnome.desktop.interface cursor-size
```

## 📦 Complete STALKER Theme Stack

Your system now has:
1. ✅ **GTK Theme** - Stalker-GTK (green UI elements)
2. ✅ **GNOME Shell Theme** - Stalker-Shell (green Quick Settings)
3. ✅ **Icon Theme** - Papirus-Stalker (4,511 green icons)
4. ✅ **Terminal Colors** - STALKER palette
5. ✅ **Cursor Theme** - Stalker-Hex (hexagonal with animation) ⭐ NEW!

## 🎯 Next Steps

- Move your cursor around to see different cursor types
- Trigger loading operations to see the animated cursor
- Use `gnome-tweaks` to explore cursor options
- Try different cursor sizes with gsettings

---

**Good hunting, Stalker!** 🔩🌲

*Hexagonal cursor theme created: October 27, 2025*
