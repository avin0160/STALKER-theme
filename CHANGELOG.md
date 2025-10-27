# Changelog

All notable changes to the STALKER Theme Project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2024-01-XX

### Added
- **Complete GTK 3/4 Theme System**
  - Muted color palette inspired by Tarkovsky's STALKER (1979)
  - Custom CSS for Nautilus file manager
  - Selection, link, and progress bar styling
  - Color variables: Greens (survival), Reds (danger), Beiges (decay)

- **Hexagonal X11 Cursor Theme**
  - Minimal hexagonal design with STALKER aesthetic
  - Bright green center dots for visibility (RGB: 0, 255, 100)
  - Traditional I-beam text cursor with theme colors
  - Complete resize cursors (8 directional variations)
  - Solid hexagonal nut/bolt drag-drop cursor with grip lines
  - Animated wait states: 16-frame breathing and 24-frame rotating
  - 60+ cursor files covering all states

- **Aggressive Icon Color Muting**
  - Processes 8,297 Papirus SVG icons in ~2 minutes
  - Converts all blues → grey-greens (18 color mappings)
  - Converts all purples → reds (10 color mappings)
  - Converts all cyans/teals → grey-greens (20 color mappings)
  - Converts bright yellows/oranges → beiges (8 color mappings)
  - Retains only greens, reds, and beiges per STALKER aesthetic

- **GDM Lock Screen Theme Support**
  - System-wide theme application
  - dconf configuration for GNOME Display Manager
  - Works on GNOME Xorg and Wayland sessions

- **Comprehensive Documentation**
  - Professional README with installation guide
  - COLORS.md: Complete color palette reference
  - CUSTOMIZATION.md: Detailed modification guide with code examples
  - TROUBLESHOOTING.md: Common issues and solutions
  - CONTRIBUTING.md: Contribution guidelines and code style

- **Automated Installation System**
  - One-click installer script (install.sh)
  - Force-apply script for immediate theme refresh
  - Dependency checking (python3-pil, xcursorgen, papirus-icon-theme)
  - Modular script architecture in scripts/ directory

- **Professional Project Structure**
  - Organized directories: scripts/, docs/, assets/, archive/
  - MIT License with acknowledgments
  - .gitignore for clean repository
  - GitHub-ready documentation

### Changed
- N/A (Initial release)

### Deprecated
- N/A (Initial release)

### Removed
- N/A (Initial release)

### Fixed
- N/A (Initial release)

### Security
- N/A (Initial release)

---

## Design Philosophy

The STALKER Theme Project embodies the visual language of Andrei Tarkovsky's 1979 film *Stalker*:

> *"Let everything that's been planned come true. Let them believe. And let them have a laugh at their passions."*

**Color Ideology:**
- **Greens**: Survival, the Zone's mutation, nature reclaiming ruins
- **Reds**: Danger, contamination, the boundaries of the known
- **Beiges**: Decay, abandonment, the passage of time
- **Grey-Greens**: The Zone itself, liminal spaces, uncertainty

**No Blues**: Blues represent hope, sky, water—concepts absent from the desolate Zone. All blues are converted to grey-greens, maintaining the theme's oppressive, muted atmosphere.

**Hexagonal Geometry**: The hexagon represents:
- Industrial decay (nuts, bolts, machinery)
- Honeycomb patterns (nature's efficiency)
- Warning signs (stop signs, hazard markers)
- The Zone's unnatural geometry

---

## Future Roadmap

Planned features for future releases:
- KDE Plasma theme port
- XFCE theme port
- Firefox/Chrome extension themes
- Terminal color schemes (Gnome Terminal, Alacritty, Kitty)
- STALKER-themed wallpaper collection
- Sound theme with ambient Zone audio
- Animated GTK4 transitions

---

## Attribution

This theme builds upon:
- **Papirus Icon Theme**: Base icon set (GPLv3)
- **Adwaita**: GNOME's default theme (LGPLv2.1)
- **STALKER (1979)**: Andrei Tarkovsky's film for visual inspiration

Created with reverence for the Zone. *"May your way be clear and your return certain."*
