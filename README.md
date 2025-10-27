# 🎮 STALKER Theme for GNOME - Complete Edition

> *"Get out of here, Stalker!"* - A comprehensive GNOME desktop transformation inspired by the atmospheric world of S.T.A.L.K.E.R.

![GNOME Version](https://img.shields.io/badge/GNOME-43-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Complete-success)

## 🌟 What's New

### Latest Features (October 2025)
- ✅ **Toggle Colors Fixed**: Green toggles via JavaScript extension (#6f7e6f)
- ✅ **File Selection Colors**: STALKER green selections in all apps
- ✅ **Activities → "Perimeter"**: Top bar renamed via extension
- ✅ **Application Renaming**: 10 apps with STALKER names (dual search)
- ✅ **GNOME Shell Extension**: Direct color manipulation
- ✅ **User CSS Overrides**: Highest priority styling

## 🎨 Features

### Core Themes
- 🎨 **GTK 3/4 Theme** - Muted colors, enhanced greens/reds
- 🖼️ **GNOME Shell Theme** - Blue-free UI elements
- 🖱️ **Cursor Theme** - 60+ hexagonal cursors with nut drag-drop
- 🎯 **Icon Theme** - 8,297 muted Papirus icons

### UI Customizations
- 🟢 **Toggle Switches** - STALKER green (#6f7e6f) via JavaScript
- 📁 **File Selections** - Green highlights in all file managers
- 🏷️ **Activities Button** - Renamed to "Perimeter"
- 📱 **App Names** - 10 applications with STALKER names:
  - Settings → Zone
  - Files → Artifacts
  - System Monitor → Command Center
  - Power → Depletion
  - And 6 more...

### Technical Features
- ⚡ **JavaScript Extensions** - 2 custom GNOME Shell extensions
- 🎨 **User CSS** - High-priority GTK overrides
- 🔄 **Dual Search** - Apps searchable by both names
- 🌐 **GDM Support** - Lock screen theming

## 📦 Installation

### One-Click Install
```bash
git clone https://github.com/yourusername/STALKER-Theme-Project.git
cd STALKER-Theme-Project
chmod +x install.sh
./install.sh
```

### Manual Component Installation
```bash
# GTK Theme
bash scripts/create_gtk_theme.sh

# GNOME Shell Theme  
bash scripts/create_gnome_shell_theme.sh

# Cursor Theme
bash scripts/create_cursor_theme.sh

# Icon Muting
bash scripts/apply_color_muting.sh

# Extensions
bash scripts/fix_toggle_colors.sh
bash scripts/rename_activities.sh

# App Renaming
bash scripts/rename_applications.sh
```

### Apply All
```bash
./apply_theme_now.sh
```

Then **restart GNOME Shell**: Alt+F2 → `r` → Enter

## 🎯 Color Palette

| Element | Color | Hex | Usage |
|---------|-------|-----|-------|
| **Toggle ON** | 🟢 Green | `#6f7e6f` | Active toggles, selections |
| **Hover** | 🟢 Light Green | `#8b9b8c` | Hover states |
| **Unchecked** | ⚫ Grey | `#4d4d4d` | Inactive toggles |
| **Background** | 🌑 Dark Green | `#3a4d3e` | Primary background |
| **Text** | 📄 Beige | `#c9c5b4` | Primary text |
| **Selection BG** | 🟢 STALKER Green | `#6f7e6f` | File selections |
| **Selection FG** | 📄 Light Beige | `#e9e5d4` | Selected text |

## 📚 Documentation

- [`APPLICATION_RENAMING_GUIDE.md`](APPLICATION_RENAMING_GUIDE.md) - App renaming details
- [`TOGGLE_COLORS_FIX.md`](TOGGLE_COLORS_FIX.md) - Technical explanation of color fixes
- [`docs/COLORS.md`](docs/COLORS.md) - Complete color palette
- [`docs/CUSTOMIZATION.md`](docs/CUSTOMIZATION.md) - Customization guide
- [`docs/TROUBLESHOOTING.md`](docs/TROUBLESHOOTING.md) - Common issues

## 🔧 Requirements

- GNOME 43+ (tested on 43.9)
- Papirus icon theme (for icon muting)
- User Themes extension
- Python 3 (for icon processing)

## 📂 Project Structure

```
STALKER-Theme-Project/
├── install.sh              # Main installer
├── apply_theme_now.sh      # Force apply all themes
├── scripts/                # Component scripts
│   ├── create_gtk_theme.sh
│   ├── create_gnome_shell_theme.sh
│   ├── create_cursor_theme.sh
│   ├── apply_color_muting.sh
│   ├── fix_toggle_colors.sh
│   ├── rename_activities.sh
│   ├── rename_applications.sh
│   ├── fix_dialog_transparency.sh
│   └── apply_to_gdm.sh
├── docs/                   # Documentation
└── assets/                 # Screenshots, resources

Extensions created (in ~/.local/share/gnome-shell/extensions/):
├── activities-perimeter@stalker/
└── stalker-toggle-colors@theme/

User CSS (in ~/.config/):
├── gtk-3.0/gtk.css
└── gtk-4.0/gtk.css
```

## 🎮 Renamed Applications

| Original | STALKER Name | Search Works |
|----------|--------------|--------------|
| Settings | Zone | ✅ Both |
| Files | Artifacts | ✅ Both |
| System Monitor | Command Center | ✅ Both |
| Appearance | Anomaly | ✅ Both |
| Power | Depletion | ✅ Both |
| About | Status Report | ✅ Both |
| Notifications | Alert System | ✅ Both |
| Search | Scan | ✅ Both |
| Keyboard | Quick Routes | ✅ Both |
| Region & Language | Sector Config | ✅ Both |

## 🔍 Troubleshooting

### Toggles Still Blue?
```bash
# Check extension
gnome-extensions list --enabled | grep stalker

# Re-enable
gnome-extensions disable stalker-toggle-colors@theme
gnome-extensions enable stalker-toggle-colors@theme

# Restart Shell
Alt+F2 → 'r' → Enter
```

### Selections Still Blue?
```bash
# Check user CSS
cat ~/.config/gtk-3.0/gtk.css

# Restart app
killall nautilus && nautilus &
```

### "Perimeter" Not Showing?
```bash
# Check extension
gnome-extensions info activities-perimeter@stalker

# Restart Shell
Alt+F2 → 'r' → Enter
```

## 🤝 Contributing

Contributions welcome! See [`CONTRIBUTING.md`](CONTRIBUTING.md)

## 📜 License

MIT License - See [`LICENSE`](LICENSE)

## 🎖️ Credits

- Inspired by Andrei Tarkovsky's **Stalker** (1979)
- Based on Papirus icon theme
- GNOME Shell theming community
- S.T.A.L.K.E.R. game series aesthetic

## 🌟 Showcase

![Screenshot 1](assets/screenshots/desktop.png)
*Main desktop with "Perimeter" and green toggles*

![Screenshot 2](assets/screenshots/files.png)
*Files (Artifacts) with green selections*

![Screenshot 3](assets/screenshots/settings.png)
*Zone (Settings) with STALKER green toggles*

---

*"Good hunting, Stalker."* 🎯
