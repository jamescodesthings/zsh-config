#!/usr/bin/env zsh

# Project root
export CUSTOM_DIR="$HOME/.custom"

# Where cheat reads sheets; default-if-unset so tests can override
export CHEATSHEET_DIR="${CHEATSHEET_DIR:-$HOME/cheatsheets}"

# Custom Function Directory
export FN_DIR="$CUSTOM_DIR/functions"

source $CUSTOM_DIR/custom_functions.zsh