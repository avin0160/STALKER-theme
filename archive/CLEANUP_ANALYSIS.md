# STALKER Theme Project - File Cleanup Analysis

## Current Files (22 total)

### ✅ **ACTIVE & NECESSARY** (Keep These)

#### Core Scripts - Currently Used
1. **apply_stalker_colors.sh** (2.9K) - ⭐ MASTER SCRIPT
   - Applies complete theme (GTK + Icons)
   - Calls other active scripts
   - **KEEP - Main entry point**

2. **create_stalker_gtk_theme.sh** (8.1K)
   - Creates GTK theme for file manager & apps
   - Mutes blues, enhances greens/reds
   - **KEEP - Active component**

3. **mute_blues_enhance_greens_reds.sh** (7.3K)
   - Processes icon colors
   - Used by apply_stalker_colors.sh
   - **KEEP - Active component**

4. **create_stalker_adwaita_cursors.sh** (18K)
   - Creates 25% bigger cursors
   - Brighter grey + dark green
   - Currently applied cursor theme
   - **KEEP - Active cursor theme**

#### Documentation - Useful
5. **THEME_STATUS.md** (8.0K)
   - Complete overview of applied theme
   - Most comprehensive guide
   - **KEEP - Primary documentation**

6. **STALKER_CURSOR_GUIDE.md** (6.8K)
   - Cursor theme details
   - **KEEP - Cursor reference**

7. **STALKER_THEME_COLORS.md** (3.9K)
   - Color palette reference
   - Used by all scripts
   - **KEEP - Color reference**

### ⚠️ **REDUNDANT/LEGACY** (Can Remove)

#### Superseded Scripts
8. **aggressive_blue_removal.sh** (6.5K)
   - Older version of blue removal
   - Superseded by mute_blues_enhance_greens_reds.sh
   - **REMOVE - Outdated**

9. **remove_rgb_blues.sh** (5.7K)
   - Alternative blue removal approach
   - Not used in current workflow
   - **REMOVE - Unused**

10. **create_stalker_icons.sh** (4.4K)
    - Basic icon creator
    - Superseded by mute_blues_enhance_greens_reds.sh
    - **REMOVE - Outdated**

11. **create_advanced_icons.sh** (7.0K)
    - Advanced icon recoloring
    - Not part of current workflow
    - **REMOVE - Unused**

12. **quick_folder_colors.sh** (1.1K)
    - Quick folder color changer only
    - Limited functionality vs full icon script
    - **REMOVE - Too limited**

#### Unused Cursor Scripts
13. **create_hex_cursors.sh** (15K)
    - Hexagonal cursor design
    - Not currently used (using Adwaita-style instead)
    - **REMOVE - Unused variant**

14. **create_minimal_hex_cursors.sh** (19K)
    - Minimal hex cursors
    - Not currently used
    - **REMOVE - Unused variant**

#### Unused System Scripts
15. **create_system_ui_theme.sh** (11K)
    - GNOME Shell theme creator
    - Not part of current workflow
    - Functionality covered by create_stalker_gtk_theme.sh
    - **REMOVE - Redundant**

16. **install_complete_stalker_theme.sh** (8.3K)
    - Old master installer
    - Superseded by apply_stalker_colors.sh
    - **REMOVE - Outdated**

17. **install_stalker_theme.sh** (3.0K)
    - Basic installer
    - Superseded by apply_stalker_colors.sh
    - **REMOVE - Outdated**

#### Redundant Documentation
18. **CURSOR_THEME_GUIDE.md** (7.7K)
    - Guide for hex cursors (not used)
    - Covered by STALKER_CURSOR_GUIDE.md
    - **REMOVE - Outdated**

19. **STALKER_THEME_COMPLETE_GUIDE.md** (7.3K)
    - Older comprehensive guide
    - Superseded by THEME_STATUS.md
    - **REMOVE - Outdated**

20. **README.md** (3.1K)
    - Basic project readme
    - Outdated info, redundant with THEME_STATUS.md
    - **REMOVE - Outdated**

#### Utility Scripts
21. **extract_colors.py** (2.0K)
    - Color extraction from images
    - Utility tool, already extracted colors
    - **OPTIONAL - Keep if want to extract from new images**

