#!/usr/bin/env zsh

ASDF_DIRENV=$(asdf which direnv 2> /dev/null)

if [ -n "$ASDF_DIRENV" ]; then
  eval "$($ASDF_DIRENV hook zsh)"
else
  echo "direnv not found"
fi
