#!/usr/bin/env zsh

# Project root
export CUSTOM_DIR="$HOME/.custom"
# Custom Function Directory
export FN_DIR="$CUSTOM_DIR/functions"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DISABLE_TMUX=true

fpath=(${fpath[@]:1} $fpath[1])

source $CUSTOM_DIR/zsh_options.zsh
source $CUSTOM_DIR/custom_functions.zsh
source $CUSTOM_DIR/env.zsh

# Echo Color Output
source $CUSTOM_DIR/zpm-zsh-colors

source $CUSTOM_DIR/load_zinit.zsh
source $CUSTOM_DIR/p10k.prompt.zsh
source $CUSTOM_DIR/p10k.zsh

source $CUSTOM_DIR/plugins.zsh
source $CUSTOM_DIR/completions.zsh
source $CUSTOM_DIR/aliases.zsh

source $CUSTOM_DIR/load-direnv.zsh
source $CUSTOM_DIR/load-fzf.zsh
source $CUSTOM_DIR/configs/ls_colors/ls-colors.sh


if is existing $CUSTOM_DIR/private.zsh; then
  source $CUSTOM_DIR/private.zsh
fi
### End of Zinit's installer chunk
