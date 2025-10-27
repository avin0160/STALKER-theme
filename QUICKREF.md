# STALKER Theme Project - Quick Reference

*"Let everything that's been planned come true."*

---

## 📁 Project Structure (Clean & GitHub-Ready)

```
STALKER-Theme-Project/
├── README.md                    # Main documentation & installation guide
├── LICENSE                      # MIT License with attributions
├── CHANGELOG.md                 # Version history and roadmap
├── CONTRIBUTING.md              # Contribution guidelines
├── GITHUB_DEPLOYMENT.md         # Step-by-step GitHub publishing guide
├── install.sh                   # One-click installer (main entry point)
├── apply_theme_now.sh           # Force-refresh themes immediately
├── assets/
│   └── screenshots/
│       └── README.md            # Screenshot guidelines (needs images)
├── docs/
│   ├── COLORS.md                # Complete color palette reference
│   ├── CUSTOMIZATION.md         # How to modify theme components
│   └── TROUBLESHOOTING.md       # Common issues and solutions
└── scripts/
    ├── create_gtk_theme.sh      # Generates GTK 3/4 CSS theme
    ├── create_cursor_theme.sh   # Generates hexagonal cursor theme
    ├── apply_color_muting.sh    # Processes 8,297 Papirus icons
    ├── apply_to_gdm.sh          # Applies theme to lock screen
    └── extract_colors.py        # Color analysis utility
```

---

## 🚀 Quick Start Commands

### Install Theme (First Time)
```bash
chmod +x install.sh
./install.sh
```

### Update/Refresh Theme
```bash
./apply_theme_now.sh
```

### Manual Component Installation
```bash
# GTK theme only
./scripts/create_gtk_theme.sh

# Cursors only
./scripts/create_cursor_theme.sh

# Icons only
./scripts/apply_color_muting.sh

# Lock screen only (requires sudo)
sudo ./scripts/apply_to_gdm.sh
```

---

## 🎨 Color Palette Quick Reference

| Color Type    | Hex Code  | RGB         | Usage                      |
|---------------|-----------|-------------|----------------------------|
| **Greens**    |           |             |                            |
| Primary       | `#3a4d3e` | 58, 77, 62  | Main UI elements           |
| Accent        | `#5f7060` | 95, 112, 96 | Highlights, links          |
| Selection     | `#6a7a6d` | 106,122,109 | Selected items             |
| Light         | `#7a8a7d` | 122,138,125 | Progress bars              |
| **Reds**      |           |             |                            |
| Dark          | `#6d4545` | 109, 69, 69 | Warnings (muted)           |
| Medium        | `#8b5a5a` | 139, 90, 90 | Danger indicators          |
| Light         | `#b87a7a` | 184,122,122 | Alerts                     |
| **Beiges**    |           |             |                            |
| Medium        | `#a39e8f` | 163,158,143 | Inactive elements          |
| Light         | `#c9c5b4` | 201,197,180 | Backgrounds                |
| **Special**   |           |             |                            |
| Bright Green  | `#00ff64` | 0, 255, 100 | Cursor center dots         |
| Grey-Green    | `#6a7a6d` | 106,122,109 | All blue replacements      |
| Zone Grey     | `#7f9080` | 127,144,128 | Cyan/teal replacements     |

---

## 🖱️ Cursor Design Reference

### Available Cursors (60+ files)
- **Default**: Hexagon with bright green dot at tip
- **Hand/Link**: Hexagon with center green dot
- **Text**: Traditional I-beam with STALKER colors
- **Resize**: 8 directional arrows (N/S/E/W/NE/NW/SE/SW)
- **Drag-Drop**: Solid hexagonal nut with grip lines ⬡
- **Wait**: Breathing (16 frames) or rotating (24 frames)
- **Crosshair**: Hexagon with thin crosshair lines
- **Move**: Hexagon with 4-way arrows

### Cursor Specifications
- **Base Color**: `#3a4d3e` (STALKER_PRIMARY)
- **Accent Color**: `#5f7060` (STALKER_ACCENT)
- **Center Dot**: `#00ff64` (Bright Green, 255 alpha)
- **Hexagon Size**: 12px (main), 9px (drag-drop)
- **Line Width**: 2px (standard), 3px (drag-drop)
- **Shadow**: 2px offset, semi-transparent

