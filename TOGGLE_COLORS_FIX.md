# STALKER Theme - Toggle Colors Fix

## Problem
Toggle switches and file selections were showing **BLUE** instead of STALKER green, despite CSS overrides.

## Root Cause
- **GNOME Shell Quick Settings**: Uses inline JavaScript styles that override CSS
- **GTK File Selections**: Theme CSS had lower priority than default Adwaita colors

## Solutions Implemented

### 1. Toggle Switches (GNOME Shell Extension)
**Location**: `~/.local/share/gnome-shell/extensions/stalker-toggle-colors@theme/`

**How it works**:
- JavaScript extension that directly manipulates toggle elements
- Uses `.set_style()` to apply inline styles (highest CSS priority)
- Scans for `.quick-toggle` class elements every 5 seconds
- Connects to `notify::checked` signal to update on toggle state changes
- Forces colors:
  - Checked: `#5f7060` (STALKER green)
  - Unchecked: `#3a3a3a` (dark grey)
  - Hover: `#7f9080` (lighter green)

**Enable/Disable**:
```bash
# Enable
gnome-extensions enable stalker-toggle-colors@theme

# Disable
gnome-extensions disable stalker-toggle-colors@theme

# Check logs
journalctl -f | grep STALKER
```

### 2. File Selection Colors (GTK User CSS)
**Location**: `~/.config/gtk-3.0/gtk.css` and `~/.config/gtk-4.0/gtk.css`

**How it works**:
- User CSS files have **higher priority** than theme CSS
- Overrides `@define-color` variables
- Uses `!important` on all selection rules
- Applies to:
  - Icon view selections
  - List view selections  
  - Grid view selections
  - Nautilus/Files specific selectors

**Colors**:
```css
@define-color theme_selected_bg_color #5f7060;
@define-color theme_selected_fg_color #e9e5d4;
@define-color accent_bg_color #5f7060;
@define-color accent_color #5f7060;
```

**Apply changes**:
```bash
# Restart Files/Nautilus
killall nautilus && nautilus &

# Or just close and reopen Files app
```

## Files Modified

### Extension Files
- `~/.local/share/gnome-shell/extensions/stalker-toggle-colors@theme/metadata.json`
- `~/.local/share/gnome-shell/extensions/stalker-toggle-colors@theme/extension.js`

### GTK User CSS
- `~/.config/gtk-3.0/gtk.css`
- `~/.config/gtk-4.0/gtk.css`

### Theme Scripts
- `scripts/fix_toggle_colors.sh` - Script to create/enable extension

## Why CSS Alone Didn't Work

1. **GNOME Shell Priority**: Quick Settings uses JavaScript to set inline styles, which have higher specificity than CSS rules
2. **Theme Loading Order**: System theme CSS loaded after custom theme
3. **CSS Specificity**: Even with `!important`, inline styles override everything
4. **GTK Theme Priority**: Theme CSS has lower priority than user CSS in `~/.config/`

## Testing

### Toggle Switches
1. Open Quick Settings (top-right corner)
2. Toggle any switch (WiFi, Bluetooth, Notifications, etc.)
3. Should see **STALKER green** (`#5f7060`) when ON
4. Should see grey (`#3a3a3a`) when OFF

### File Selections
1. Open Files (Artifacts) app
2. Select multiple files (Ctrl+Click or drag)
3. Should see **STALKER green** highlight
4. Text should be light (`#e9e5d4`)

## Troubleshooting

### Toggles still blue?
```bash
# Check if extension is enabled
gnome-extensions list --enabled | grep stalker

# Check logs
journalctl -f | grep STALKER

# Re-enable extension
gnome-extensions disable stalker-toggle-colors@theme
gnome-extensions enable stalker-toggle-colors@theme

# Restart GNOME Shell
Alt+F2 → type 'r' → Enter
```

### Selections still blue?
```bash
# Check if user CSS exists
cat ~/.config/gtk-3.0/gtk.css

# Restart Files
killall nautilus && nautilus &

# Force GTK theme reload
gsettings set org.gnome.desktop.interface gtk-theme ''
gsettings set org.gnome.desktop.interface gtk-theme 'STALKER-Theme'
```

## Integration with Main Theme

These fixes are **separate from** but **compatible with** the main STALKER theme:
- Extension runs alongside GNOME Shell theme
- User CSS supplements theme CSS
- No conflicts - they work together

## Future Improvements

- [ ] Auto-detect new Quick Settings items
- [ ] Add color customization options
- [ ] Create uninstall script
- [ ] Package as standalone extension

## Technical Notes

**Why inline styles work**:
```javascript
toggle.set_style('background-color: #5f7060 !important;');
// Inline styles have specificity of 1,0,0,0
// CSS selectors max out at 0,1,0,0 or lower
```

**CSS Priority Order** (highest to lowest):
1. Inline styles (JavaScript `.set_style()`)
2. User CSS (`~/.config/gtk-3.0/gtk.css`)
3. Theme CSS (`~/.themes/STALKER-Theme/`)
4. System CSS (`/usr/share/themes/`)

---

**Created**: October 27, 2025  
**Status**: ✅ Working  
**Last Updated**: After GNOME Shell restart with extension enabled
