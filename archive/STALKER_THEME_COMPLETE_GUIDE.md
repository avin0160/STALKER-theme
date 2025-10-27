# STALKER THEME - COMPLETE INSTALLATION GUIDE

## 🎨 What Has Been Changed

Your entire Debian system now uses the STALKER color palette from the atmospheric image:

### System UI Elements (GNOME Shell & GTK)
- ✅ **Quick Settings Panel** - WiFi, Bluetooth, Dark Mode buttons → STALKER green
- ✅ **Sliders** - Volume, brightness sliders → STALKER green fill
- ✅ **Toggle Switches** - All system toggles → STALKER green when active
- ✅ **Progress Bars** - System progress indicators → STALKER green
- ✅ **Selected Items** - Highlighted menu items, list selections → STALKER green
- ✅ **Links** - Hyperlinks → STALKER green-gray
- ✅ **Buttons** - Active and suggested action buttons → STALKER green
- ✅ **Checkboxes & Radio Buttons** - Selected states → STALKER green

### Icons
- ✅ **All 4,511 Icons** - Blue colors replaced with STALKER green
- ✅ **Folder Icons** - Muted STALKER green (#5f7060)
- ✅ **Application Icons** - Blues converted to atmospheric greens
- ✅ **System Icons** - Symbolic icons recolored

### Terminal
- ✅ **Background** - Dark green-gray (#1e2920)
- ✅ **Foreground** - Beige/cream text (#c9c5b4)
- ✅ **16-Color Palette** - Complete STALKER-themed palette

## 🎯 Color Palette Reference

### Primary Colors
| Purpose | Hex Code | RGB | Usage |
|---------|----------|-----|-------|
| **Primary Green** | `#5f7060` | rgb(95, 112, 96) | Main accent, buttons, toggles |
| **Accent Green** | `#7a8a7d` | rgb(122, 138, 125) | Secondary elements, highlights |
| **Dark Green** | `#3a4d3e` | rgb(58, 77, 62) | Dark UI elements, borders |
| **Muted Purple** | `#6b5f7b` | rgb(107, 95, 123) | Special accents |
| **Beige/Cream** | `#c9c5b4` | rgb(201, 197, 180) | Text, light elements |
| **Very Dark** | `#1e2920` | rgb(30, 41, 32) | Backgrounds, terminals |

## 📁 Installed Themes

### GTK Theme
- **Name**: Stalker-GTK
- **Location**: `~/.themes/Stalker-GTK/`
- **Includes**: GTK 3.0 and GTK 4.0 themes

### GNOME Shell Theme
- **Name**: Stalker-Shell
- **Location**: `~/.themes/Stalker-Shell/`
- **Controls**: Quick Settings, panel, overview, notifications

### Icon Theme
- **Name**: Papirus-Stalker
- **Location**: `~/.local/share/icons/Papirus-Stalker/`
- **Icons**: 4,511 SVG files recolored

## 🛠️ Scripts Created

### Installation Scripts
1. **`install_complete_stalker_theme.sh`** - Master installer (GTK + icons + terminal)
2. **`install_stalker_theme.sh`** - Basic theme installer
3. **`create_system_ui_theme.sh`** - System UI/GNOME Shell theme creator

### Icon Customization Scripts
4. **`create_stalker_icons.sh`** - Basic icon theme creator
5. **`create_advanced_icons.sh`** - Advanced icon recoloring
6. **`aggressive_blue_removal.sh`** - Removes all blue hex colors (39 shades)
7. **`remove_rgb_blues.sh`** - Removes RGB() format blues
8. **`quick_folder_colors.sh`** - Quick folder-only recoloring

### Utility Scripts
9. **`reload_shell.sh`** - Restart GNOME Shell to apply changes
10. **`extract_colors.py`** - Extract colors from images

## 🚀 Current Settings

Run these commands to verify your active themes:
```bash
# Check GTK theme
gsettings get org.gnome.desktop.interface gtk-theme

# Check icon theme
gsettings get org.gnome.desktop.interface icon-theme

# Check GNOME Shell theme
gsettings get org.gnome.shell.extensions.user-theme name
```

## 🔧 Customization & Tweaking

### Using GNOME Tweaks
```bash
gnome-tweaks
```
Navigate to **Appearance** to manually select:
- **Applications**: Stalker-GTK (or Arc-Dark, Numix as alternatives)
- **Icons**: Papirus-Stalker
- **Shell**: Stalker-Shell

### Re-run Scripts
All scripts are safe to run multiple times:
```bash
# Refresh all icons
./aggressive_blue_removal.sh
./remove_rgb_blues.sh

# Recreate system theme
./create_system_ui_theme.sh

# Reload GNOME Shell
./reload_shell.sh
```

## 🎮 Terminal Profile

A "Stalker" terminal profile has been created with:
- **Background**: #1e2920 (dark green-gray)
- **Foreground**: #c9c5b4 (beige/cream)
- **Cursor**: #7a8a7d (light green)
- **16-color palette**: Complete STALKER theme

To switch profiles in GNOME Terminal:
1. Open Terminal
2. Menu → Preferences
3. Select "Stalker" profile

## 📦 Installed Packages

The following packages were installed:
- `gnome-tweaks` - Theme customization GUI
- `gtk2-engines-murrine` - GTK2 theme engine
- `arc-theme` - Base theme (Arc-Dark)
- `papirus-icon-theme` - Base icon set
- `numix-gtk-theme` - Alternative GTK theme
- `imagemagick` - Image processing
- `inkscape` - SVG editing
- `sassc` - SASS/CSS compiler
- `gnome-shell-extension-user-theme` - Custom shell theme support

## 🔄 Applying Changes

### Immediate Changes (No Restart)
✅ GTK theme - Works immediately in new windows
✅ Icon theme - Reloads automatically
✅ Terminal colors - New terminal windows

### Requires GNOME Shell Restart
⚠️ Quick Settings panel colors
⚠️ Top panel appearance
⚠️ Overview/Activities view
⚠️ System notifications

**To restart GNOME Shell:**
1. Press `Alt+F2`
2. Type: `r`
3. Press Enter

OR run:
```bash
./reload_shell.sh
```

### Requires Session Restart
🔄 Full theme integration
🔄 All extensions updated
🔄 Complete visual refresh

**To restart session:**
Log out and log back in

## 🐛 Troubleshooting

### Still Seeing Blue?

1. **Icons still blue?**
   ```bash
   ./aggressive_blue_removal.sh
   gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
   sleep 2
   gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Stalker'
   ```

2. **Quick Settings still blue?**
   ```bash
   ./reload_shell.sh
   # OR log out and back in
   ```

3. **Some apps not themed?**
   - Flatpak apps: `flatpak override --user --filesystem=~/.themes`
   - Snap apps: May not respect system themes (snap limitation)

### Reset to Default

To revert changes:
```bash
# Reset GTK theme
gsettings reset org.gnome.desktop.interface gtk-theme

# Reset icon theme  
gsettings reset org.gnome.desktop.interface icon-theme

# Reset shell theme
gsettings reset org.gnome.shell.extensions.user-theme name

# Remove custom themes
rm -rf ~/.themes/Stalker-*
rm -rf ~/.local/share/icons/Papirus-Stalker
```

## 📚 Additional Resources

### Documentation
- `STALKER_THEME_COLORS.md` - Complete color reference
- GTK theme CSS: `~/.themes/Stalker-GTK/gtk-3.0/gtk.css`
- Shell theme CSS: `~/.themes/Stalker-Shell/gnome-shell/gnome-shell.css`

### Color Values for Development

**CSS Variables:**
```css
--stalker-primary: #5f7060;
--stalker-accent: #7a8a7d;
--stalker-dark: #3a4d3e;
--stalker-purple: #6b5f7b;
--stalker-light: #c9c5b4;
--stalker-bg: #1e2920;
```

**VS Code Settings:**
See `STALKER_THEME_COLORS.md` for complete VS Code configuration.

## 🌟 Inspiration

This theme is inspired by the atmospheric, post-apocalyptic aesthetic of the S.T.A.L.K.E.R. video game series, featuring:
- Desaturated greens and grays
- Low contrast for reduced eye strain
- Earthy, natural tones
- Atmospheric, moody color palette
- Minimal use of bright colors

## ✅ Installation Complete!

Your Debian system now has a complete STALKER theme applied:
- ✅ System UI (GNOME Shell) - All blues → STALKER green
- ✅ GTK applications - Themed with STALKER colors
- ✅ Icons - 4,511 icons recolored
- ✅ Terminal - STALKER color scheme
- ✅ Quick Settings - Green toggles and sliders

**Good hunting, Stalker!** 🌲

---

*Created: October 27, 2025*
*Color palette extracted from: download (1).jpg*
