#!/usr/bin/env zsh

export PATH="$HOME/.local/bin:$PATH"

export CHEATSHEET_DIR="/home/james/projects/personal/cheatsheets"

# eww
# pnpm
export PNPM_HOME="/home/james/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end