#!/bin/bash

# STALKER Theme - GitHub Cleanup Script
# Removes obsolete files and prepares project for upload

echo "🧹 Cleaning up STALKER Theme project for GitHub..."
echo ""

# Files to remove (obsolete/generated)
REMOVE_FILES=(
    "aggressive_blue_removal.sh"
    "create_advanced_icons.sh"
    "create_hex_cursors.sh"
    "create_minimal_hex_cursors.sh"
    "create_stalker_icons.sh"
    "create_system_ui_theme.sh"
    "download (1).jpg"
    "extract_colors.py"
    "quick_folder_colors.sh"
    "remove_rgb_blues.sh"
)

# Remove obsolete files from root
for file in "${REMOVE_FILES[@]}"; do
    if [ -f "$file" ]; then
        rm "$file"
        echo "✓ Removed: $file"
    fi
done

echo ""
echo "📁 Project structure:"
tree -L 2 -I 'archive|__pycache__|*.pyc' 2>/dev/null || ls -R

echo ""
echo "📊 Statistics:"
echo "   Scripts: $(find scripts/ -name '*.sh' | wc -l)"
echo "   Docs: $(find . -maxdepth 1 -name '*.md' | wc -l)"
echo "   Total size: $(du -sh . | cut -f1)"

echo ""
echo "✅ Cleanup complete!"
echo ""
echo "📦 Ready for GitHub upload!"
echo ""
echo "Next steps:"
echo "  1. Review git status"
echo "  2. Commit changes"
echo "  3. Push to repository"
