# STALKER Theme Project - GitHub Preparation

## Files to KEEP (Essential):
1. **create_minimal_hex_cursors.sh** (archive) - Main cursor creator
2. **create_stalker_gtk_theme.sh** - GTK theme generator
3. **mute_colors_fast.sh** - Aggressive color muting
4. **apply_theme_to_gdm.sh** - Apply to lock screen
5. **STALKER_THEME_COLORS.md** - Color palette reference
6. **extract_colors.py** - Color extraction tool

## Files to REMOVE (Duplicates/Outdated):
- apply_cursor_to_gdm.sh (superseded by apply_theme_to_gdm.sh)
- apply_stalker_colors.sh (old version)
- apply_theme_to_gdm_xorg.sh (incomplete)
- create_stalker_adwaita_cursors.sh (superseded by minimal hex)
- update_hex_minimal_cursors.sh (one-time enhancement, archived)
- mute_all_colors_aggressive.sh (superseded by mute_colors_fast.sh)
- CLEANUP_ANALYSIS.md (internal doc)
- CLEANUP_COMPLETE.md (internal doc)
- HEX_CURSOR_ENHANCED.md (internal doc)
- STALKER_CURSOR_GUIDE.md (will merge into main README)
- THEME_STATUS.md (will merge into main README)

## Archive folder:
- Keep for reference but don't include in main docs
- Or remove entirely for cleaner repo

## New Structure:
```
STALKER-Theme-Project/
 README.md                    # Main documentation
 LICENSE                      # Open source license
 install.sh                   # One-click installer
 docs/
   ├── COLORS.md               # Color palette
   ├── CUSTOMIZATION.md        # How to customize
   └── TROUBLESHOOTING.md      # Common issues
 scripts/
   ├── create_gtk_theme.sh
   ├── create_cursor_theme.sh
   ├── apply_color_muting.sh
   └── apply_to_gdm.sh
 assets/
   └── screenshots/            # For README
 .github/
 FUNDING.yml (optional)    
```
