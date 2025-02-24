#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory-path>"
  exit 1
fi

# Get the directory path and the last component of the file path
dir_path=$(dirname "$1")
file_name=$(basename "$1")
echo $dir_path
echo $file_name

# Create a directory with the name of the file (without extension) in the current directory
mkdir -p "$(pwd)/${dir_path}/${file_name}"

# Define the path for the new .tex file
new_tex_file="$(pwd)/${dir_path}/${file_name}/${file_name}.tex"

# Create a .tex file inside the newly created directory
touch "$new_tex_file"

# Append the contents of ./preamble/preamble.tex to the new .tex file
cat ./preamble/preamble.tex >> "$new_tex_file"

# Open the new .tex file in the default text editor
code "$new_tex_file"
