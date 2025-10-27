# STALKER Theme Project

A complete Debian/GNOME theming system inspired by the atmospheric colors from the STALKER game series.

## 📁 Project Structure

### Installation Scripts
- `install_complete_stalker_theme.sh` - Main installation script for complete theme
- `install_stalker_theme.sh` - Basic theme installation

### Icon Theme
- `create_stalker_icons.sh` - Initial icon recoloring script
- `create_advanced_icons.sh` - Advanced icon theme creation
- `aggressive_blue_removal.sh` - Remove all blue colors from icons (39 shades)
- `remove_rgb_blues.sh` - RGB-based blue removal
- `quick_folder_colors.sh` - Quick folder color updates

### System UI
- `create_system_ui_theme.sh` - GTK 3/4 and GNOME Shell themes
- Targets Quick Settings, panels, switches, sliders

### Cursor Themes
- `create_hex_cursors.sh` - Original hexagonal cursor theme
- `create_minimal_hex_cursors.sh` - Minimal cursor with soft animations

### Documentation
- `STALKER_THEME_COMPLETE_GUIDE.md` - Complete theming guide
- `STALKER_THEME_COLORS.md` - Color palette reference
- `CURSOR_THEME_GUIDE.md` - Cursor theme documentation
- `extract_colors.py` - Python script to extract colors from image

### Assets
- `download (1).jpg` - Original STALKER reference image

## 🎨 Color Palette

- **Primary**: #5f7060 (muted green)
- **Accent**: #7a8a7d (light green-gray)
- **Dark**: #3a4d3e (dark green)
- **Purple**: #6b5f7b (muted purple)
- **Light**: #c9c5b4 (beige/cream)
- **Background**: #1e2920 (very dark green)

## 📦 Installed Components

### Active Themes
- **GTK Theme**: `~/.themes/Stalker-GTK/`
- **GNOME Shell Theme**: `~/.themes/Stalker-Shell/`
- **Icon Theme**: `~/.local/share/icons/Papirus-Stalker/` (4,511 icons)
- **Cursor Themes**: 
  - `~/.icons/Stalker-Hex/` (original with bold colors)
  - `~/.icons/Stalker-Hex-Minimal/` (minimal with soft animations)

## 🚀 Quick Apply

```bash
# Apply GTK theme
gsettings set org.gnome.desktop.interface gtk-theme 'Stalker-GTK'

# Apply icon theme
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Stalker'

# Apply cursor theme (choose one)
gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex'
# OR
gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex-Minimal'
gsettings set org.gnome.desktop.interface cursor-size 32

# Apply GNOME Shell theme (requires User Themes extension)
gsettings set org.gnome.shell.extensions.user-theme name 'Stalker-Shell'
```

## 🛠️ Dependencies

- Python 3 with PIL/Pillow
- imagemagick
- inkscape
- x11-apps (xcursorgen)
- papirus-icon-theme
- gnome-tweaks
- gnome-shell-extension-user-theme

## 📝 Notes

- All icons processed: 4,511 SVG files recolored
- Blue shades removed: 39 different shades
- Cursor animations: Breathing (16 frames), Rotating (24 frames)
- Theme supports both GTK 3 and GTK 4 applications

## 🎯 Current Status

 Complete theme system installed and active
 All blue colors removed from icons
 System UI themed (Quick Settings, panels, etc.)
 Two cursor variants available
 Terminal color scheme applied

Created: October 2025
