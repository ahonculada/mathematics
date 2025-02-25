#!/bin/bash

get_dir_and_file_name() {
  local input_path="$1"
  # Prepend '/' if the input path does not start with it
  if [[ "$input_path" != /* ]]; then
    input_path="/$input_path"
  fi
  local dir_path=$(dirname "$input_path")
  local file_name=$(basename "$input_path")
  echo "$dir_path" "$file_name"
}

open_tex_file() {
  local input_path="$1"
  read dir_path file_name <<< $(get_dir_and_file_name "$input_path")
  code "$(pwd)/${dir_path}/${file_name}/${file_name}.tex"
}

delete_tex_file() {
  local input_path="$1"
  read dir_path file_name <<< $(get_dir_and_file_name "$input_path")
  rm -rf "$(pwd)/${dir_path}/${file_name}"
}

create_tex_file() {
  # Get the directory path and the last component of the file path
  read dir_path file_name <<< $(get_dir_and_file_name "$1")

  # Create a directory with the name of the file (without extension) in the current directory
  mkdir -p "$(pwd)/${dir_path}/${file_name}"

  # Define the path for the new .tex file
  new_tex_file="$(pwd)/${dir_path}/${file_name}/${file_name}.tex"

  # Create a .tex file inside the newly created directory
  touch "$new_tex_file"

  # Append the contents of ./preamble/preamble.tex to the new .tex file
  cat ./preamble/preamble.tex >> "$new_tex_file"

  # Open the new .tex file in the default text editor
  open_tex_file "$1"
}

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <create|open|remove> <directory-path>"
  exit 1
fi

# Determine action based on the first argument
case "$1" in
  create)
    if [ -z "$2" ]; then
      echo "Usage: $0 create <directory-path>"
      exit 1
    fi
    create_tex_file "$2"
    ;;
  open)
    if [ -z "$2" ]; then
      echo "Usage: $0 open <file-path>"
      exit 1
    fi
    open_tex_file "$2"
    ;;
  remove)
    if [ -z "$2" ]; then
      echo "Usage: $0 remove <file-path>"
      exit 1
    fi
    delete_tex_file "$2"
    ;;
  *)
    echo "Invalid action. Use 'create' or 'open'."
    exit 1
    ;;
esac
