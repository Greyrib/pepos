#!/bin/bash
# Script: generate_readme.sh
# Purpose: Generate README.md with <img> tags for all images in Pepo_Imgs/ as a grid

if [ ! -d "Pepo_Imgs" ]; then
  echo "Error: 'Pepo_Imgs' folder not found!"
  exit 1
fi

# Collect image files
shopt -s nullglob
images=(Pepo_Imgs/*.{png,jpg,jpeg,gif,webp,svg})
count=${#images[@]}

if [ "$count" -eq 0 ]; then
  echo "No images found in Pepo_Imgs/"
  exit 0
fi

# Calculate number of columns (ceil of sqrt(count)), without bc
cols=1
while [ $((cols * cols)) -lt $count ]; do
  cols=$((cols + 1))
done

# Start README.md
echo "# Image Gallery" > README.md
echo "" >> README.md

# Generate grid (rows of <img>)
row_count=0
for ((i=0; i<$count; i++)); do
  printf "<img src=\"%s\" alt=\"%s\" width=\"48\" height=\"48\"> " \
    "${images[$i]}" "$(basename "${images[$i]}")" >> README.md
  ((row_count++))

  if [ $row_count -eq $cols ]; then
    echo "" >> README.md
    row_count=0
  fi
done

# If last row wasn’t complete, newline
if [ $row_count -ne 0 ]; then
  echo "" >> README.md
fi

echo "README.md generated successfully with $count images in a $cols-column grid!"
