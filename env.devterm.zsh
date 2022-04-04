#!/usr/bin/env zsh

# Devterm Custom Environment Configuration

alias battery-raw="cat /sys/class/power_supply/axp20x-battery/capacity"
alias battery="echo \"$(battery-raw)%\""
