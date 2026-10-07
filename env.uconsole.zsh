#!/usr/bin/env zsh

alias wifi="nmcli dev wifi list"
alias battery="upower -d"

export DOCKER_HOST=unix:///run/user/1000/docker.sock
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/projects/pico8bin:$PATH"


export PICO8="$HOME/projects/pico8bin/pico8"

