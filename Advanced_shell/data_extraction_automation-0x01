#!/bin/bash

# Check if data.json exists
if [ ! -f data.json ]; then
    echo "Error: data.json not found. Run get_pokemon.sh first."
    exit 1
fi

# Extract and format using jq, awk, and sed
NAME=$(jq -r '.name' data.json | sed 's/.*/\u&/')  # Capitalize name
HEIGHT=$(jq '.height' data.json | awk '{printf "%.1f", $1 / 10}')  # decimeters to meters
WEIGHT=$(jq '.weight' data.json | awk '{printf "%.1f", $1 / 10}')  # hectograms to kg
TYPE=$(jq -r '.types[0].type.name' data.json | sed 's/.*/\u&/')    # First type, capitalized

echo "$NAME is of type $TYPE, weighs ${WEIGHT}kg, and is ${HEIGHT}m tall."
