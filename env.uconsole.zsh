#!/usr/bin/env zsh

alias wifi="nmcli dev wifi list"
alias battery="upower -d"
alias bat=battery

# apt
alias apti="sudo apt install -y"
alias apts="apt search -n"

# apt
alias snapi="sudo snap install"
alias snaps="snap find"
alias snapr="sudo snap remove"

export PATH="/snap/bin:$PATH"
# export PATH="/home/james/apps/depot_tools:$PATH"
export PATH="$HOME/deps/depot_tools:${PATH}"

export DOCKER_HOST=unix:///run/user/1000/docker.sock

alias snap-desktop="sudo cp /var/lib/snapd/desktop/applications/*.desktop /usr/share/applications"
