
# 🎬 STALKER THEME PROJECT
## Complete GNOME Desktop Theme Suite

```
     ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ 
    ⬡                                               ⬡
   ⬡   "Let everything that's been planned come     ⬡
  ⬡     true. Let them believe. And let them        ⬡
 ⬡      have a laugh at their passions."            ⬡
⬡       Because what they call passion actually      ⬡
 ⬡      is not some emotional energy, but just      ⬡
  ⬡     the friction between their souls and       ⬡
   ⬡    the outside world.                         ⬡
    ⬡                                              ⬡
     ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ 
```

---

## 📦 WHAT'S IN THE BOX

### 🎨 Complete Theme Suite
```
┌─────────────────────────────────────────────────┐
│  ✓  GTK 3/4 Theme                               │
│     └─ Muted greens, reds, beiges               │
│     └─ Custom Nautilus styling                  │
│     └─ Selection & progress bar colors          │
│                                                  │
│  ✓  X11 Cursor Theme (60+ files)                │
│     └─ Hexagonal geometry                       │
│     └─ Bright green center dots                 │
│     └─ Solid nut drag-drop cursor               │
│     └─ Breathing & rotating animations          │
│                                                  │
│  ✓  Color-Muted Icons (8,297 processed)         │
│     └─ Papirus base                             │
│     └─ All blues → grey-greens                  │
│     └─ All purples → reds                       │
│     └─ 2-minute processing time                 │
│                                                  │
│  ✓  GDM Lock Screen Support                     │
│     └─ System-wide theme application            │
│     └─ Xorg & Wayland compatible                │
└─────────────────────────────────────────────────┘
```

---

## 🗂️ PROJECT STRUCTURE

```
STALKER-Theme-Project/
│
├── 📄 README.md              ← Start here! Installation & overview
├── 📄 LICENSE                ← MIT (free to use & modify)
├── 📄 CHANGELOG.md           ← Version history & roadmap
├── 📄 CONTRIBUTING.md        ← How to contribute
├── 📄 GITHUB_DEPLOYMENT.md   ← Step-by-step GitHub publishing
├── 📄 QUICKREF.md            ← This file! Quick reference
│
├── 🚀 install.sh             ← One-click installer (START HERE)
├── 🔄 apply_theme_now.sh     ← Force-refresh themes
│
├── 📁 assets/
│   └── screenshots/
│       └── README.md         ← Screenshot guidelines (needs images)
│
├── 📁 docs/
│   ├── COLORS.md             ← Complete color palette
│   ├── CUSTOMIZATION.md      ← How to modify theme
│   └── TROUBLESHOOTING.md    ← Fix common issues
│
└── 📁 scripts/
    ├── create_gtk_theme.sh        ← GTK CSS generator
    ├── create_cursor_theme.sh     ← Cursor generator
    ├── apply_color_muting.sh      ← Icon color processor
    ├── apply_to_gdm.sh            ← Lock screen applicator
    └── extract_colors.py          ← Color analysis tool
```

---

## 🎨 COLOR PALETTE AT A GLANCE

```
┌──────────── GREENS (Survival) ────────────┐
│ #3a4d3e ████████  Primary                 │
│ #5f7060 ████████  Accent                  │
│ #6a7a6d ████████  Selection               │
│ #7a8a7d ████████  Light                   │
└────────────────────────────────────────────┘

┌──────────── REDS (Danger) ────────────────┐
│ #6d4545 ████████  Dark                    │
│ #8b5a5a ████████  Medium                  │
│ #b87a7a ████████  Light                   │
└────────────────────────────────────────────┘

┌──────────── BEIGES (Decay) ───────────────┐
│ #a39e8f ████████  Medium                  │
│ #c9c5b4 ████████  Light                   │
└────────────────────────────────────────────┘

┌──────────── SPECIAL ───────────────────────┐
│ #00ff64 ████████  Bright Green (dots)     │
│ #6a7a6d ████████  Grey-Green (blue repl.) │
│ #7f9080 ████████  Zone Grey (cyan repl.)  │
└────────────────────────────────────────────┘
```

---

## 🚀 INSTALLATION (3 STEPS)

