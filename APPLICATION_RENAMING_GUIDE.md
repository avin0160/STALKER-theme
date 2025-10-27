# STALKER Application Renaming Guide

## Overview
This document describes the STALKER-themed application naming system that maintains full compatibility with original GNOME application names.

## Renamed Applications

| Original Name | STALKER Name | Search Keywords |
|---------------|--------------|-----------------|
| **Settings** | **Zone** | Settings, Preferences, Configuration, Zone |
| **System Monitor** | **Command Center** | System, Process, Task, Manager, Command Center |
| **Appearance** | **Anomaly** | Appearance, Background, Theme, Anomaly |
| **Power** | **Depletion** | Power, Battery, Energy, Depletion |
| **About** | **Status Report** | About, System, Information, Status Report |
| **Notifications** | **Alert System** | Notifications, Alerts, Messages, Alert System |
| **Search** | **Scan** | Search, Find, Index, Scan |
| **Keyboard Shortcuts** | **Quick Routes** | Keyboard, Shortcuts, Hotkeys, Quick Routes |
| **Region & Language** | **Sector Config** | Language, Region, Locale, Sector Config |
| **Files (Nautilus)** | **Artifacts** | Files, Folder, Manager, Artifacts |

## How It Works

### Dual Search Functionality
All applications remain searchable by **both** their original and STALKER names through the `Keywords` field in `.desktop` files.

**Examples:**
- Type "Settings" → Opens **Zone**
- Type "Zone" → Opens **Zone**
- Type "Power" → Opens **Depletion**
- Type "Files" → Opens **Artifacts**

### Technical Implementation
Desktop files are created in `~/.local/share/applications/` with:
- `Name=` field set to STALKER name
- `Keywords=` field includes both original and STALKER terms
- `Comment=` field describes functionality

### Installation
```bash
# Run the renaming script
./scripts/rename_applications.sh

# Or during full installation
./install.sh
# Answer 'Y' when prompted about app renaming
```

### Revert to Original Names
```bash
# Remove custom desktop files
rm ~/.local/share/applications/gnome-*.desktop
rm ~/.local/share/applications/org.gnome.Nautilus.desktop

# Update database
update-desktop-database ~/.local/share/applications
```

## STALKER Name Meanings

- **Zone** - The forbidden area you must navigate (Settings)
- **Command Center** - Your tactical operations hub (System Monitor)
- **Anomaly** - Strange visual distortions in The Zone (Appearance)
- **Depletion** - Resources running dangerously low (Power)
- **Status Report** - Intel on your current equipment (About)
- **Alert System** - Warning system for Zone dangers (Notifications)
- **Scan** - Search The Zone for valuable items (Search)
- **Quick Routes** - Known safe paths through danger (Keyboard Shortcuts)
- **Sector Config** - Configure your territory settings (Region/Language)
- **Artifacts** - Valuable discoveries in The Zone (Files)

## Testing

1. Press **Super** (Windows) key
2. Type any STALKER name: `Zone`, `Depletion`, `Artifacts`
3. Also try original names: `Settings`, `Power`, `Files`
4. Both should work seamlessly!

## Files Modified

All desktop files are user-specific (no sudo required):
```
~/.local/share/applications/gnome-control-center.desktop
~/.local/share/applications/gnome-system-monitor.desktop
~/.local/share/applications/gnome-appearance-panel.desktop
~/.local/share/applications/gnome-power-panel.desktop
~/.local/share/applications/gnome-info-panel.desktop
~/.local/share/applications/gnome-notifications-panel.desktop
~/.local/share/applications/gnome-search-panel.desktop
~/.local/share/applications/gnome-keyboard-panel.desktop
~/.local/share/applications/gnome-region-panel.desktop
~/.local/share/applications/org.gnome.Nautilus.desktop
```

## Compatibility

- ✅ GNOME Shell search
- ✅ Application overview
- ✅ Dash/Dock
- ✅ Alt+Tab window switcher
-  Command line launchers
- ✅ All GNOME versions

## Philosophy

*"The Zone demands respect. We rename not to obscure, but to immerse. Every interaction with your system should remind you: you are in The Zone now."*

---

**Part of the STALKER Theme Project**  
*"Let everything that's been planned come true."*
