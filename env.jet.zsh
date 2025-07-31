#!/usr/bin/env zsh

# set display
export DISPLAY=:0
# CMAKE
export PATH=$HOME/cmake-3.22/bin/:$PATH
# Python User Bin
export PATH=$HOME/.local/bin:$PATH

# fix for python import numpy
export OPENBLAS_CORETYPE=ARMV8

export BAT_PAGER=""

# Personal notes on using the jetson
export JET_HELP_FILE="$HOME/projects/jet-help.md"
