#!/usr/bin/env zsh


export ZINIT_HOME="$HOME/.zinit"
export ZINIT_DIR="$ZINIT_HOME/zinit.git"
export ZINIT_URL="https://github.com/zdharma-continuum/zinit.git"
export LOAD_METHOD="light"
export FORCE_REINSTALL=0

if (is not directory "$ZINIT_DIR" || is equal "1" "$FORCE_REINSTALL") && is available git; then
  echo "$c[success]Installing$c[reset] zinit"
  if is existing $ZINIT_DIR; then
    mv $ZINIT_DIR "$ZINIT_DIR-old"
  fi

  mkdir -p $ZINIT_HOME
  git clone --depth 1 $ZINIT_URL $ZINIT_DIR

  echo "$c[success]Installed$c[reset] zinit"
fi

[[ -f $ZINIT_DIR/zinit.zsh ]] || return 0
source "$ZINIT_DIR/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
