#!/bin/bash
# Script: generate_readme.sh
# Purpose: Generate README.md with <img> tags for all images in Pepo_Imgs/

# Exit if Pepo_Imgs doesn't exist
if [ ! -d "Pepo_Imgs" ]; then
  echo "Error: 'Pepo_Imgs' folder not found!"
  exit 1
fi

# Create README.md and add a title
echo "# Image Gallery" > README.md
echo "" >> README.md

# Loop through all image files in Pepo_Imgs
shopt -s nullglob
for img in Pepo_Imgs/*.{png,jpg,jpeg,gif,webp,svg}; do
  echo "<img src=\"$img\" alt=\"$(basename "$img")\" width=\"48\" height=\"48\">" >> README.md
done

echo "README.md generated successfully!"
