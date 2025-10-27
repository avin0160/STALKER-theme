#!/bin/bash

# STALKER Theme - Application Renaming Script
# Renames GNOME applications to fit STALKER aesthetic
# Apps show ONLY STALKER names system-wide, but remain searchable by original names
# Local desktop files override system files - no duplicates!

echo "🎬 Renaming GNOME applications for STALKER theme..."
echo ""

# Create local applications directory
mkdir -p ~/.local/share/applications

# Counter for renamed apps
RENAMED=0

# Function to copy and modify system desktop file
copy_and_rename() {
    local system_file="$1"
    local local_file="$2"
    local new_name="$3"
    local keywords="$4"
    
    if [ -f "$system_file" ]; then
        # Copy system file to local
        cp "$system_file" "$local_file"
        
        # Replace Name= line with STALKER name
        sed -i "s/^Name=.*/Name=$new_name/" "$local_file"
        
        # Add/update Keywords to include original name
        if grep -q "^Keywords=" "$local_file"; then
            sed -i "s/^Keywords=.*/Keywords=$keywords/" "$local_file"
        else
            # Add Keywords after Name line
            sed -i "/^Name=/a Keywords=$keywords" "$local_file"
        fi
        
        return 0
    fi
    return 1
}

# 1. Settings → Zone
echo "📝 Settings → Zone"
# Try both possible filenames for Settings
for settings_file in "/usr/share/applications/org.gnome.Settings.desktop" \
                     "/usr/share/applications/gnome-control-center.desktop"; do
    if [ -f "$settings_file" ]; then
        copy_and_rename "$settings_file" \
                       ~/.local/share/applications/$(basename "$settings_file") \
                       "Zone" \
                       "Settings;Preferences;Configuration;Zone;Control;Panel;System;"
        RENAMED=$((RENAMED + 1))
        echo "  ✓ Settings → Zone"
        break
    fi
done

# 2. System Monitor → Command Center  
echo "📝 System Monitor → Command Center"
if copy_and_rename "/usr/share/applications/gnome-system-monitor.desktop" \
                   ~/.local/share/applications/gnome-system-monitor.desktop \
                   "Command Center" \
                   "System;Process;Task;Manager;Monitor;Performance;CPU;Memory;Command;Center;"; then
    RENAMED=$((RENAMED + 1))
    echo "  ✓ System Monitor → Command Center"
else
    echo "  ⊘ System Monitor not found"
fi

# 3. Appearance → Anomaly (Background settings)
echo "📝 Appearance → Anomaly"
# Try to find appearance/background panel
for panel_file in "/usr/share/applications/gnome-background-panel.desktop" \
                  "/usr/share/applications/gnome-appearance-properties.desktop"; do
    if [ -f "$panel_file" ]; then
        copy_and_rename "$panel_file" \
                       ~/.local/share/applications/$(basename "$panel_file") \
                       "Anomaly" \
                       "Appearance;Background;Theme;Wallpaper;Desktop;Anomaly;Look;Style;"
        RENAMED=$((RENAMED + 1))
        echo "  ✓ Appearance → Anomaly"
        break
    fi
done

# 4. Power → Depletion
echo "📝 Power → Depletion"  
if copy_and_rename "/usr/share/applications/gnome-power-panel.desktop" \
                   ~/.local/share/applications/gnome-power-panel.desktop \
                   "Depletion" \
                   "Power;Battery;Suspend;Sleep;Energy;Brightness;Depletion;Consumption;"; then
    RENAMED=$((RENAMED + 1))
    echo "  ✓ Power → Depletion"
fi

# 5. About → Status Report
echo "📝 About → Status Report"
if copy_and_rename "/usr/share/applications/gnome-info-panel.desktop" \
                   ~/.local/share/applications/gnome-info-panel.desktop \
                   "Status Report" \
                   "About;System;Information;Version;Hardware;Status;Report;Device;Specs;"; then
    RENAMED=$((RENAMED + 1))
    echo "  ✓ About → Status Report"
fi

