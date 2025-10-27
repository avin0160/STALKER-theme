# Contributing to STALKER Theme

Thank you for your interest in contributing to the STALKER Theme project! We welcome contributions that enhance the Zone aesthetic.

## How to Contribute

### Reporting Bugs

1. Check [existing issues](https://github.com/YOUR_USERNAME/STALKER-Theme-Project/issues) first
2. Create a new issue with:
   - Clear description of the problem
   - Steps to reproduce
   - Your system information (distro, GNOME version)
   - Screenshots if applicable
   - Error messages/logs

### Suggesting Features

Open an issue with the `enhancement` label:
- Describe the feature clearly
- Explain how it fits the STALKER aesthetic
- Provide mockups or examples if possible

### Pull Requests

1. **Fork the repository**
2. **Create a branch**: `git checkout -b feature/your-feature-name`
3. **Make your changes**
4. **Test thoroughly** on your system
5. **Commit with clear messages**
6. **Push and open a Pull Request**

## Development Guidelines

### Code Style

#### Bash Scripts
```bash
#!/bin/bash
# Script description and purpose

# Use descriptive variable names
THEME_NAME="STALKER-Theme"

# Add comments for complex operations
# Process all SVG icons and replace colors
find "$ICON_DIR" -name "*.svg" -type f | ...
```

#### Python Scripts
```python
#!/usr/bin/env python3
"""
Module description
"""

def function_name(parameter):
    """Clear docstring explaining function."""
    # Implementation
    pass
```

### Color Guidelines

All colors must fit the STALKER aesthetic:

**Allowed Color Families:**
- Greens: `#3a4d3e` → `#7a8a7d` → `#9ca69a`
- Reds: `#6d4545` → `#8b5a5a` → `#b87a7a`
- Beiges: `#a39e8f` → `#c9c5b4`
- Grey-Greens: `#6a7a6d` → `#7f9080`

**Avoid:**
- Bright blues, purples, magentas
- Neon or highly saturated colors
- Pure whites (use beige #c9c5b4)
- Pure blacks (use dark green #1a2d1e)

### Testing

Before submitting:

1. **Test on fresh install**:
```bash
# Remove existing themes
rm -rf ~/.themes/STALKER-Theme
rm -rf ~/.local/share/icons/Papirus-Stalker
rm -rf ~/.icons/Stalker-Hex-Minimal

# Run installer
bash install.sh
```

2. **Test on your distribution**:
   - Ubuntu 22.04+ / Fedora 38+ / Arch
   - GNOME 40+
   - Both Wayland and Xorg sessions

3. **Verify all components**:
   - GTK theme applies
   - Icons show muted colors
   - Cursors work in all states
   - Lock screen themes (if modified)

### Documentation

Update documentation when changing:
- Scripts: Update comments and README
- Colors: Update `docs/COLORS.md`
- Features: Update main README.md
- Troubleshooting: Add to `docs/TROUBLESHOOTING.md`

## Project Areas Needing Help

### High Priority
- [ ] KDE Plasma port
- [ ] XFCE port
- [ ] Firefox theme extension
- [ ] Terminal color schemes
- [ ] Sound theme (ambient Zone sounds)

### Medium Priority
- [ ] STALKER-themed wallpapers
- [ ] Conky/widget themes
- [ ] Bootloader themes (GRUB/Plymouth)
- [ ] More cursor variations

### Documentation
- [ ] Video installation tutorial
- [ ] More screenshots
- [ ] Translation to other languages
- [ ] Theme comparison images

## Aesthetic Philosophy

When contributing, keep in mind the STALKER film's visual philosophy:

1. **Desaturation**: Colors should be muted, never vibrant
2. **Survival**: Greens represent life in The Zone
3. **Danger**: Reds are faded, rusty, weathered
4. **Decay**: Beiges and greys show abandonment
5. **Minimalism**: Simple, tactical, functional design

### Good Examples
✅ Grey-green folder icons (survival)  
✅ Faded red error messages (danger without alarm)  
✅ Beige backgrounds (decay, age)  
✅ Minimal hexagonal cursors (tactical, functional)  

### Bad Examples
❌ Bright blue highlights (too cheerful)  
❌ Neon greens (not natural)  
❌ Pure white text (too harsh)  
❌ Gradient effects (too modern)  

## Commit Messages

Use clear, descriptive messages:

```
Good:
- "Add darker variant for window backgrounds"
- "Fix cursor hotspot offset for text cursor"
- "Update color palette in documentation"

Bad:
- "Update stuff"
- "Fix"
- "Changes"
```

### Commit Format
```
type(scope): Brief description

Longer explanation if needed.

Fixes #issue_number
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`

## Review Process

1. **Automated Checks**: Syntax validation (if implemented)
2. **Manual Review**: Maintainer tests on their system
3. **Aesthetic Check**: Fits STALKER visual philosophy
4. **Feedback**: Requested changes or approval
5. **Merge**: Accepted into main branch

## Code of Conduct

### Be Respectful
- Constructive criticism only
- Help new contributors
- Respect different skill levels

### Stay On Topic
- Keep discussions about the theme
- No off-topic debates
- STALKER film appreciation welcome

### Quality Over Speed
- Take time to test properly
- Document your changes
- Consider maintainability

## Questions?

- Open a GitHub Discussion
- Check existing issues
- Read the documentation first

## License

By contributing, you agree that your contributions will be licensed under the MIT License (see LICENSE file).

---

*"In The Zone, we help each other survive. Contribution is survival."*

**Good hunting, fellow Stalker.** 🌿
