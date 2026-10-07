#!/usr/bin/env zsh

# macOS /etc/zprofile runs path_helper after .zshenv and pushes the system
# paths to the front, so put ours back.
source "${${(%):-%x}:A:h}/path.zsh"
