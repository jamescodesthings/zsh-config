#!/usr/bin/env zsh

# set display
export DISPLAY=:0
# CMAKE
export PATH=$HOME/cmake-3.22/bin/:$PATH
# Python User Bin
export PATH=$HOME/.local/bin:$PATH

# VirtualENV
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/projects
# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
# export VIRTUALENVWRAPPER_SCRIPT=$HOME/.local/bin/virtualenvwrapper.sh
# source $HOME/.local/bin/virtualenvwrapper_lazy.sh

# ASDF Path
# export PATH=/home/james/.asdf/shims:$PATH

# fix for python import numpy
export OPENBLAS_CORETYPE=ARMV8

export BAT_PAGER=""

# Personal notes on using the jetson
export JET_HELP_FILE="$HOME/projects/jet-help.md"

# # Expand zsh history
# HISTFILE="$HOME/.zsh_history"
# HISTSIZE=10000000
# SAVEHIST=10000000