# 6. Notifications → Alert System
echo "📝 Notifications → Alert System"
if copy_and_rename "/usr/share/applications/gnome-notifications-panel.desktop" \
                   ~/.local/share/applications/gnome-notifications-panel.desktop \
                   "Alert System" \
                   "Notifications;Alerts;Messages;Pop-ups;System;Banner;Alert;Warning;"; then
    RENAMED=$((RENAMED + 1))
    echo "  ✓ Notifications → Alert System"
fi

# 7. Search → Scan
echo "📝 Search → Scan"
if copy_and_rename "/usr/share/applications/gnome-search-panel.desktop" \
                   ~/.local/share/applications/gnome-search-panel.desktop \
                   "Scan" \
                   "Search;Find;Index;Results;Scan;Locate;Query;"; then
    RENAMED=$((RENAMED + 1))
    echo "  ✓ Search → Scan"
fi

# 8. Keyboard → Quick Routes
echo "📝 Keyboard Shortcuts → Quick Routes"
if copy_and_rename "/usr/share/applications/gnome-keyboard-panel.desktop" \
                   ~/.local/share/applications/gnome-keyboard-panel.desktop \
                   "Quick Routes" \
                   "Keyboard;Shortcuts;Keybindings;Hotkeys;Quick;Routes;Keys;Bindings;"; then
    RENAMED=$((RENAMED + 1))
    echo "  ✓ Keyboard → Quick Routes"
fi

# 9. Region → Sector Config
echo "📝 Region & Language → Sector Config"
if copy_and_rename "/usr/share/applications/gnome-region-panel.desktop" \
                   ~/.local/share/applications/gnome-region-panel.desktop \
                   "Sector Config" \
                   "Language;Region;Locale;Format;Translation;Sector;Config;Area;Zone;"; then
    RENAMED=$((RENAMED + 1))
    echo "  ✓ Region → Sector Config"
fi

# 10. Files (Nautilus) → Artifacts
echo "📝 Files → Artifacts"
if copy_and_rename "/usr/share/applications/org.gnome.Nautilus.desktop" \
                   ~/.local/share/applications/org.gnome.Nautilus.desktop \
                   "Artifacts" \
                   "folder;manager;explore;disk;filesystem;nautilus;files;artifacts;documents;"; then
    RENAMED=$((RENAMED + 1))
    echo "  ✓ Files → Artifacts"
fi

# Update desktop database
echo ""
echo "🔄 Updating desktop database..."
update-desktop-database ~/.local/share/applications 2>/dev/null

echo ""
echo "✅ Application renaming complete!"
echo ""
echo "📋 Renamed Applications ($RENAMED total):"
echo "  • Settings           → Zone"
echo "  • System Monitor     → Command Center"
echo "  • Appearance         → Anomaly (if available)"
echo "  • Power              → Depletion"
echo "  • About              → Status Report"
echo "  • Notifications      → Alert System"
echo "  • Search             → Scan"
echo "  • Keyboard Shortcuts → Quick Routes"
echo "  • Region & Language  → Sector Config"
echo "  • Files (Nautilus)   → Artifacts"
echo ""
echo "🎯 System Behavior:"
echo "  ✓ Apps show ONLY STALKER names everywhere"
echo "  ✓ No duplicate icons (local overrides system)"
echo "  ✓ Still searchable by original names"
echo ""
echo "🔍 Examples:"
echo "  • Type 'Settings' OR 'Zone' → Shows 'Zone' icon"
echo "  • Type 'Power' OR 'Depletion' → Shows 'Depletion' icon"
echo "  • Alt+Tab shows 'Zone', 'Artifacts', etc."
echo ""
echo "📝 Test it:"
echo "  Press Super (Windows) key and search"
echo ""
echo "🔙 To Revert:"
echo "  rm ~/.local/share/applications/gnome-*.desktop"
echo "  rm ~/.local/share/applications/org.gnome.Nautilus.desktop"
echo "  update-desktop-database ~/.local/share/applications"
echo ""
