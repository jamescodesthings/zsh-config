#!/usr/bin/env zsh

# Sets auto notify settings.

export AUTO_NOTIFY_EXPIRE_TIME=20000
export AUTO_NOTIFY_IGNORE_FILE="$CUSTOM_DIR/.auto-notify-ignore.zsh"
AUTO_NOTIFY_IGNORE+=("docker-compose")
AUTO_NOTIFY_IGNORE+=("fzf")
AUTO_NOTIFY_IGNORE+=("ntl")
AUTO_NOTIFY_IGNORE+=("npmst")
AUTO_NOTIFY_IGNORE+=("nodemon")
AUTO_NOTIFY_IGNORE+=("tns")
AUTO_NOTIFY_IGNORE+=("lnav")
