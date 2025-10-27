# Troubleshooting - STALKER Theme

Common issues and solutions for the STALKER Theme.

## Theme Not Applying

### GTK Theme Not Visible

**Symptoms**: Windows still look like default Adwaita

**Solutions**:
```bash
# 1. Force theme reload
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
sleep 1
gsettings set org.gnome.desktop.interface gtk-theme 'STALKER-Theme'

# 2. Check if theme exists
ls ~/.themes/STALKER-Theme/

# 3. Recreate theme
bash scripts/create_gtk_theme.sh

# 4. Restart GNOME Shell (Xorg)
Alt+F2, type 'r', press Enter

# 5. Log out and log back in
```

### Icons Still Colorful

**Symptoms**: Icons remain blue/purple/bright

**Solutions**:
```bash
# 1. Check if icon theme is applied
gsettings get org.gnome.desktop.interface icon-theme
# Should output: 'Papirus-Stalker'

# 2. Re-run color muting
bash scripts/apply_color_muting.sh

# 3. Update icon cache
gtk-update-icon-cache ~/.local/share/icons/Papirus-Stalker

# 4. Force icon theme reload
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
sleep 1
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Stalker'

# 5. Restart applications
killall nautilus
```

### Cursor Not Changing

**Symptoms**: Cursor remains default Adwaita

**Solutions**:
```bash
# 1. Check cursor theme setting
gsettings get org.gnome.desktop.interface cursor-theme
# Should output: 'Stalker-Hex-Minimal'

# 2. Verify cursor files exist
ls ~/.icons/Stalker-Hex-Minimal/cursors/
# Should show many cursor files

# 3. Recreate cursors
bash scripts/create_cursor_theme.sh

# 4. Set cursor theme again
gsettings set org.gnome.desktop.interface cursor-theme 'Stalker-Hex-Minimal'

# 5. Log out and log back in (cursor changes need session restart)
```

## Lock Screen Issues

### Theme Not Applied to Lock Screen

**Symptoms**: Lock screen shows default blue Adwaita

**Solutions**:
```bash
# 1. Check if system themes exist
ls /usr/share/themes/STALKER-Theme/
ls /usr/share/icons/Papirus-Stalker/
ls /usr/share/icons/Stalker-Hex-Minimal/

# 2. Re-run GDM script with sudo
sudo bash scripts/apply_to_gdm.sh

# 3. Verify GDM configuration
cat /etc/dconf/db/gdm.d/99-stalker-theme

# 4. Update dconf database
sudo dconf update

# 5. Reboot (required for GDM changes)
sudo reboot
```

### Permission Denied

**Symptoms**: Cannot copy to /usr/share/

**Solution**:
```bash
# Use sudo:
sudo bash scripts/apply_to_gdm.sh
```

## Installation Issues

### Missing Dependencies

**Error**: `python3: command not found` or `xcursorgen: command not found`

**Solutions**:
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install python3 python3-pil xcursorgen papirus-icon-theme

# Fedora
sudo dnf install python3 python3-pillow xcursorgen papirus-icon-theme

# Arch
sudo pacman -S python python-pillow xorg-xcursorgen papirus-icon-theme
```

### PIL Import Error

**Error**: `ModuleNotFoundError: No module named 'PIL'`

**Solutions**:
```bash
# Ubuntu/Debian
sudo apt install python3-pil

# Fedora
sudo dnf install python3-pillow

# Arch
sudo pacman -S python-pillow

# Using pip (if above doesn't work)
pip3 install --user Pillow
```

### Papirus Not Found

**Error**: Papirus icon theme not found

**Solutions**:
```bash
# Install Papirus first
sudo apt install papirus-icon-theme  # Ubuntu/Debian
sudo dnf install papirus-icon-theme  # Fedora
sudo pacman -S papirus-icon-theme    # Arch

# Or download manually:
wget -qO- https://git.io/papirus-icon-theme-install | sh
```

## Performance Issues

### Icon Processing Too Slow

**Symptom**: `apply_color_muting.sh` takes forever

**Solutions**:
```bash
# Use the fast version (already default):
bash scripts/apply_color_muting.sh

# If still slow, process in background:
bash scripts/apply_color_muting.sh &
# Check progress:
ps aux | grep apply_color_muting

# Or skip color muting entirely:
# Just use GTK theme and cursors without icon processing
```

### Cursor Generation Fails

**Error**: PNG generation errors in create_cursor_theme.sh

**Solutions**:
```bash
# 1. Check Python Pillow installation
python3 -c "from PIL import Image, ImageDraw; print('PIL OK')"

