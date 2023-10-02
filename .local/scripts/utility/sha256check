#!/usr/bin/env bash

# CLI script to check given sha against a file

echo "enter the sha hash: "
read hash
echo "enter path of file to check: "
read file
echo "============"

retrievedHash=($(shasum -a 256 ${file}))

if [ $hash == $retrievedHash ]; then
    echo "hashes match"
else 
    echo "==================="
    echo "hashes DO NOT match"
fi 

