#!/usr/bin/env zsh

# Set PROFILING_ZSH=2 will profile this script
if [[ "$PROFILING_ZSH" == "2" ]]; then
  zmodload zsh/datetime
  setopt PROMPT_SUBST
  PS4='+$EPOCHREALTIME %N:%i> '

  logfile=${PROFILE_LOG:-$(mktemp zsh_profile.XXXXXXXX)}
  echo "Profiling to $logfile"
  exec 3>&2 2>$logfile

  setopt XTRACE
fi

# Set PROFILING_ZSH=1 will profile this script
if [[ "$PROFILING_ZSH" == "1" ]]; then
  zmodload zsh/zprof
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Custom Functions
CUSTOM_DIR=$HOME/.custom

source $CUSTOM_DIR/bash_colors.zsh
source $CUSTOM_DIR/zsh_options.zsh
source $CUSTOM_DIR/custom_functions.zsh
source $CUSTOM_DIR/env.zsh
source $CUSTOM_DIR/load_zinit.zsh
source $CUSTOM_DIR/load_omz.zsh
source $CUSTOM_DIR/plugins.zsh
source $CUSTOM_DIR/load_iterm.zsh
# source $CUSTOM_DIR/lazy_load_nvm.zsh
# source $CUSTOM_DIR/load_nvm.zsh
# source $CUSTOM_DIR/load_asdf.zsh
source $CUSTOM_DIR/aliases.zsh

source $CUSTOM_DIR/completions.zsh
# load custom completions
source $CUSTOM_DIR/load_completions.zsh

# Should fix command completion
# export LANG=en_GB.UTF-8
# export LC_ALL=en_GB.UTF-8
# export LC_CTYPE=en_GB.UTF-8

# XXX: short circuit tabtab completion auto installation
# tabtab source for serverless package
# tabtab source for sls package
# tabtab source for slss package

# Set PROFILING_ZSH=1 will profile this script
if [[ "$PROFILING_ZSH" == "1" ]]; then
  zprof
fi

# Set PROFILING_ZSH=w will profile this script
if [[ "$PROFILING_ZSH" == "w" ]]; then
  unsetopt XTRACE
  exec 2>&3 3>&-
fi

