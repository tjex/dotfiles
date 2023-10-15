#!/bin/bash

# Check if at least one argument (the folder path) is provided

echo "this script replaces characters in ALL files within the given folder"
echo ""

if [ $# -lt 1 ]; then
	echo "Usage: $0 <folder_path>"
	exit 1
fi

# Check if the folder exists
arg="$1"

# Prompt the user for the character to replace
read -p "Character to replace (e.g., '-'): " char_to_replace
read -p "New (replacement) character (e.g., '_'): " replacement_char

# Check if the user provided a non-empty character
if [ -z "$char_to_replace" ]; then
    char_to_replace=" "
fi

if [ ! -d "$arg" ]; then
    echo "error: argument must be a folder (and also without glob/* pattern)"
fi


if [ -d "$arg" ]; then
	# Loop through all files in the folder
	for file in "$arg"/*; do
		if [ -f "$file" ]; then
			# Extract the file name without the path
			file_name=$(basename "$file")

			# Replace the user-specified character with underscores in the file name
			new_name="${file_name//$char_to_replace/$replacement_char}"

			# Rename the file
			mv "$file" "$arg/$new_name"

			echo "Renamed: $file_name -> $new_name"
		fi
	done

	echo "All files in $arg renamed."
fi

# if [ ! -d "$arg" ]; then
# 	if [ -f "$arg" ]; then
# 		# Extract the file name without the path
# 		file_name=$(basename "$arg")
#
# 		# Replace the user-specified character with underscores in the file name
# 		new_name="${file_name//$char_to_replace/$replacement_char}"
#
# 		# Rename the file
# 		mv "$arg" "$new_name"
#
# 		echo "Renamed: $file_name -> $new_name"
# 	fi
# fi
