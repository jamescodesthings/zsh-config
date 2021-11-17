#!/usr/bin/env zsh

# Iterm2 Integration
if is-iterm && is file $CUSTOM_DIR/.iterm2_shell_integration.zsh; then
  source $CUSTOM_DIR/.iterm2_shell_integration.zsh
fi
