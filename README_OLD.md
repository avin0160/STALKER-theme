# STALKER Theme for GNOME# 🎮 STALKER Theme Project



> *"The Zone awaits those who seek. Muted colors. Harsh reality. Survival aesthetic."*A complete STALKER-inspired theme system for GNOME/Linux with muted blues, enhanced greens/reds, and atmospheric post-apocalyptic styling.



A complete GNOME desktop theme inspired by Andrei Tarkovsky's **STALKER** (1979), featuring desaturated colors, tactical greens, weathered reds, and earthy beiges. This theme transforms your desktop into The Zone—a place where only essential colors survive.![Theme Status](https://img.shields.io/badge/Status-Active-success)

![GNOME](https://img.shields.io/badge/GNOME-40%2B-blue)

![STALKER Theme Banner](assets/screenshots/banner.png)![License](https://img.shields.io/badge/License-MIT-green)



## 🎨 The Aesthetic## ✨ Features



STALKER Theme removes the vibrancy of modern UIs and replaces it with the muted, oppressive atmosphere of The Zone:- **🎨 Muted Blues**: All blue colors replaced with atmospheric gray-greens

- **💚 Enhanced Greens**: Vibrant STALKER greens that pop

- **No Blues**: All blues converted to grey-greens- **❤️ Enhanced Reds**: Error/warning colors that stand out

- **Tactical Greens**: Military-inspired green accents (#3a4d3e → #7a8a7d)- **🖱️ Bigger Cursors**: 25% larger with brighter grey and dark green center

- **Weathered Reds**: Faded, rust-like reds (#6d4545 → #b87a7a)- **📁 File Manager**: Complete Nautilus/Files theming

- **Desolate Beiges**: Dust and decay tones (#a39e8f → #c9c5b4)- **🎯 Icons**: 2400+ Papirus icons recolored

- **Minimal Hex Cursors**: Custom hexagonal cursors with breathing animations

- **8000+ Icons**: Recolored Papirus icon set with STALKER palette## 🚀 Quick Start



## ✨ Features```bash

# Apply complete theme (one command!)

### Complete Theme Suite./apply_stalker_colors.sh

- **GTK Theme** (GTK 3 & 4): Muted interface with green/red/beige accents```

- **Icon Theme**: 8,297 SVG icons recolored from Papirus base

- **Cursor Theme**: Minimal hexagonal cursors with subtle animationsThen **log out and back in** to see all changes.

- **GDM/Lock Screen**: Full theme applied to login and lock screens

## 📦 What's Applied

### Color Philosophy

```### ✅ Currently Active

Greens (Survival):     #3a4d3e → #5f7060 → #7a8a7d → #9ca69a- **GTK Theme**: `STALKER-Theme` (file manager, applications)

Reds (Danger):         #6d4545 → #8b5a5a → #b87a7a- **Icon Theme**: `Papirus-Stalker` (muted blues, enhanced greens/reds)

Beiges (Decay):        #a39e8f → #c9c5b4- **Cursor Theme**: `STALKER-Cursors` (40x40px, brighter grey, dark green)

Grey-Greens (Zone):    #6a7a6d → #7f9080- **Shell Extension**: User theme enabled

```

### 🎨 Color Palette

### Cursor Features- **Dark Green**: `#3a4d3e` - Backgrounds, inner circles

- 🔷 **Hexagonal Design**: Minimal tactical aesthetic- **STALKER Green**: `#5f7060` - Primary UI elements

- 💚 **Bright Green Center Dots**: On pointer, text, resize cursors- **Light Green**: `#7a8a7d` - Hover states

- 🌊 **Breathing Animation**: Gentle pulsing wait cursor (16 frames)- **Enhanced Green**: `#7f9080` - Success messages (pops!)

- 🔄 **Rotating Animation**: Smooth spinning indicator (24 frames)- **Enhanced Red**: `#b87a7a` - Errors, warnings (pops!)

- 📏 **Traditional I-Beam**: Classic text cursor with STALKER colors- **Brighter Grey**: `rgb(180, 180, 185)` - Cursor outer rings

- ⚡ **No Green on Hand Cursor**: Clean clickable state- **Beige**: `#c9c5b4` - Light backgrounds, text



## 📦 Installation## 📁 Project Structure



### Quick Install (One Command)### Core Scripts

```bash```

git clone https://github.com/YOUR_USERNAME/STALKER-Theme-Project.gitapply_stalker_colors.sh              # ⭐ MASTER SCRIPT - Run this!

cd STALKER-Theme-Project├─ create_stalker_gtk_theme.sh       # Creates GTK/app theme

bash install.sh└─ mute_blues_enhance_greens_reds.sh # Processes icon colors

```

create_stalker_adwaita_cursors.sh    # Creates enhanced cursors

### Manual Installation```



#### 1. Install Dependencies### Documentation

```bash```

# Ubuntu/DebianTHEME_STATUS.md           # Complete guide (START HERE!)

sudo apt install python3-pil xcursorgen papirus-icon-themeSTALKER_CURSOR_GUIDE.md   # Cursor details

STALKER_THEME_COLORS.md   # Color reference

# Fedora```

sudo dnf install python3-pillow xcursorgen papirus-icon-theme

### Utilities

# Arch```

sudo pacman -S python-pillow xorg-xcursorgen papirus-icon-themeextract_colors.py         # Extract colors from images

``````



#### 2. Create GTK Theme## 🎯 Individual Components

```bash

bash scripts/create_gtk_theme.sh### GTK Theme (File Manager & Apps)

``````bash

./create_stalker_gtk_theme.sh

#### 3. Create Cursor Theme```

```bash- Mutes all blue UI elements → gray-greens

bash scripts/create_cursor_theme.sh- Enhances green success messages

```- Enhances red error messages

- Custom Nautilus styling

#### 4. Apply Color Muting (Recommended)

```bash### Icon Theme

bash scripts/apply_color_muting.sh```bash

```./mute_blues_enhance_greens_reds.sh

⚠️ This processes 8000+ icon files - takes ~2 minutes```

- Processes 2400+ Papirus SVG icons

#### 5. Apply to Lock Screen (Optional)- Replaces 60+ blue color codes

```bash- Enhances greens and reds

bash scripts/apply_to_gdm.sh- Takes 5-10 minutes

```

Requires sudo to copy themes to system directories.### Cursor Theme

```bash

## 🎯 What Gets Themed./create_stalker_adwaita_cursors.sh

```

### Your Desktop- 25% bigger (40x40 vs 32x32)

- **File Manager** (Nautilus): Grey-green folders, muted accents- Brighter grey outer ring

- **Text Selections**: Grey-green backgrounds instead of blue- STALKER dark green inner circle

- **Links**: STALKER green instead of blue- Complete Adwaita-style set

- **Progress Bars**: Green fill- Animated wait cursor

- **Switches/Checkboxes**: Green when active

- **Scrollbars**: Muted grey-green## ⚙️ Manual Configuration

- **Window Focus**: Green borders

### Apply Themes

### Lock Screen (GDM)```bash

When you apply to GDM, the same muted aesthetic appears on:# GTK theme

- Login screengsettings set org.gnome.desktop.interface gtk-theme 'STALKER-Theme'

- Lock screen (Super+L)

- User switching dialog# Icons

gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Stalker'

## 📸 Screenshots

# Cursors

> *Add your screenshots here after installation*gsettings set org.gnome.desktop.interface cursor-theme 'STALKER-Cursors'

```

```

assets/screenshots/### Verify Settings

├── desktop_overview.png      # Full desktop view```bash

├── file_manager.png          # Nautilus with theme# Check what's currently applied

├── cursor_showcase.png       # All cursor statesgsettings get org.gnome.desktop.interface gtk-theme

└── lock_screen.png           # GDM themegsettings get org.gnome.desktop.interface icon-theme

```gsettings get org.gnome.desktop.interface cursor-theme

```

## 🛠️ Customization

### Revert to Defaults

See [docs/CUSTOMIZATION.md](docs/CUSTOMIZATION.md) for detailed customization options.```bash

gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'

### Quick Tweaksgsettings set org.gnome.desktop.interface icon-theme 'Adwaita'

```bashgsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'

# Adjust color intensity```

nano scripts/create_gtk_theme.sh

## 📍 File Locations

# Modify cursor size/colors

nano scripts/create_cursor_theme.sh### Installed Themes

```

# Change color mappings for icons~/.themes/STALKER-Theme/              # GTK theme

nano scripts/apply_color_muting.sh~/.local/share/icons/Papirus-Stalker/ # Icon theme

```~/.icons/STALKER-Cursors/             # Cursor theme

```

## 🐛 Troubleshooting

### Build Files

### Theme not applying?```

```bash/tmp/stalker-cursor-build/            # Cursor generation (temporary)

gsettings set org.gnome.desktop.interface gtk-theme 'STALKER-Theme'```

gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Stalker'

killall nautilus  # Restart file manager## 🔧 Requirements

```

### Required Packages

### Icons still blue?```bash

```bashsudo apt install -y \

gtk-update-icon-cache ~/.local/share/icons/Papirus-Stalker    gnome-tweaks \

```    papirus-icon-theme \

    python3 \

### Cursor not changing?    python3-pil \

```bash    imagemagick \

gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex-Minimal'    xcursorgen \

```    x11-apps

```

See [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) for more solutions.

### Compatibility

## 📚 Project Structure- GNOME 40+

```- Ubuntu 20.04+

STALKER-Theme-Project/- X11 and Wayland

├── README.md                    # This file

├── LICENSE                      # MIT License  ## 🎨 Customization

├── install.sh                   # One-click installer

├── docs/### Change Cursor Size

│   ├── COLORS.md               # Complete color palette```bash

│   ├── CUSTOMIZATION.md        # Customization guide# Bigger cursors for 4K displays

│   └── TROUBLESHOOTING.md      # Extended troubleshootinggsettings set org.gnome.desktop.interface cursor-size 32

├── scripts/

│   ├── create_gtk_theme.sh     # GTK theme generator# Reset to default

│   ├── create_cursor_theme.sh  # Cursor creatorgsettings set org.gnome.desktop.interface cursor-size 24

│   ├── apply_color_muting.sh   # Icon color processor```

│   ├── apply_to_gdm.sh         # GDM applicator

│   └── extract_colors.py       # Color analysis tool### Modify Colors

└── assets/Edit the scripts and change color constants:

    └── screenshots/            # Theme screenshots- **GTK**: Edit CSS in `create_stalker_gtk_theme.sh`

```- **Icons**: Edit color maps in `mute_blues_enhance_greens_reds.sh`

- **Cursors**: Edit Python color constants in `create_stalker_adwaita_cursors.sh`

## 🎬 Inspiration

### Extract New Colors

This theme is inspired by **STALKER** (Сталкер, 1979), Andrei Tarkovsky's philosophical science fiction masterpiece. The film's desolate, muted color palette and oppressive atmosphere of The Zone inspired every design choice.```bash

# From your own image

> *"Let everything that's been planned come true. Let them believe."*python3 extract_colors.py

```

## 📄 License

## 🐛 Troubleshooting

MIT License - See [LICENSE](LICENSE) file

### Changes Not Showing

## 🤝 Contributing```bash

# Log out and back in (recommended)

Contributions welcome! Ideas:# Or restart GNOME Shell (X11 only):

- Add STALKER-themed wallpapers# Alt+F2 → type 'r' → Enter

- Create terminal color schemes```

- Port to KDE Plasma/XFCE

- Add ambient Zone sound themes### Icons Not Updating

- Create browser theme extensions```bash

# Update icon cache

## ⭐ Acknowledgmentsgtk-update-icon-cache -f -t ~/.local/share/icons/Papirus-Stalker



- **Andrei Tarkovsky** - For the vision# Clear thumbnails

- **Papirus Icons** - Base icon setrm -rf ~/.cache/thumbnails/*

- **GNOME Project** - Desktop environment```

- **The Zone** - For teaching us that less color means more meaning

### Cursor Not Changing

---```bash

# Verify installation

**Good hunting, Stalker.** 🌿ls -la ~/.icons/STALKER-Cursors/cursors/



*"The Zone wants to be respected. Otherwise it will punish."*# Reapply

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
