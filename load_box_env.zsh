#!/usr/bin/env zsh

BOX=$(get-hostname)
BOX_ENV="$CUSTOM_DIR/env.$BOX.zsh"

DEBUG_LOAD_BOX=0

if is existing "$BOX_ENV"; then
  if is equal "$DEBUG_LOAD_BOX" "1"; then
    echo "$BOX_ENV exists, sourcing it"
  fi

  source $BOX_ENV

else
  if is equal "$DEBUG_LOAD_BOX" "1"; then
    echo "$BOX_ENV does not exist, no custom environment to source"
  fi
fi
