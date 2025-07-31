#!/usr/bin/env zsh

export PATH="$HOME/.bin:$PATH"
export PATH="$PATH:/opt/mssql-tools/bin"
export PATH="$PATH:/home/james/.cargo/bin"
export PATH="$PATH:/home/james/.local/bin"
export PATH="$PATH:/home/james/projects/personal/pico-8/pico-8"
export PATH="$HOME/.asdf/shims:$PATH"

export DEVKITARM="/opt/devkitpro/devkitARM"
export DEVKITPRO="/opt/devkitpro"
export PATH="$DEVKITARM/bin:$DEVKITPRO/tools/bin:$PATH"

alias ls='exa --group-directories-first'

export HAS_RUN_ENV=true

export ASDF_LUA_LINUX_READLINE=1
export GPT_HAS_NO_INTERACTION=1

export EC2_IP="10.117.141.208"
