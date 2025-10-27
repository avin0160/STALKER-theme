# Customization Guide - STALKER Theme

This guide explains how to customize various aspects of the STALKER theme to fit your preferences.

## Color Customization

### GTK Theme Colors

Edit `scripts/create_gtk_theme.sh` and modify the color variables:

```bash
# Find these lines and adjust hex colors:
@define-color theme_bg_color #3a4d3e;           # Window backgrounds
@define-color theme_fg_color #c9c5b4;           # Text color
@define-color theme_selected_bg_color #7a8a7d;  # Selected items
@define-color theme_selected_fg_color #1a1d1a;  # Selected text
```

**Color Guidelines:**
- Keep colors desaturated for STALKER aesthetic
- Greens: #3a4d3e (dark) → #7a8a7d (light)
- Reds: #6d4545 (dark) → #b87a7a (light)
- Beiges: #a39e8f (mid) → #c9c5b4 (light)

### Icon Color Mappings

Edit `scripts/apply_color_muting.sh` to change which colors get replaced:

```bash
# Find the sed command section and modify color mappings:
-e 's/#0000ff/#7f9080/gI' \  # Blue → Grey-green
-e 's/#ff0000/#8b5a5a/gI' \  # Red → STALKER red
```

**Add New Mappings:**
```bash
# To replace a specific color:
-e 's/#original_color/#stalker_color/gI' \
```

## Cursor Customization

Edit `scripts/create_cursor_theme.sh`:

### Cursor Size
```python
# Find this line:
def create_minimal_pointer(size=32):

# Change to:
def create_minimal_pointer(size=48):  # Larger cursors
```

### Green Dot Color
```python
# Find this line:
BRIGHT_GREEN = (0, 255, 100, 255)  # Very bright green

# Change to:
BRIGHT_GREEN = (100, 200, 100, 255)  # Softer green
BRIGHT_GREEN = (255, 0, 0, 255)      # Red instead
BRIGHT_GREEN = (200, 200, 200, 255)  # Grey/white
```

### Remove Green Dots
```python
# Find and comment out lines like:
# draw.ellipse([center_x-1.5, center_y-1.5, center_x+1.5, center_y+1.5], fill=BRIGHT_GREEN)
```

### Animation Speed
```bash
# In the cursor config sections, adjust frame delays:

# Breathing animation - slower:
32 16 16 loading-breath-00.png 100  # Was 75ms, now 100ms

# Rotating animation - faster:
32 16 16 loading-rotate-00.png 40   # Was 60ms, now 40ms
```

### Hexagon Line Thickness
```python
# Find this function:
def draw_minimal_hexagon(draw, center_x, center_y, size, color, line_width=2, filled=False):

# Change line_width parameter:
line_width=3  # Thicker lines
line_width=1  # Thinner lines
```

## Icon Theme Customization

### Keep Some Blue Colors

If you want to keep certain blues:

1. Edit `scripts/apply_color_muting.sh`
2. Remove specific color mappings:

```bash
# Comment out blues you want to keep:
# -e 's/#2196f3/#7f9080/gI' \  # Keep this blue
-e 's/#0000ff/#7f9080/gI' \    # Still replace this one
```

### Add More Color Replacements

```bash
# Add to the sed command:
-e 's/#your_color/#stalker_replacement/gI' \
```

### Folder Colors

Folder colors are set in the GTK theme. Edit `scripts/create_gtk_theme.sh`:

```css
/* Nautilus (file manager) specific styling */
.nautilus-window sidebar row:selected {
    background-color: #7a8a7d;  /* Change folder highlight color */
}
```

## GDM/Lock Screen

Edit `scripts/apply_to_gdm.sh` to change which components get applied:

```bash
# Comment out lines to skip certain parts:

# Skip GTK theme copy:
# sudo cp -r ~/.themes/STALKER-Theme/* /usr/share/themes/STALKER-Theme/

# Skip icon theme copy:
# sudo cp -r ~/.local/share/icons/Papirus-Stalker/* /usr/share/icons/Papirus-Stalker/
```

## Advanced: Custom Cursor Designs

### Create New Cursor Types

Add to `scripts/create_cursor_theme.sh`:

```python
def create_my_custom_cursor(size=32):
    """My custom cursor design"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    center_x, center_y = size // 2, size // 2
    
    # Your custom drawing code here
    draw.ellipse([center_x-5, center_y-5, center_x+5, center_y+5], 
                fill=BRIGHT_GREEN)
    
    return add_soft_glow(img)

# Then in save_cursor_images function:
create_my_custom_cursor(32).save(f"{output_dir}/my_cursor.png")
```

### Different Animation Styles

```python
def create_pulse_animation(size=32, frame=0, total_frames=12):
    """Custom pulsing animation"""
    pulse = (frame / total_frames)  # 0 to 1
    opacity = int(100 + (pulse * 155))  # Fade in/out
    
    # Draw with varying opacity
    color = STALKER_PRIMARY[:3] + (opacity,)
    # ... your drawing code
```

## Reapplying After Changes

After modifying any script, run it again:

```bash
# GTK theme changes:
bash scripts/create_gtk_theme.sh
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
gsettings set org.gnome.desktop.interface gtk-theme 'STALKER-Theme'

# Cursor changes:
bash scripts/create_cursor_theme.sh
gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex-Minimal'

# Icon changes:
bash scripts/apply_color_muting.sh
gtk-update-icon-cache ~/.local/share/icons/Papirus-Stalker

# Lock screen changes:
sudo bash scripts/apply_to_gdm.sh
```

## Tips

1. **Test Before Committing**: Make small changes and test immediately
2. **Backup First**: Copy scripts before modifying
3. **Use Version Control**: Git commit after successful changes
4. **Check Syntax**: Bash scripts and Python need proper syntax
5. **Restart Apps**: Most changes require restarting applications

## Examples

### Darker Theme
```bash
# In create_gtk_theme.sh, use darker greens:
@define-color theme_bg_color #1a2d1e;     # Much darker
@define-color theme_fg_color #9ca69a;     # Lighter text for contrast
```

### No Animations
```bash
# In create_cursor_theme.sh, skip animation creation:
# Comment out these lines:
# for frame in range(16):
#     create_breathing_animation(32, frame, 16).save(...)
```

### Brighter Accents
```bash
# In create_gtk_theme.sh:
@define-color theme_selected_bg_color #90aa95;  # Brighter green
```

---

**Remember**: The Zone respects those who respect it. Make changes carefully.
