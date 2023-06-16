#!/usr/bin/env zsh

# Load ZSH Custom Functions
export CUSTOM_FUNCTIONS="$CUSTOM_DIR/functions"
fpath=( "$CUSTOM_FUNCTIONS" "${fpath[@]}" )

# Array of custom functions
for file in $CUSTOM_FUNCTIONS/**; do
  # echo "Loading ${file##*/}"
  autoload -Uz ${file##*/}
done

# Load zsh move, copy and ln
autoload zmv
autoload zcp
autoload zln