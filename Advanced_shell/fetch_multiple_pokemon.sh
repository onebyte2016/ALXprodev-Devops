#!/bin/bash

# Directory to save JSON files
OUTPUT_DIR="pokemon_data"
POKEMON_LIST=("bulbasaur" "ivysaur" "venusaur" "charmander" "charmeleon")

# Create directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through the Pokémon list
for POKEMON in "${POKEMON_LIST[@]}"
do
    echo "Fetching data for $POKEMON..."

    RESPONSE=$(curl -s -w "%{http_code}" "https://pokeapi.co/api/v2/pokemon/$POKEMON" -o "$OUTPUT_DIR/$POKEMON.json.tmp")
    HTTP_STATUS=${RESPONSE: -3}  # Get the last 3 characters (status code)

    if [ "$HTTP_STATUS" == "200" ]; then
        mv "$OUTPUT_DIR/$POKEMON.json.tmp" "$OUTPUT_DIR/$POKEMON.json"
        echo "Saved data to $OUTPUT_DIR/$POKEMON.json ✅"
    else
        echo "Failed to fetch data for $POKEMON. Status: $HTTP_STATUS ❌"
        rm -f "$OUTPUT_DIR/$POKEMON.json.tmp"
    fi

    sleep 2  # Delay between requests to avoid rate limiting
done
