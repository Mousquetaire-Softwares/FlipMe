#!/bin/zsh

# Check if a filename was provided
if [[ -z "$1" ]]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Extract filename without extension
filename_no_ext="${1%.*}"

# Define output filenames
output_webm="${filename_no_ext}_rescaled.webm"
output_mp4="${filename_no_ext}_rescaled.mp4"

# Run ffmpeg commands
ffmpeg -i "$1" -vf scale=828:1792 "$output_webm"
ffmpeg -i "$1" -vf scale=828:1792 -preset slow -crf 18 "$output_mp4"

echo "Conversion completed: $output_webm and $output_mp4"
