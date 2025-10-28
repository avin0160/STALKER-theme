#!/bin/bash

# Create modern STALKER theme for Terminator terminal

echo "🎨 Creating STALKER theme for Terminator..."

# Ensure terminator config directory exists
mkdir -p ~/.config/terminator

# Backup existing config if it exists
if [ -f ~/.config/terminator/config ]; then
    cp ~/.config/terminator/config ~/.config/terminator/config.backup
    echo "📦 Backed up existing config"
fi

# Create or update terminator config with STALKER theme
cat > ~/.config/terminator/config << 'EOF'
[global_config]
  title_hide_sizetext = True
  title_transmit_bg_color = "#2d2d2d"
  title_receive_bg_color = "#5a6d5b"
  inactive_color_offset = 0.8

[keybindings]

[profiles]
  [[default]]
    background_color = "#1a1a1a"
    background_darkness = 0.95
    background_type = solid
    cursor_color = "#8b9b8c"
    cursor_color_fg = False
    font = Monospace 11
    foreground_color = "#e9e5d4"
    show_titlebar = False
    scrollbar_position = hidden
    palette = "#2d2d2d:#cc6666:#6f7e6f:#d4c5a0:#5a6d5b:#8b6f8b:#7a8a7d:#c9c5b4:#4d4d4d:#e06c75:#8b9b8c:#e9e5d4:#7a8a7d:#b58bb5:#8fa89f:#e9e5d4"
    use_system_font = False
    copy_on_selection = True
    
  [[STALKER]]
    background_color = "#1a1a1a"
    background_darkness = 0.95
    background_type = solid
    cursor_blink = True
    cursor_color = "#8b9b8c"
    cursor_color_fg = False
    font = Monospace 11
    foreground_color = "#e9e5d4"
    show_titlebar = False
    scrollbar_position = hidden
    palette = "#2d2d2d:#cc6666:#6f7e6f:#d4c5a0:#5a6d5b:#8b6f8b:#7a8a7d:#c9c5b4:#4d4d4d:#e06c75:#8b9b8c:#e9e5d4:#7a8a7d:#b58bb5:#8fa89f:#e9e5d4"
    use_system_font = False
    copy_on_selection = True
    
[layouts]
  [[default]]
    [[[window0]]]
      type = Window
      parent = ""
    [[[child1]]]
      type = Terminal
      parent = window0
      profile = STALKER

[plugins]
EOF

echo ""
echo "✅ STALKER Terminator theme created!"
echo ""
echo "🎨 STALKER Color Palette:"
echo "   Background:  #1a1a1a (dark grey)"
echo "   Foreground:  #e9e5d4 (beige)"
echo "   Cursor:      #8b9b8c (light green)"
echo "   Black:       #2d2d2d / #4d4d4d"
echo "   Red:         #cc6666 / #e06c75"
echo "   Green:       #6f7e6f / #8b9b8c (STALKER green)"
echo "   Yellow:      #d4c5a0 / #e9e5d4"
echo "   Blue:        #5a6d5b / #7a8a7d (green-blue)"
echo "   Magenta:     #8b6f8b / #b58bb5"
echo "   Cyan:        #7a8a7d / #8fa89f"
echo "   White:       #c9c5b4 / #e9e5d4"
echo ""
echo "🔄 Restart Terminator to apply the theme"
echo "   killall terminator && terminator &"
