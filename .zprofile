#!/usr/bin/env zsh

# macOS /etc/zprofile runs path_helper after .zshenv and pushes the system
# paths to the front, so put ours back.
_ZSH_CONFIG_PATH_FRONT=1
source "${${(%):-%x}:A:h}/path.zsh"
unset _ZSH_CONFIG_PATH_FRONT
