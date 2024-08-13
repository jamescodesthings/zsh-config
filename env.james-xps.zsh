#!/usr/bin/env zsh

export PATH="$HOME/.bin:$PATH"
export PATH="$PATH:/opt/mssql-tools/bin"
export PATH="$PATH:/home/james/.cargo/bin"
export PATH="$PATH:/home/james/.local/bin"

export DEVKITARM="/opt/devkitpro/devkitARM"
export DEVKITPRO="/opt/devkitpro"
export PATH="$DEVKITARM/bin:$DEVKITPRO/tools/bin:$PATH"

alias ls='exa --group-directories-first'

export HAS_RUN_ENV=true