---

## 📊 Icon Processing Stats

- **Total Icons**: 8,297 SVG files (Papirus base)
- **Processing Time**: ~2 minutes
- **Color Replacements**: 65 mappings
  - 18 blues → grey-greens
  - 10 cyans → grey-greens
  - 10 teals → grey-greens
  - 10 purples → reds
  - 8 bright yellows/oranges → beiges
  - 9 additional neon colors → muted equivalents

---

## 🔧 System Requirements

### Minimum
- **OS**: Linux with GNOME 40+
- **Session**: Xorg or Wayland
- **Dependencies**:
  - `python3-pil` (PIL/Pillow)
  - `xcursorgen`
  - `papirus-icon-theme`

### Recommended
- **Resolution**: 1920x1080 or higher
- **RAM**: 4GB+ (for icon processing)
- **Disk Space**: ~200MB (theme files + cache)

### Installation Commands
```bash
# Debian/Ubuntu
sudo apt install python3-pil xcursorgen papirus-icon-theme

# Fedora
sudo dnf install python3-pillow xcursorgen papirus-icon-theme

# Arch
sudo pacman -S python-pillow xcursorgen papirus-icon-theme
```

---

## 🐛 Troubleshooting Quick Fixes

### Theme Not Applying
```bash
./apply_theme_now.sh  # Force refresh
# Then log out and back in
```

### Icons Still Colorful
```bash
# Reprocess icons
./scripts/apply_color_muting.sh
gtk-update-icon-cache ~/.icons/Papirus-Stalker/
```

### Cursor Not Changing
```bash
# Check cursor theme setting
gsettings get org.gnome.desktop.interface cursor-theme

# Reset and reapply
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex-Minimal'
```

### Lock Screen Not Themed
```bash
# Reapply GDM theme (requires sudo password)
sudo ./scripts/apply_to_gdm.sh
sudo dconf update
```

### Complete Reset
```bash
# Remove all theme files
rm -rf ~/.themes/STALKER-Theme
rm -rf ~/.icons/Papirus-Stalker
rm -rf ~/.icons/Stalker-Hex-Minimal

# Reset to default
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'

# Reinstall if needed
./install.sh
```

---

## 📝 File Locations

### User Theme Files
```
~/.themes/STALKER-Theme/              # GTK 3/4 theme
~/.icons/Papirus-Stalker/             # Color-muted icons
~/.icons/Stalker-Hex-Minimal/         # Cursor theme
```

### System Theme Files (GDM)
```
/usr/share/themes/STALKER-Theme/      # System GTK theme
/usr/share/icons/Papirus-Stalker/     # System icons
/usr/share/icons/Stalker-Hex-Minimal/ # System cursors
/etc/dconf/db/gdm.d/99-stalker-theme  # GDM config
```

### Temporary Build Files
```
/tmp/stalker_cursors/                 # Cursor PNG files (deleted after build)
```

---

## 🎯 Key Features Summary

✅ **Complete Theme Suite**
- GTK 3 & 4 CSS themes
- 60+ X11 cursor files
- 8,297 color-muted icons
- GDM lock screen support

✅ **STALKER Aesthetic**
- Only greens, reds, and beiges
- All blues → grey-greens
- All purples → reds
- Hexagonal geometry throughout

✅ **Professional Quality**
- One-click installer
- Force-refresh mechanism
- Comprehensive documentation
- MIT License with attributions

✅ **Customization Ready**
- Documented color palette
- Modular script architecture
- Clear customization guide
- Easy color replacements

---

## 🌐 GitHub Deployment Checklist

### Ready Now ✅
- [x] Clean project structure
- [x] Professional README
- [x] MIT License
- [x] Contribution guidelines
- [x] Complete documentation
- [x] .gitignore configured
- [x] Changelog created
- [x] All scripts tested and working

### Before Publishing 📸
- [ ] Add 4-5 screenshots to `assets/screenshots/`
- [ ] Test fresh install on clean system
- [ ] Update README with actual GitHub username
- [ ] Create repository on GitHub
- [ ] Push and create v1.0.0 release

