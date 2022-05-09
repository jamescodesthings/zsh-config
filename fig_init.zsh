#!/usr/bin/env zsh


# Fig post block. Keep at the bottom of this file.

FIG_INIT_SCRIPT="$HOME/.fig/shell/zshrc.post.zsh"
if is existing $FIG_INIT_SCRIPT; then
  source $FIG_INIT_SCRIPT
fi
