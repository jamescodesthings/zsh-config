#!/usr/bin/env zsh

export CUSTOM_DIR="$HOME/.custom"
export FN_DIR="$CUSTOM_DIR/functions"
export DISABLE_TMUX=true

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
source $CUSTOM_DIR/wrap-progress.zsh

source $CUSTOM_DIR/load-direnv.zsh
source $CUSTOM_DIR/load-fzf.zsh
source $CUSTOM_DIR/configs/ls_colors/ls-colors.sh


if is existing $CUSTOM_DIR/private.zsh; then
  source $CUSTOM_DIR/private.zsh
fi


export AI_CONFIG_DIR="/Users/jamesmacmillan/projects/personal/agent-forge"
[[ -f "$AI_CONFIG_DIR/zsh/aliases.zsh" ]] && source "$AI_CONFIG_DIR/zsh/aliases.zsh"

export READERR_DIR="$HOME/projects/readerr"
if [[ -f "$READERR_DIR/zsh/readerr.zsh" ]]; then
  source "$READERR_DIR/zsh/readerr.zsh"
else
  echo "${c[error]}error:${c[reset]} readerr: $READERR_DIR/zsh/readerr.zsh not found, clone github.com/jamescodesthings/readerr there"
fi

# bun completions
# `bun upgrade` appends its own version of this, with the home directory
# written out in full, whenever it cannot find one in this file.
if is existing "$HOME/.bun/_bun"; then
  source "$HOME/.bun/_bun"
fi
