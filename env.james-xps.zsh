#!/usr/bin/env zsh

export PATH="$HOME/.bin:$PATH"
export PATH="$PATH:/opt/mssql-tools/bin"

alias ls='exa --group-directories-first'

export HAS_RUN_ENV=true

GCLOUD_COMPLETIONS="/usr/share/google-cloud-sdk/completion.zsh.inc"
if [ -e "$GCLOUD_COMPLETIONS" ]; then
    source $GCLOUD_COMPLETIONS
fi