#!/usr/bin/env zsh

if is existing direnv; then
  eval "$(direnv hook zsh)"
fi
