#!/usr/bin/env zsh

# Completions for after plugins.zsh has run.
# Ensures things like terraform completions work

# Terraform
if is available terraform; then
  complete -o nospace -C $(asdf which terraform) terraform
fi
