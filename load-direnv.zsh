#!/usr/bin/env zsh

# Silent when direnv is missing.
if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
elif (( $+commands[asdf] )); then
  _direnv=$(asdf which direnv 2>/dev/null)
  [[ -n $_direnv ]] && eval "$($_direnv hook zsh)"
  unset _direnv
fi