```bash
# 1. Clone repository
git clone https://github.com/YOUR_USERNAME/stalker-theme.git
cd stalker-theme

# 2. Make installer executable
chmod +x install.sh

# 3. Run installer
./install.sh

# 🎉 Done! Log out and back in to see full effect
```

---

## 🖱️ CURSOR SHOWCASE

```
     ⬡              ⬡●             ⬡
   ⬡   ⬡          ⬡   ⬡         ⬡   ⬡
  ⬡  ●  ⬡        ⬡  ●  ⬡       ⬡  ●  ⬡
   ⬡   ⬡          ⬡   ⬡         ⬡   ⬡
     ⬡              ⬡               ⬡

  Default        Hand/Link        Move
  (pointer)     (hovering)      (4-way)


     │              ↖               ⬡⬡⬡⬡
     │             │               ⬡●⬡⬡⬡
    ●│●            ●               ⬡⬡⬡⬡⬡
     │                             ⬡⬡●⬡⬡
     │                             ⬡⬡⬡⬡⬡

  Text (I-beam)   Resize      Drag-Drop (Nut)


     ⬡              ⬡●             ⬡
   ⬡   ⬡          ⬡   ⬡         ⬡   ⬡
  ⬡ ┼ ⬡        ⬡  ●  ⬡       ⬡     ⬡
   ⬡   ⬡          ⬡   ⬡         ⬡   ⬡
     ⬡              ⬡               ⬡

  Crosshair      Breathing       Rotating
               (wait 16f)      (wait 24f)
```

---

## 📊 BY THE NUMBERS

```
┌─────────────────────────────────────────────────┐
│  Component              Count       Time         │
├─────────────────────────────────────────────────┤
│  GTK Themes            2 (GTK3/4)   Instant      │
│  Cursor Files          60+          2 seconds    │
│  Icons Processed       8,297 SVGs   2 minutes    │
│  Color Replacements    65 mappings  N/A          │
│  Bash Scripts          4            1,358 lines  │
│  Python Scripts        1            60 lines     │
│  Documentation Files   8            ~5,000 words │
├─────────────────────────────────────────────────┤
│  Total Project Size    ~10 MB (source)           │
│  Installed Size        ~200 MB (with cache)      │
└─────────────────────────────────────────────────┘
```

---

## 🎯 QUICK COMMANDS

```bash
# Install everything
./install.sh

# Force refresh theme
./apply_theme_now.sh

# Update just GTK
./scripts/create_gtk_theme.sh

# Update just cursors
./scripts/create_cursor_theme.sh

# Reprocess icons
./scripts/apply_color_muting.sh

# Apply to lock screen (sudo required)
sudo ./scripts/apply_to_gdm.sh

# Reset to default
gsettings reset org.gnome.desktop.interface gtk-theme
gsettings reset org.gnome.desktop.interface icon-theme
gsettings reset org.gnome.desktop.interface cursor-theme
```

---

## 🐛 TROUBLESHOOTING CHEAT SHEET

```
Problem: Theme not applying
Fix:     ./apply_theme_now.sh && log out/in

Problem: Icons still colorful
Fix:     ./scripts/apply_color_muting.sh
         gtk-update-icon-cache ~/.icons/Papirus-Stalker/

Problem: Cursor not changing
Fix:     gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex-Minimal'

Problem: Lock screen not themed
Fix:     sudo ./scripts/apply_to_gdm.sh
         sudo dconf update

Problem: Flatpak apps not themed
Fix:     See docs/TROUBLESHOOTING.md "Flatpak Applications"
```

---

## 📚 DOCUMENTATION MAP

```
For...                      Read...
──────────────────────────────────────────────────
Installation                README.md
Color reference             docs/COLORS.md
Customization               docs/CUSTOMIZATION.md
Problems                    docs/TROUBLESHOOTING.md
Contributing                CONTRIBUTING.md
Version history             CHANGELOG.md
GitHub publishing           GITHUB_DEPLOYMENT.md
Quick reference             QUICKREF.md (this file)
```

---

## 🌐 GITHUB DEPLOYMENT

```bash
# 1. Initialize repo
git init
git add .
git commit -m "feat: Initial release"

# 2. Create on GitHub
# Go to: https://github.com/new
# Name: stalker-theme
# Don't initialize with README (we have one)

# 3. Push
git remote add origin https://github.com/YOUR_USERNAME/stalker-theme.git
git branch -M main
git push -u origin main

# 4. Create release (v1.0.0)
# GitHub → Releases → Create a new release

# 🎉 Published!
```

