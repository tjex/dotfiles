#!/usr/bin/env bash

# loops through all files in current directory and renames the file 
# if the first character matches user input
# eg: test.txt with input 't' = est.txt

read -p "charcter at start of file to remove: " char

if [[ -z $char  ]]; then
    char=" "
fi

for file in *; do
    if [[ -f "$file" ]] && [[ ${file::1} == "$char" ]]; then  # check if file is a regular file
        mv "$file" "${file:1}"
    fi
done

