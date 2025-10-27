# 🎮 STALKER Theme Project

A complete STALKER-inspired theme system for GNOME/Linux with muted blues, enhanced greens/reds, and atmospheric post-apocalyptic styling.

![Theme Status](https://img.shields.io/badge/Status-Active-success)
![GNOME](https://img.shields.io/badge/GNOME-40%2B-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## ✨ Features

- **🎨 Muted Blues**: All blue colors replaced with atmospheric gray-greens
- **💚 Enhanced Greens**: Vibrant STALKER greens that pop
- **❤️ Enhanced Reds**: Error/warning colors that stand out
- **🖱️ Bigger Cursors**: 25% larger with brighter grey and dark green center
- **📁 File Manager**: Complete Nautilus/Files theming
- **🎯 Icons**: 2400+ Papirus icons recolored

## 🚀 Quick Start

```bash
# Apply complete theme (one command!)
./apply_stalker_colors.sh
```

Then **log out and back in** to see all changes.

## 📦 What's Applied

### ✅ Currently Active
- **GTK Theme**: `STALKER-Theme` (file manager, applications)
- **Icon Theme**: `Papirus-Stalker` (muted blues, enhanced greens/reds)
- **Cursor Theme**: `STALKER-Cursors` (40x40px, brighter grey, dark green)
- **Shell Extension**: User theme enabled

### 🎨 Color Palette
- **Dark Green**: `#3a4d3e` - Backgrounds, inner circles
- **STALKER Green**: `#5f7060` - Primary UI elements
- **Light Green**: `#7a8a7d` - Hover states
- **Enhanced Green**: `#7f9080` - Success messages (pops!)
- **Enhanced Red**: `#b87a7a` - Errors, warnings (pops!)
- **Brighter Grey**: `rgb(180, 180, 185)` - Cursor outer rings
- **Beige**: `#c9c5b4` - Light backgrounds, text

## 📁 Project Structure

### Core Scripts
```
apply_stalker_colors.sh              # ⭐ MASTER SCRIPT - Run this!
├─ create_stalker_gtk_theme.sh       # Creates GTK/app theme
└─ mute_blues_enhance_greens_reds.sh # Processes icon colors

create_stalker_adwaita_cursors.sh    # Creates enhanced cursors
```

### Documentation
```
THEME_STATUS.md           # Complete guide (START HERE!)
STALKER_CURSOR_GUIDE.md   # Cursor details
STALKER_THEME_COLORS.md   # Color reference
```

### Utilities
```
extract_colors.py         # Extract colors from images
```

## 🎯 Individual Components

### GTK Theme (File Manager & Apps)
```bash
./create_stalker_gtk_theme.sh
```
- Mutes all blue UI elements → gray-greens
- Enhances green success messages
- Enhances red error messages
- Custom Nautilus styling

### Icon Theme
```bash
./mute_blues_enhance_greens_reds.sh
```
- Processes 2400+ Papirus SVG icons
- Replaces 60+ blue color codes
- Enhances greens and reds
- Takes 5-10 minutes

### Cursor Theme
```bash
./create_stalker_adwaita_cursors.sh
```
- 25% bigger (40x40 vs 32x32)
- Brighter grey outer ring
- STALKER dark green inner circle
- Complete Adwaita-style set
- Animated wait cursor

## ⚙️ Manual Configuration

### Apply Themes
```bash
# GTK theme
gsettings set org.gnome.desktop.interface gtk-theme 'STALKER-Theme'

# Icons
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Stalker'

# Cursors
gsettings set org.gnome.desktop.interface cursor-theme 'STALKER-Cursors'
```

### Verify Settings
```bash
# Check what's currently applied
gsettings get org.gnome.desktop.interface gtk-theme
gsettings get org.gnome.desktop.interface icon-theme
gsettings get org.gnome.desktop.interface cursor-theme
```

### Revert to Defaults
```bash
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
```

## 📍 File Locations

### Installed Themes
```
~/.themes/STALKER-Theme/              # GTK theme
~/.local/share/icons/Papirus-Stalker/ # Icon theme
~/.icons/STALKER-Cursors/             # Cursor theme
```

### Build Files
```
/tmp/stalker-cursor-build/            # Cursor generation (temporary)
```

## 🔧 Requirements

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

### Compatibility
- GNOME 40+
- Ubuntu 20.04+
- X11 and Wayland

## 🎨 Customization

### Change Cursor Size
```bash
# Bigger cursors for 4K displays
gsettings set org.gnome.desktop.interface cursor-size 32

# Reset to default
gsettings set org.gnome.desktop.interface cursor-size 24
```

### Modify Colors
Edit the scripts and change color constants:
- **GTK**: Edit CSS in `create_stalker_gtk_theme.sh`
- **Icons**: Edit color maps in `mute_blues_enhance_greens_reds.sh`
- **Cursors**: Edit Python color constants in `create_stalker_adwaita_cursors.sh`

### Extract New Colors
```bash
# From your own image
python3 extract_colors.py
```

## 🐛 Troubleshooting

### Changes Not Showing
```bash
# Log out and back in (recommended)
# Or restart GNOME Shell (X11 only):
# Alt+F2 → type 'r' → Enter
```

### Icons Not Updating
```bash
# Update icon cache
gtk-update-icon-cache -f -t ~/.local/share/icons/Papirus-Stalker

# Clear thumbnails
rm -rf ~/.cache/thumbnails/*
```

### Cursor Not Changing
```bash
# Verify installation
ls -la ~/.icons/STALKER-Cursors/cursors/

# Reapply
gsettings set org.gnome.desktop.interface cursor-theme 'STALKER-Cursors'

# Log out/in required for full effect
```

## 📖 Documentation

- **[THEME_STATUS.md](THEME_STATUS.md)** - Complete overview and guide
- **[STALKER_CURSOR_GUIDE.md](STALKER_CURSOR_GUIDE.md)** - Cursor theme details
- **[STALKER_THEME_COLORS.md](STALKER_THEME_COLORS.md)** - Color palette reference
- **[CLEANUP_ANALYSIS.md](CLEANUP_ANALYSIS.md)** - File organization info

## 🎯 Design Philosophy

### Atmosphere
- Post-apocalyptic industrial aesthetic
- Muted, atmospheric colors
- No distracting bright blues

### Visibility
- Important elements (greens/reds) pop
- Larger cursors for better visibility
- Clear visual hierarchy

### Consistency
- Unified STALKER color palette
- Same aesthetic across all elements
- Professional and cohesive

## 🌟 Credits

- **Base Icons**: Papirus Icon Theme
- **Cursor Style**: Inspired by GNOME Adwaita
- **Colors**: Extracted from STALKER game atmosphere
- **Theme**: Original creation (October 2025)

## 📜 License

MIT License - Feel free to modify and share!

## 🎮 Version

- **Version**: 1.0
- **Created**: October 2025
- **Last Updated**: October 2025

---

**Дoбpoгo пути, сталкер!** (Good hunting, stalker!)
