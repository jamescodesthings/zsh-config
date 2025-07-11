#!/usr/bin/env zsh

# Project root
export CUSTOM_DIR="$HOME/.custom"
# Custom Function Directory
export FN_DIR="$CUSTOM_DIR/functions"

# Lightweight indicator is used to avoid loading heavy plugins
# lightweight fn manages this
export LIGHTWEIGHT_INDICATOR="$HOME/.lightweight-sh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# todo: remove bash_colors
source $CUSTOM_DIR/bash_colors.zsh
source $CUSTOM_DIR/zsh_options.zsh
# source $CUSTOM_DIR/custom_functions.zsh
source $CUSTOM_DIR/env.zsh
source $CUSTOM_DIR/completions.zsh
source $CUSTOM_DIR/load_zinit.zsh
source $CUSTOM_DIR/load_omz.zsh
source $CUSTOM_DIR/fzf-key-bindings.zsh
source $CUSTOM_DIR/plugins.zsh
source $CUSTOM_DIR/load_iterm.zsh
source $CUSTOM_DIR/aliases.zsh
source $CUSTOM_DIR/completions.after.zsh

if is existing $CUSTOM_DIR/private.zsh; then
  source $CUSTOM_DIR/private.zsh
fi
### End of Zinit's installer chunk
### End of Zinit's installer chunk
