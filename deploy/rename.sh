#!/bin/bash

# Assuming your files are in a directory named "folder_name"
folder_name="/home/ec2-user/server"

# Loop through all .jar files in the specified folder
for file in "$folder_name"/*.jar; do
    if [ -f "$file" ]; then  # Check if it's a regular file
        # Extract filename without extension
        filename=$(basename -- "$file" .jar)
        # Rename the file by appending something to the filename
        mv "$file" "$folder_name"/app.jar
        # If you want to keep the same filename, you can just remove the extension
        # mv "$file" "$folder_name"/"$filename"
    fi
done
