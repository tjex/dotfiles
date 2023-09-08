#!/bin/bash

# if no arguments (destination folder)
if [ $# -eq 0 ]; then
 echo "no target folder was provided"
 exit 1
fi

# Prompt the user for the character to replace
read -p "Character to replace (e.g., '-'): " char_to_replace
read -p "New (replacement) character (e.g., '_'): " replacement_char

# Check if the user provided a non-empty character
if [ -z "$char_to_replace" ]; then
    echo "Character to replace cannot be empty."
    exit 1
fi

# Check if an argument is provided (the folder path)
if [ $# -ne 1 ]; then
    echo "Usage: $0 <folder_path>"
    exit 1
fi

folder_path="$1"

# Check if the folder exists
if [ ! -d "$folder_path" ]; then
    echo "Folder not found: $folder_path"
    exit 1
fi

# Loop through all files in the folder
for file in "$folder_path"/*; do
    if [ -f "$file" ]; then
        # Replace the user-specified character with underscores in each file name
        new_name="${file//$char_to_replace/$replacement_char}"
        
        # Rename the file
        mv "$file" "$new_name"
        
        echo "Renamed: $file -> $new_name"
    fi
done

echo "All files in $folder_path renamed."

