#!/usr/bin/env zsh

alias wifi="nmcli dev wifi list"
alias battery="upower -d"
alias bat=battery


export PATH="/snap/bin:$PATH"
# export PATH="/home/james/apps/depot_tools:$PATH"
export PATH="$HOME/deps/depot_tools:${PATH}"

export PICO8="/home/james/apps/pico-8/pico8_64"

export DOCKER_HOST=unix:///run/user/1000/docker.sock

alias snap-desktop="sudo cp /var/lib/snapd/desktop/applications/*.desktop /usr/share/applications"
