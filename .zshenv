#!/usr/bin/env zsh

# Project root
export CUSTOM_DIR="$HOME/.custom"

# Where cheat reads sheets; default-if-unset so tests can override. The old
# location inside this repo can linger in a long-lived parent (tmux, an old
# terminal), so it is replaced rather than kept.
if [[ -z "$CHEATSHEET_DIR" || "${CHEATSHEET_DIR:A}" == "${CUSTOM_DIR:A}"/* ]]; then
  export CHEATSHEET_DIR="$HOME/cheatsheets"
fi

# Custom Function Directory
export FN_DIR="$CUSTOM_DIR/functions"

source $CUSTOM_DIR/custom_functions.zsh