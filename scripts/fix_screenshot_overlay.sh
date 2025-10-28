#!/bin/bash

# Fix grey screenshot overlay - make it more transparent with green tint

echo "🖼️  Fixing screenshot overlay..."

# Add screenshot overlay styling to GNOME Shell theme
cat >> ~/.themes/STALKER-Theme/gnome-shell/gnome-shell.css << 'ENDCSS'

/* Screenshot UI - Transparent with green tint */
.screenshot-ui-screen-screenshot,
.screenshot-ui-window-screenshot,
.screenshot-ui-area-screenshot {
  background-color: rgba(26, 30, 26, 0.3);
}

.screenshot-ui-shot-cast-container {
  background-color: rgba(26, 30, 26, 0.4);
}

.screenshot-ui-tooltip {
  background-color: rgba(42, 47, 42, 0.95);
  border: 1px solid #6f7e6f;
  color: #e9e5d4;
}

.screenshot-ui-capture-button {
  background-color: #6f7e6f;
  border: 1px solid #8b9b8c;
  color: #e9e5d4;
}

.screenshot-ui-capture-button:hover {
  background-color: #8b9b8c;
}

.screenshot-ui-capture-button:active {
  background-color: #5a6d5b;
}

.screenshot-ui-close-button {
  background-color: #3a3a3a;
  border: 1px solid #4d4d4d;
}

.screenshot-ui-close-button:hover {
  background-color: #4d4d4d;
}

/* Make the overlay less opaque */
.screenshot-ui-area-selector {
  background-color: rgba(0, 0, 0, 0.3);
}

.screenshot-ui-area-selector-mask {
  background-color: rgba(0, 0, 0, 0.5);
}

ENDCSS

echo "✅ Screenshot overlay fixed!"
echo ""
echo "🔄 Restart GNOME Shell to apply:"
echo "   Alt+F2 → type 'r' → Enter"
echo ""
echo "The screenshot overlay should now be more transparent with green accents 🟢"
