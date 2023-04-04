#!/usr/bin/env zsh

fpath=($CUSTOM_DIR/completions $fpath)

autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
