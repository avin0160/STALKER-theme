from PIL import Image
import numpy as np
from collections import Counter

# Load the image
img = Image.open("download (1).jpg")
img = img.convert('RGB')

# Resize for faster processing
img_small = img.resize((100, 100))

# Get all pixels
pixels = list(img_small.getdata())

# Count color frequencies
color_counts = Counter(pixels)

# Get most common colors
most_common = color_counts.most_common(10)

print("=" * 60)
print("STALKER THEME - Color Palette")
print("=" * 60)
print("\nDominant Colors (RGB):")
for i, (color, count) in enumerate(most_common, 1):
    r, g, b = color
    hex_color = f"#{r:02x}{g:02x}{b:02x}"
    print(f"{i}. RGB({r:3d}, {g:3d}, {b:3d}) -> {hex_color} - {count} pixels")

# Calculate average colors for different regions
width, height = img.size

# Sky/background (top third)
sky_region = img.crop((0, 0, width, height // 3))
sky_pixels = list(sky_region.getdata())
sky_avg = tuple(np.mean(sky_pixels, axis=0).astype(int))

# Grass/foreground (bottom two-thirds)
grass_region = img.crop((0, height // 3, width, height))
grass_pixels = list(grass_region.getdata())
grass_avg = tuple(np.mean(grass_pixels, axis=0).astype(int))

print("\n" + "=" * 60)
print("Regional Color Averages:")
print("=" * 60)
print(f"Sky/Background:  RGB{sky_avg} -> #{sky_avg[0]:02x}{sky_avg[1]:02x}{sky_avg[2]:02x}")
print(f"Grass/Foreground: RGB{grass_avg} -> #{grass_avg[0]:02x}{grass_avg[1]:02x}{grass_avg[2]:02x}")

# Suggested theme colors
print("\n" + "=" * 60)
print("SUGGESTED THEME COLORS:")
print("=" * 60)
print("Background (dark):    #3a4d3e (dark green)")
print("Background (light):   #c9c5b4 (beige/cream)")
print("Foreground (text):    #2a3a2e (very dark green)")
print("Accent 1:             #5f7060 (muted green)")
print("Accent 2:             #9ca69a (gray-green)")
print("Highlight:            #6b5f7b (muted purple - from figure)")
print("Border:               #4a5a4d (medium green)")
print("Selection:            #7a8a7d (lighter green)")