**See GITHUB_DEPLOYMENT.md for full step-by-step guide**

---

## ✅ GITHUB READINESS CHECKLIST

```
[✓] Clean project structure
[✓] Professional README with install guide
[✓] MIT License with attributions
[✓] Contribution guidelines
[✓] Complete documentation (8 files)
[✓] .gitignore configured
[✓] Changelog with roadmap
[✓] All scripts tested and working
[✓] No duplicate/old files in root
[✓] Organized directories (scripts/, docs/, assets/)

[📸] Add screenshots before publishing:
    [ ] assets/screenshots/desktop_overview.png
    [ ] assets/screenshots/file_manager.png
    [ ] assets/screenshots/cursor_showcase.png
    [ ] assets/screenshots/lock_screen.png
```

---

## 🎬 THE STALKER PHILOSOPHY

```
┌────────────────────────────────────────────────┐
│                                                 │
│   "The Zone wants to be a mystery."            │
│                                                 │
│   This theme strips away the colorful          │
│   distractions of modern UI design,            │
│   leaving only what's essential:               │
│                                                 │
│   • Greens for survival                        │
│   • Reds for danger                            │
│   • Beiges for decay                           │
│                                                 │
│   No blues. No hope. No sky.                   │
│   Only the Zone remains.                       │
│                                                 │
│   The hexagon represents industrial decay:     │
│   nuts, bolts, honeycomb patterns,             │
│   warning signs, unnatural geometry.           │
│                                                 │
│   The bright green dots are rare artifacts     │
│   of life in an otherwise dead landscape.      │
│                                                 │
└────────────────────────────────────────────────┘
```

---

## 🚀 WHAT'S NEXT?

```
Immediate:
→ Add screenshots to assets/screenshots/
→ Test install on fresh system
→ Publish to GitHub
→ Create v1.0.0 release

Soon:
→ Post on r/unixporn
→ Share on GNOME subreddit
→ Monitor issues and PRs

Future (see CHANGELOG.md):
→ KDE Plasma port
→ XFCE theme port
→ Firefox/Chrome extensions
→ Terminal color schemes
→ Wallpaper collection
→ Sound theme
```

---

## 📞 SUPPORT

```
1. docs/TROUBLESHOOTING.md   ← Check here first
2. GitHub Issues             ← Bug reports
3. GitHub Discussions        ← Questions (if enabled)
4. r/unixporn                ← Community support
```

---

## 🏆 PROJECT STATUS

```
┌─────────────────────────────────────────────────┐
│                                                  │
│   VERSION:  1.0.0 (Ready for Release)           │
│   STATUS:   ████████████████████ 100%           │
│                                                  │
│   GTK Theme:       ✓ Complete                   │
│   Cursor Theme:    ✓ Complete                   │
│   Icon Muting:     ✓ Complete                   │
│   GDM Support:     ✓ Complete                   │
│   Documentation:   ✓ Complete (8 files)         │
│   GitHub Ready:    ✓ Yes (+ screenshots)        │
│                                                  │
│   Lines of Code:   1,418 (bash + python)        │
│   Total Files:     18 (excluding archive)       │
│   License:         MIT (OSI Approved)           │
│                                                  │
└─────────────────────────────────────────────────┘
```

---

## 🎯 ONE-LINE SUMMARY

**A production-ready, GitHub-publishable GNOME theme suite that transforms your desktop into the muted, oppressive aesthetic of Tarkovsky's 1979 film STALKER, featuring hexagonal cursors, 8,000+ color-muted icons, and complete GTK3/4 theming—all installable with a single command.**

---

```
     ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ 
    ⬡                                               ⬡
   ⬡   May your way be clear and your return        ⬡
  ⬡    certain, Stalker.                            ⬡
 ⬡                                                   ⬡
⬡     "Let everything that's been planned come       ⬡
 ⬡    true."                                         ⬡
  ⬡                                                 ⬡
   ⬡   🌿 Project Complete & GitHub Ready 🌿       ⬡
    ⬡                                              ⬡
     ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ 
```

---

**Created with reverence for the Zone**  
**v1.0.0 - Ready for the World**

