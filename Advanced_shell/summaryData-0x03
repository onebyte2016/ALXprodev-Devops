#!/bin/bash

# Directory where Pokémon JSON files are stored
DATA_DIR="pokemon_data"
OUTPUT_FILE="report.csv"

# Check if jq is available
if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed or not in your PATH."
    exit 1
fi

# Ensure output file starts fresh
echo "Name,Height(m),Weight(kg)" > "$OUTPUT_FILE"

# Loop through all JSON files
for FILE in "$DATA_DIR"/*.json; do
    if [ -f "$FILE" ]; then
        NAME=$(jq -r '.name' "$FILE" | sed 's/.*/\u&/')
        HEIGHT=$(jq '.height' "$FILE" | awk '{printf "%.1f", $1 / 10}')
        WEIGHT=$(jq '.weight' "$FILE" | awk '{printf "%.1f", $1 / 10}')
        echo "$NAME,$HEIGHT,$WEIGHT" >> "$OUTPUT_FILE"
    fi
done

# Confirm file was written
if [ -f "$OUTPUT_FILE" ]; then
    echo ""
    echo "✅ CSV report generated: $OUTPUT_FILE"
    cat "$OUTPUT_FILE"

    echo ""
    echo "📊 Calculating averages using awk..."

    awk -F',' 'NR>1 {h+=$2; w+=$3; c++} END {printf "\nAverage Height: %.2f m\nAverage Weight: %.2f kg\n", h/c, w/c}' "$OUTPUT_FILE"
else
    echo "❌ Failed to generate report.csv"
fi
