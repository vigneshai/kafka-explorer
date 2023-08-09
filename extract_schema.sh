#!/bin/bash

input_file="input.txt"
output_file="output.csv"

# Add headers to the output CSV file
echo "topic name,keyschema,valueschema" > "$output_file"

# Read each line from the input file
while IFS= read -r line; do
    # Extract topic name and replace '.' with '-'
    topic_name=$(echo "$line" | sed 's/\(.*\)-\(key\|value\)/\1/' | tr '.' '-')

    # Append to CSV with topic name, keyschema, and valueschema
    echo "$topic_name,$line" >> "$output_file"
done < "$input_file"

echo "CSV file generated: $output_file"