### After Publishing 🎉
- [ ] Configure repository topics/tags
- [ ] Add social preview image
- [ ] Post on r/unixporn
- [ ] Monitor issues and PRs

**See GITHUB_DEPLOYMENT.md for detailed step-by-step guide**

---

## 📚 Documentation Map

| File                   | Purpose                              | Reader         |
|------------------------|--------------------------------------|----------------|
| README.md              | Overview, installation, quick start  | All users      |
| CHANGELOG.md           | Version history, roadmap             | All users      |
| LICENSE                | Legal terms, attributions            | All users      |
| CONTRIBUTING.md        | How to contribute                    | Contributors   |
| GITHUB_DEPLOYMENT.md   | Publishing to GitHub                 | Maintainer     |
| docs/COLORS.md         | Complete color palette               | Customizers    |
| docs/CUSTOMIZATION.md  | Modification guide                   | Customizers    |
| docs/TROUBLESHOOTING.md| Problem solving                      | All users      |
| assets/screenshots/    | Visual documentation                 | All users      |

---

## 🎬 STALKER Film References

The theme embodies Andrei Tarkovsky's 1979 film *STALKER*:

> *"Let everything that's been planned come true. Let them believe."*

**Visual Language:**
- **Sepia tones** → Beiges (decay, time)
- **Overgrown ruins** → Greens (nature reclaiming)
- **Danger zones** → Reds (contamination)
- **Industrial debris** → Hexagons (nuts, bolts)
- **Absence of sky** → No blues (hopelessness)

**Philosophy:**
- Muted colors reflect the Zone's oppressive atmosphere
- Hexagonal geometry represents industrial decay
- Bright green dots are rare artifacts of life
- The theme seeks to be mysterious, austere, contemplative

---

## 🔄 Update Workflow

### Making Changes
```bash
# 1. Edit scripts or docs
vim scripts/create_cursor_theme.sh

# 2. Test changes
./apply_theme_now.sh

# 3. Update changelog
vim CHANGELOG.md  # Add to "Unreleased" section

# 4. Commit
git add .
git commit -m "feat: Add new cursor animation"

# 5. Push
git push origin main
```

### Creating Release
```bash
# 1. Finalize changelog
vim CHANGELOG.md  # Move "Unreleased" to "v1.1.0"

# 2. Commit and tag
git add CHANGELOG.md
git commit -m "chore: Release v1.1.0"
git tag v1.1.0
git push origin main --tags

# 3. Create GitHub release
gh release create v1.1.0 --notes-file CHANGELOG.md
```

---

## 💡 Pro Tips

### Performance
- Icon processing is one-time (no need to repeat unless updating Papirus)
- Cursor generation is instant (~2 seconds)
- GTK theme changes require app restart

### Compatibility
- Works on both Xorg and Wayland
- GTK4 apps automatically inherit GTK3 theme
- Flatpak apps may need manual theming (see docs/TROUBLESHOOTING.md)

### Customization
- All colors defined as variables in scripts
- Change one color → regenerate theme
- Easy to create color variants (e.g., "STALKER Red" variant)

### Testing
```bash
# Test without installing
./scripts/create_gtk_theme.sh && ls ~/.themes/STALKER-Theme/

# Test cursors
./scripts/create_cursor_theme.sh && ls ~/.icons/Stalker-Hex-Minimal/cursors/

# Preview cursor
xcursorview ~/.icons/Stalker-Hex-Minimal/cursors/default
```

---

## 📞 Getting Help

1. **Check docs/TROUBLESHOOTING.md** - Most issues covered
2. **Review CUSTOMIZATION.md** - For modification questions
3. **GitHub Issues** - Bug reports and feature requests
4. **GitHub Discussions** - General questions (if enabled)

---

## 🎯 Current Status

**Version**: 1.0.0 (Ready for Release)  
**Components**: 4/4 Complete (GTK ✓ Icons ✓ Cursors ✓ GDM ✓)  
**Documentation**: 8/8 Complete  
**GitHub Ready**: Yes (pending screenshots)  
**License**: MIT (OSI Approved)

---

*"The Zone wants to be a mystery. But the code wants to be shared."*

**May your way be clear and your return certain, Stalker.** 🌿
