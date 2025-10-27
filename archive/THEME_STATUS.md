# STALKER THEME - Complete System Customization

## Overview
This repository contains a complete STALKER-themed customization suite for GNOME/Linux systems, featuring muted blues, enhanced greens and reds, and atmospheric post-apocalyptic styling.

## What's Been Applied

### ✅ 1. User Theme Extension
- **Status**: Enabled
- **Purpose**: Allows custom GNOME Shell themes
- **Command Used**: `gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com`

### ✅ 2. GTK Theme (Applications & File Manager)
- **Theme Name**: STALKER-Theme
- **Location**: `~/.themes/STALKER-Theme`
- **Features**:
  - All blues MUTED to gray-greens
  - Greens ENHANCED and vibrant
  - Reds ENHANCED to pop
  - Custom file manager (Nautilus) styling
  - Complete UI element theming

### ✅ 3. Icon Theme
- **Theme Name**: Papirus-Stalker
- **Location**: `~/.local/share/icons/Papirus-Stalker`
- **Modifications**:
  - 60+ blue colors replaced with gray-greens
  - Green icons enhanced to STALKER palette
  - Red icons boosted for visibility
  - Over 2400+ icons processed

### ✅ 4. Cursor Theme
- **Theme Name**: STALKER-Cursors
- **Location**: `~/.icons/STALKER-Cursors`
- **Features**:
  - **25% BIGGER** than standard (40x40 pixels)
  - **Brighter grey** outer ring (RGB: 180, 180, 185)
  - **STALKER dark green** inner circle (#3a4d3e)
  - Complete Adwaita-style cursor set
  - Animated wait/loading cursor
  - All cursor types (pointer, hand, text, resize, move, etc.)

## Color Palette

### Primary Colors
- **Brighter Grey**: RGB(180, 180, 185) - Cursor outer rings
- **STALKER Dark Green**: #3a4d3e - Inner circles, accents
- **STALKER Green**: #5f7060 - Primary UI elements
- **STALKER Light Green**: #7a8a7d - Hover states
- **Enhanced Green**: #7f9080 - Success, positive elements
- **Enhanced Red**: #b87a7a - Errors, warnings (bright)
- **Muted Red**: #8b5a5a - Destructive actions
- **Background Dark**: #1e2920 - Terminal, dark areas
- **Background Medium**: #3a4d3e - Panels, sidebars
- **Beige/Cream**: #c9c5b4 - Light backgrounds, text

### Blue Muting Strategy
All blue tones replaced with:
- Bright blues → Gray-greens (#7a8a7d, #9ca69a)
- Medium blues → STALKER greens (#5f7060, #6a7a6d)
- Dark blues → Dark greens (#3a4d3e, #2a3a2e)

## Scripts Available

### Main Application Script
```bash
./apply_stalker_colors.sh
```
**Master script** that applies everything:
1. Creates GTK theme
2. Modifies icon colors
3. Applies both themes

### Individual Component Scripts

#### GTK Theme Creation
```bash
./create_stalker_gtk_theme.sh
```
Creates the application and file manager theme.

#### Icon Color Modification
```bash
./mute_blues_enhance_greens_reds.sh
```
Processes Papirus icons to apply STALKER colors.

#### Cursor Theme Creation
```bash
./create_stalker_adwaita_cursors.sh
```
Generates enhanced STALKER cursors (25% bigger, brighter grey, dark green center).

### Legacy Scripts (Also Available)
- `aggressive_blue_removal.sh` - Original blue removal script
- `create_stalker_icons.sh` - Icon theme creator
- `create_hex_cursors.sh` - Hexagonal cursor design
- `create_minimal_hex_cursors.sh` - Minimal hex cursors
- `quick_folder_colors.sh` - Quick folder color changer

## Current Theme Settings

### Applied Settings
```bash
# GTK Theme
gsettings set org.gnome.desktop.interface gtk-theme 'STALKER-Theme'
gsettings set org.gnome.desktop.wm.preferences theme 'STALKER-Theme'

# Icon Theme  
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Stalker'

# Cursor Theme
gsettings set org.gnome.desktop.interface cursor-theme 'STALKER-Cursors'
```

### Verify Current Settings
```bash
gsettings get org.gnome.desktop.interface gtk-theme
gsettings get org.gnome.desktop.interface icon-theme
gsettings get org.gnome.desktop.interface cursor-theme
```

## File Locations

### Themes
- **GTK**: `~/.themes/STALKER-Theme/`
  - `gtk-3.0/gtk.css` - GTK3 styling
  - `gtk-4.0/gtk.css` - GTK4 styling
  - `index.theme` - Theme metadata

### Icons
- **Icons**: `~/.local/share/icons/Papirus-Stalker/`
  - Complete icon set with STALKER colors
  - All SVG icons modified

### Cursors
- **Cursors**: `~/.icons/STALKER-Cursors/`
  - `cursors/` - Binary cursor files
  - `index.theme` - Cursor theme metadata

## Features Breakdown

### File Manager (Nautilus)
✅ Sidebar with STALKER colors
✅ Muted blue selections → green highlights
✅ Enhanced green/red folder indicators
✅ Dark theme support
✅ Custom list and icon view styling

### Application Windows
✅ Buttons with STALKER colors
✅ No blue focus indicators (replaced with green)
✅ Green switches and checkboxes
✅ Red error messages that pop
✅ Green success messages that pop
✅ Muted link colors (no blue links)

### Cursors
✅ 11 cursor types + variations
✅ 25% larger for better visibility
✅ Brighter grey for contrast
✅ STALKER green center
✅ Animated loading cursor
✅ Complete alias support

## Customization

### Change Cursor Size
```bash
# Make cursors even bigger for 4K displays
gsettings set org.gnome.desktop.interface cursor-size 32
```

### Revert to Defaults
```bash
# Revert GTK theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'

# Revert icons
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'

# Revert cursors
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
```

### Modify Colors
Edit the Python scripts in each creator:
- GTK: Edit `create_stalker_gtk_theme.sh` CSS sections
- Icons: Edit color maps in `mute_blues_enhance_greens_reds.sh`
- Cursors: Edit color constants in `create_stalker_adwaita_cursors.sh`

## Troubleshooting

### Changes Not Appearing
```bash
# Log out and back in
# Or restart GNOME Shell (Alt+F2, type 'r', Enter - X11 only)

# For Wayland, log out/in is required
```

### Icons Not Updating
```bash
# Update icon cache
gtk-update-icon-cache -f -t ~/.local/share/icons/Papirus-Stalker
```

### Cursor Not Changing
```bash
# Verify cursor theme is set
gsettings get org.gnome.desktop.interface cursor-theme

# Check cursor files exist
ls -la ~/.icons/STALKER-Cursors/cursors/

# May need to log out/in
```

### File Manager Still Has Blue
The icons might take time to update. Try:
1. Close and reopen file manager
2. Clear thumbnail cache: `rm -rf ~/.cache/thumbnails/*`
3. Log out and back in

## Dependencies

### Required Packages
```bash
sudo apt install -y \
    gnome-tweaks \
    papirus-icon-theme \
    python3 \
    python3-pil \
    imagemagick \
    xcursorgen \
    x11-apps
```

### Optional Tools
- `gnome-shell-extensions` - For user theme support
- `dconf-editor` - For advanced settings

## Documentation Files

- `README.md` - This file
- `STALKER_THEME_COLORS.md` - Color palette reference
- `STALKER_THEME_COMPLETE_GUIDE.md` - Comprehensive theme guide
- `STALKER_CURSOR_GUIDE.md` - Cursor theme details
- `CURSOR_THEME_GUIDE.md` - General cursor information

## Design Philosophy

### Atmosphere
- Post-apocalyptic industrial aesthetic
- Muted, atmospheric colors
- High contrast where needed
- No distracting bright blues

### Visibility
- Important elements (greens/reds) pop
- Cursors are larger and more visible
- Clear visual hierarchy
- Excellent readability

### Consistency
- Unified color palette across all elements
- STALKER green appears throughout (icons, cursors, UI)
- Same muted aesthetic everywhere
- Professional and cohesive

## Performance Notes

- Icon modification is slow (2400+ files) - be patient
- GTK theme applies instantly
- Cursor generation is fast (~2 seconds)
- No runtime performance impact

## Credits

- **Base Icons**: Papirus Icon Theme
- **Cursor Style**: Inspired by GNOME Adwaita
- **Color Palette**: Extracted from STALKER game atmosphere
- **Theme**: Original creation based on STALKER aesthetic

## Version
- Created: October 2025
- Version: 1.0
- Compatible with: GNOME 40+, Ubuntu 20.04+

## Quick Start

To apply the complete STALKER theme:

```bash
cd ~/Music/evryscript\ but\ shit/STALKER-Theme-Project
./apply_stalker_colors.sh
```

Then log out and back in to see all changes!

---

**Enjoy your STALKER-themed desktop! Дoбpoгo пути, сталкер!**
