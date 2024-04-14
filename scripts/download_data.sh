#!/bin/bash

# Check if a URL was passed as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# The URL from which to download the file, taken from the script's first argument
url="$1"

# Use basename and cut to extract the filename from the URL
filename=$(basename "$url" | cut -d "?" -f 1)

# Extract the part before ".tar.gz" for directory naming
directory_name=$(echo "$filename" | sed 's/.tar.gz//' | sed 's/.tar//')

# The base directory where you want to save the file
base_directory="data"

# Full path including the dynamically extracted directory name
full_directory="${base_directory}/${directory_name}"

# Create the directory if it doesn't exist
mkdir -p "$full_directory"

# Assuming $url, $full_directory, and $filename are already set and exported.

# Download the file with wget, saving it with the extracted filename in the specified directory
wget "$url" -O "${full_directory}/${filename}"

# Check the exit status of the last command (wget in this case)
if [ $? -eq 0 ]; then
    echo "Downloaded ${filename} to ${full_directory}/"
else
    echo "Failed to download ${filename}. Please check the URL or your network connection."
    exit 1  # Exit the script with a status of 1 to indicate an error.
fi
