#!/usr/bin/env zsh

alias wifi="nmcli dev wifi list"
alias battery="upower -d"
alias bat=battery

export DOCKER_HOST=unix:///run/user/1000/docker.sock
export PATH="$HOME/.local/bin:$PATH"
export PATH="/home/james/projects/pico-8:$PATH"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
