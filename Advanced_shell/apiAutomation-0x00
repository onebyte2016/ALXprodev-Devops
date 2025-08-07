#!/bin/bash

# Set URL and output files
POKEMON_NAME="pikachu"
API_URL="https://pokeapi.co/api/v2/pokemon/$POKEMON_NAME"
OUTPUT_FILE="data.json"
ERROR_FILE="errors.txt"

# Make API request
echo "Fetching data for $POKEMON_NAME..."

curl -s -w "%{http_code}" "$API_URL" -o "$OUTPUT_FILE.tmp" > status_code.txt
HTTP_STATUS=$(<status_code.txt)

if [ "$HTTP_STATUS" -eq 200 ]; then
    mv "$OUTPUT_FILE.tmp" "$OUTPUT_FILE"
    echo "Success: Data saved to $OUTPUT_FILE"
else
    echo "Error: Failed to fetch data for $POKEMON_NAME. HTTP Status: $HTTP_STATUS" >> "$ERROR_FILE"
    rm -f "$OUTPUT_FILE.tmp"
    echo "Failure: Logged error to $ERROR_FILE"
fi

# Cleanup
rm -f status_code.txt
