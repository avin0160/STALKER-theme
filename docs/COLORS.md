# STALKER Theme - Color Palette Reference
# Based on the atmospheric image colors

## Primary Colors

### Backgrounds
- **Dark Background**: `#1e2920` (very dark green-gray) - for terminals, dark themes
- **Medium Background**: `#3a4d3e` (dark green) - for panels, sidebars
- **Light Background**: `#c9c5b4` (beige/cream) - for light themes

### Foreground/Text
- **Primary Text (Dark)**: `#2a3a2e` (very dark green) - on light backgrounds
- **Primary Text (Light)**: `#c9c5b4` (beige/cream) - on dark backgrounds
- **Secondary Text**: `#9ca69a` (gray-green) - for muted text

### Accents
- **Accent Green 1**: `#5f7060` (muted green) - buttons, highlights
- **Accent Green 2**: `#7a8a7d` (lighter green) - selections, hover states
- **Accent Purple**: `#6b5f7b` (muted purple) - from the figure, use for special highlights
- **Border/Separator**: `#4a5a4d` (medium green) - borders and dividers

## Terminal Color Palette (16 colors)

### Standard Colors (0-7)
0. Black: `#1e2920`
1. Red: `#8b5a5a` (muted red-brown)
2. Green: `#5f7060` (muted green)
3. Yellow: `#9ca69a` (gray-green)
4. Blue: `#4a5a4d` (medium green-gray)
5. Magenta: `#6b5f7b` (muted purple)
6. Cyan: `#7a8a7d` (light green-gray)
7. White: `#c9c5b4` (beige)

### Bright Colors (8-15)
8. Bright Black: `#3a4d3e`
9. Bright Red: `#b87a7a`
10. Bright Green: `#7f9080`
11. Bright Yellow: `#bcc6ba`
12. Bright Blue: `#6a7a6d`
13. Bright Magenta: `#8b7f9b`
14. Bright Cyan: `#9aaaa9d`
15. Bright White: `#e9e5d4`

## VS Code Configuration

Add to your `settings.json`:

```json
{
  "workbench.colorCustomizations": {
    "editor.background": "#1e2920",
    "editor.foreground": "#c9c5b4",
    "activityBar.background": "#2a3a2e",
    "sideBar.background": "#252f27",
    "statusBar.background": "#3a4d3e",
    "titleBar.activeBackground": "#2a3a2e",
    "editor.selectionBackground": "#4a5a4d88",
    "editor.lineHighlightBackground": "#2a3a2e88"
  },
  "terminal.integrated.colorScheme": {
    "background": "#1e2920",
    "foreground": "#c9c5b4",
    "cursor": "#7a8a7d"
  }
}
```

## GTK Theme Colors

For custom GTK theme development:
- Base: `#1e2920`
- Text: `#c9c5b4`
- Background: `#252f27`
- Foreground: `#c9c5b4`
- Selected Background: `#5f7060`
- Selected Text: `#e9e5d4`

## Icon Theme Colors

### Custom STALKER Icons
Use these colors for icon customization:

- **Primary Icon Color**: `#5f7060` (muted green) - main icon elements
- **Secondary Icon Color**: `#7a8a7d` (light green-gray) - secondary elements
- **Accent Icon Color**: `#6b5f7b` (muted purple) - highlights and accents
- **Folder Color**: `#5f7060` (muted green) - folder icons
- **Dark Elements**: `#3a4d3e` (dark green) - shadows and dark parts
- **Light Elements**: `#c9c5b4` (beige/cream) - light parts and text

### Color Replacements for Icon Recoloring

When recoloring existing icon themes, replace:
- Blue (#5294e2, #4285f4) → `#5f7060` (STALKER green)
- Orange (#ff6905) → `#6b5f7b` (STALKER purple)
- Red (#f44336) → `#5f7060` (STALKER green)
- Green (#4caf50) → `#7a8a7d` (STALKER accent)
- Purple (#9c27b0) → `#6b5f7b` (STALKER purple)
- Cyan (#00bcd4) → `#7a8a7d` (STALKER accent)

## Icon Installation Scripts

Three scripts are provided for icon customization:

1. **`create_stalker_icons.sh`** - Creates Papirus-Stalker theme with basic recoloring
2. **`create_advanced_icons.sh`** - Advanced recoloring with ImageMagick
3. **`quick_folder_colors.sh`** - Quick folder color change only

Run any script:
```bash
./create_stalker_icons.sh
```

Apply icon theme:
```bash
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Stalker-Custom'
```

## Usage Notes

This theme creates an atmospheric, muted aesthetic inspired by the post-apocalyptic
mood of the S.T.A.L.K.E.R. game series. The color palette emphasizes:
- Desaturated greens and grays
- Low contrast for reduced eye strain
- Earthy, natural tones
- Subtle purple accents for variety
- Cohesive icon and interface color scheme