#### Assets
22. **download (1).jpg**
    - Original STALKER reference image
    - **OPTIONAL - Keep for reference, or remove to save space**

## Cleanup Summary

### Files to KEEP (8)
1. ✅ apply_stalker_colors.sh
2. ✅ create_stalker_gtk_theme.sh
3. ✅ mute_blues_enhance_greens_reds.sh
4. ✅ create_stalker_adwaita_cursors.sh
5. ✅ THEME_STATUS.md
6. ✅ STALKER_CURSOR_GUIDE.md
7. ✅ STALKER_THEME_COLORS.md
8. ✅ extract_colors.py (optional utility)

### Files to REMOVE (14)
1. ❌ aggressive_blue_removal.sh
2. ❌ remove_rgb_blues.sh
3. ❌ create_stalker_icons.sh
4. ❌ create_advanced_icons.sh
5. ❌ quick_folder_colors.sh
6. ❌ create_hex_cursors.sh
7. ❌ create_minimal_hex_cursors.sh
8. ❌ create_system_ui_theme.sh
9. ❌ install_complete_stalker_theme.sh
10. ❌ install_stalker_theme.sh
11. ❌ CURSOR_THEME_GUIDE.md
12. ❌ STALKER_THEME_COMPLETE_GUIDE.md
13. ❌ README.md
14. ❌ download (1).jpg (optional)

## Space Savings
- Total removable: ~112 KB
- Reduction: 22 files → 8 files (64% reduction)
- Cleaner, more maintainable project

## Recommended Actions

### Option 1: Full Cleanup (Recommended)
```bash
# Create backup first
tar -czf stalker-theme-backup-$(date +%Y%m%d).tar.gz *.sh *.md *.py *.jpg

# Remove unnecessary files
rm aggressive_blue_removal.sh remove_rgb_blues.sh create_stalker_icons.sh \
   create_advanced_icons.sh quick_folder_colors.sh create_hex_cursors.sh \
   create_minimal_hex_cursors.sh create_system_ui_theme.sh \
   install_complete_stalker_theme.sh install_stalker_theme.sh \
   CURSOR_THEME_GUIDE.md STALKER_THEME_COMPLETE_GUIDE.md README.md \
   "download (1).jpg"
```

### Option 2: Archive Old Files
```bash
# Create archive directory
mkdir -p archive

# Move old files to archive
mv aggressive_blue_removal.sh remove_rgb_blues.sh create_stalker_icons.sh \
   create_advanced_icons.sh quick_folder_colors.sh create_hex_cursors.sh \
   create_minimal_hex_cursors.sh create_system_ui_theme.sh \
   install_complete_stalker_theme.sh install_stalker_theme.sh \
   CURSOR_THEME_GUIDE.md STALKER_THEME_COMPLETE_GUIDE.md README.md \
   "download (1).jpg" archive/
```

### Option 3: Keep Utilities Archive
```bash
# Archive old scripts but keep utilities
mkdir -p archive
mv aggressive_blue_removal.sh remove_rgb_blues.sh create_stalker_icons.sh \
   create_advanced_icons.sh quick_folder_colors.sh create_hex_cursors.sh \
   create_minimal_hex_cursors.sh create_system_ui_theme.sh \
   install_complete_stalker_theme.sh install_stalker_theme.sh \
   CURSOR_THEME_GUIDE.md STALKER_THEME_COMPLETE_GUIDE.md README.md \
   archive/
# Keep: extract_colors.py and download (1).jpg
```

## Final Project Structure (After Cleanup)

```
STALKER-Theme-Project/
├── apply_stalker_colors.sh              # MASTER SCRIPT
├── create_stalker_gtk_theme.sh          # GTK theme creator
├── mute_blues_enhance_greens_reds.sh    # Icon processor
├── create_stalker_adwaita_cursors.sh    # Cursor creator
├── THEME_STATUS.md                       # Main documentation
├── STALKER_CURSOR_GUIDE.md              # Cursor guide
├── STALKER_THEME_COLORS.md              # Color reference
└── extract_colors.py                     # Utility (optional)
```

Clean, focused, and maintainable! ✨
