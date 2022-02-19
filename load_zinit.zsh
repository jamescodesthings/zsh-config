#!/usr/bin/env zsh


export ZINIT_HOME="$HOME/.zinit"
export ZINIT_DIR="$ZINIT_HOME/zinit.git"
export ZINIT_URL="https://git.io/zinit-install"
export LOAD_METHOD="light"
export FORCE_REINSTALL=0

if is not directory "$ZINIT_DIR" || is equal "1" "$FORCE_REINSTALL"; then
  clr_cyan 'Installing zinit'
  if is existing $ZINIT_DIR; then
    mv $ZINIT_DIR "$ZINIT_DIR-old"
  fi

  mkdir -p $HOME/.zinit
  sh -c "$(curl -fsSL $ZINIT_URL)"
fi

source "$ZINIT_DIR/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
