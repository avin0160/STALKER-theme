# Screenshots

This directory contains visual documentation of the STALKER Theme Project.

## Required Screenshots

To complete the project documentation, please add the following screenshots:

### 1. `desktop_overview.png`
**Full desktop screenshot showing:**
- Themed wallpaper (if using STALKER-inspired wallpaper)
- Top bar with system indicators
- Application launcher/dock
- Open windows showcasing GTK theme
- Desktop icons with color-muted Papirus icons

**Recommended resolution:** 1920x1080 or higher  
**File format:** PNG (for quality)

---

### 2. `file_manager.png`
**Nautilus/Files application screenshot showing:**
- Sidebar with folder navigation (icons should be muted greens/reds/beiges)
- Main file view with various file types
- Highlighted/selected files showing selection color (#6a7a6d)
- Breadcrumb navigation bar
- Toolbar buttons

**Capture:** Full window including title bar  
**Recommended content:** Mix of folders and files to showcase icon variety

---

### 3. `cursor_showcase.png`
**Composite image showing all cursor states:**

Use a tool like GIMP or create a grid showing:
- Default pointer (hexagon with green dot)
- Hand cursor (hovering over links)
- Text cursor (I-beam)
- Resize cursors (arrows in 4 directions)
- Drag-drop cursor (solid hexagonal nut with grip lines)
- Wait cursor (breathing or rotating animation frame)
- Crosshair cursor

**Layout:** Grid or horizontal arrangement with labels  
**Background:** Neutral or themed (greens/beiges)  
**Size per cursor:** ~64x64px display size minimum

---

### 4. `lock_screen.png`
**GDM lock screen showing:**
- Login screen with username/avatar
- Themed background
- System indicators (battery, network, etc.)
- Date/time display
- Overall muted color scheme

**Note:** Take screenshot after locking (Super+L) and unlocking, or use a screen recording tool that captures the lock screen

---

### 5. `color_palette.png` (Optional)
**Visual color palette showing:**
- All greens (Survival tones)
- All reds (Danger tones)
- All beiges (Decay tones)
- Grey-greens (Zone tones)
- Hex codes labeled beneath each swatch

**Tool:** Create using GIMP, Inkscape, or online color palette generator  
**Reference:** docs/COLORS.md for exact hex codes

---

## Screenshot Guidelines

**Quality:**
- PNG format (lossless)
- Minimum 1920x1080 resolution
- No compression artifacts
- Clear, readable text

**Content:**
- Remove personal information (real names, emails, etc.)
- Use example files/folders with generic names
- Ensure good lighting/contrast
- Show actual theme in use (not mockups)

**Tools:**
- `gnome-screenshot` - Built-in GNOME tool
- `scrot` - Command-line screenshot utility
- `flameshot` - Advanced screenshot tool with annotations
- `peek` - For GIF animations (optional for cursor showcase)

---

## Taking Screenshots

### Full Desktop
```bash
gnome-screenshot --delay=3
# Or press Print Screen key
```

### Active Window
```bash
gnome-screenshot --window --delay=3
# Or press Alt+Print Screen
```

### Selection Area
```bash
gnome-screenshot --area
# Or press Shift+Print Screen
```

### Lock Screen
```bash
# Lock screen (Super+L)
# Use phone camera or screen recording software
# Alternatively, use:
sudo killall gnome-screensaver  # After capturing
```

---

## Example Workflow

1. Apply theme: `./apply_theme_now.sh`
2. Restart session or log out/in
3. Open Nautilus with diverse files
4. Take desktop screenshot: `gnome-screenshot --delay=5`
5. Take Nautilus screenshot: Focus window, `gnome-screenshot --window --delay=3`
6. Create cursor composite in GIMP:
   - Import cursor PNGs from `/tmp/stalker_cursors/`
   - Arrange in grid
   - Label each cursor
   - Export as `cursor_showcase.png`
7. Lock screen (Super+L), use phone/second device to photograph
8. Save all images to this directory
9. Update main README.md with image links:
   ```markdown
   ![Desktop Overview](assets/screenshots/desktop_overview.png)
   ```

---

## Current Status

- [ ] desktop_overview.png
- [ ] file_manager.png
- [ ] cursor_showcase.png
- [ ] lock_screen.png
- [ ] color_palette.png (optional)

**Once screenshots are added, update this checklist and reference them in the main README.md!**

---

*"The Zone wants to be a mystery. Screenshots are forbidden... but necessary."*
