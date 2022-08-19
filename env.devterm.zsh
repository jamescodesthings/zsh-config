#!/usr/bin/env zsh

# Devterm Custom Environment Configuration
alias battery-raw="cat /sys/class/power_supply/axp20x-battery/capacity"
alias battery="echo \"$(battery-raw)%\""

alias visudo="sudo EDITOR=nano /usr/bin/visudo"

export CMAKE_GENERATOR=Ninja
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
export LDFLAGS=-fuse-ld=lld
