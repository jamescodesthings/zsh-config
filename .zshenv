#!/usr/bin/env zsh

# Runs for every zsh, interactive or not. Prints nothing except the
# unsupported-system warning, and runs no slow commands.

# Project root
export CUSTOM_DIR="$HOME/.custom"

# Where cheat reads sheets; default-if-unset so tests can override. The old
# location inside this repo can linger in a long-lived parent (an old terminal), so it is replaced rather than kept.
if [[ -z "$CHEATSHEET_DIR" || "${CHEATSHEET_DIR:A}" == "${CUSTOM_DIR:A}"/* ]]; then
  export CHEATSHEET_DIR="$HOME/cheatsheets"
fi

# Custom Function Directory
export FN_DIR="$CUSTOM_DIR/functions"

source $CUSTOM_DIR/custom_functions.zsh

if [[ ! ( $OSTYPE == darwin* || -f /etc/debian_version ) && -o interactive ]]; then
  print -u2 "warning: this config is built for macOS and Debian; get the clanker to port it"
fi

# PATH
export PROJECTS="$HOME/projects"
export ASDF_DATA_DIR="$HOME/.asdf"
export ASDF_DIR="$ASDF_DATA_DIR"
source $CUSTOM_DIR/path.zsh

# Common variables
if (( $+commands[micro] )); then
  export EDITOR="micro"
  export VISUAL="micro"
fi
export BAT_THEME="Solarized (dark)"
export MICRO_TRUECOLOR=1
export HOMEBREW_NO_AUTO_UPDATE=1

# Personal, uncommitted
[[ -f $CUSTOM_DIR/private.zsh ]] && source $CUSTOM_DIR/private.zsh

# Project drop-ins: variables and PATH only
for _f in $CUSTOM_DIR/projects/*.env.zsh(N); do
  source $_f
done
unset _f