# 2. Check write permissions
ls -ld /tmp/stalker-cursor-minimal
mkdir -p /tmp/stalker-cursor-minimal

# 3. Run with verbose output:
bash -x scripts/create_cursor_theme.sh 2>&1 | tee cursor_errors.log
```

## Display Issues

### Cursor Too Small/Large

**Solution**: Edit cursor size in `scripts/create_cursor_theme.sh`:
```python
# Find and change size parameter:
def create_minimal_pointer(size=32):  # Change 32 to 48 or 64
```

### Green Dot Too Bright

**Solution**: Edit color in `scripts/create_cursor_theme.sh`:
```python
# Find and modify:
BRIGHT_GREEN = (0, 255, 100, 255)  # Change to (100, 200, 100, 255)
```

### Theme Too Dark/Light

**Solution**: Adjust colors in `scripts/create_gtk_theme.sh`:
```bash
# Make lighter:
@define-color theme_bg_color #4a5d4e;  # Lighter background

# Make darker:
@define-color theme_bg_color #2a3d2e;  # Darker background
```

## Application-Specific Issues

### Flatpak Apps Not Themed

**Symptom**: Flatpak applications don't use STALKER theme

**Solutions**:
```bash
# Grant Flatpak apps access to themes
flatpak override --user --filesystem=~/.themes
flatpak override --user --filesystem=~/.icons

# Or per-app:
flatpak override --user --filesystem=~/.themes org.example.App
```

### Firefox/Chrome Not Themed

**Symptom**: Browser doesn't match theme

**Note**: Browsers use their own theming. For GNOME integration:
```bash
# Firefox: Enable GTK theme in about:config
# Set widget.use-xdg-desktop-portal.file-picker to 1

# Chrome: Use --gtk-version=4 flag or install extension
```

### VS Code Not Themed

**Symptom**: VS Code doesn't match STALKER colors

**Solution**: VS Code uses its own themes. Create a custom color theme or use a dark green theme from marketplace.

## Script Errors

### Bash Syntax Errors

**Error**: `unexpected token` or `command not found`

**Solutions**:
```bash
# Check Bash version:
bash --version  # Should be 4.0+

# Run with error checking:
bash -n scripts/script_name.sh  # Check syntax without running
bash -x scripts/script_name.sh  # Run with debug output
```

### Python Syntax Errors

**Error**: Python errors during cursor creation

**Solutions**:
```bash
# Check Python version:
python3 --version  # Should be 3.6+

# Test Python code:
python3 -m py_compile scripts/extract_colors.py
```

## Reset Everything

### Complete Reset

If everything is broken, start fresh:

```bash
# 1. Remove all STALKER themes
rm -rf ~/.themes/STALKER-Theme
rm -rf ~/.local/share/icons/Papirus-Stalker
rm -rf ~/.icons/Stalker-Hex-Minimal

# 2. Reset GNOME settings
gsettings reset org.gnome.desktop.interface gtk-theme
gsettings reset org.gnome.desktop.interface icon-theme
gsettings reset org.gnome.desktop.interface cursor-theme

# 3. Remove system themes (requires sudo)
sudo rm -rf /usr/share/themes/STALKER-Theme
sudo rm -rf /usr/share/icons/Papirus-Stalker
sudo rm -rf /usr/share/icons/Stalker-Hex-Minimal

# 4. Remove GDM config
sudo rm /etc/dconf/db/gdm.d/99-stalker-theme
sudo dconf update

# 5. Reinstall
bash install.sh
```

## Getting Help

If you're still having issues:

1. **Check GitHub Issues**: See if others have the same problem
2. **System Information**: Run `gnome-shell --version` and `uname -a`
3. **Error Logs**: Include full error messages
4. **Create Issue**: Open a GitHub issue with:
   - Your distribution (Ubuntu 22.04, Fedora 39, etc.)
   - GNOME version
   - Steps to reproduce
   - Error output

## Known Limitations

- **Wayland Lock Screen**: Some Wayland sessions prevent GDM theming
- **Snap Apps**: Snaps have restricted filesystem access to themes
- **Some Applications**: Apps with hardcoded colors won't respect theme
- **Terminal**: Terminal colors are separate (create custom terminal theme)

---

*"In The Zone, problems teach patience. Take your time, Stalker."*
