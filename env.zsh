#!/usr/bin/env zsh

# Projects Directory
export PROJECTS="$HOME/projects"

# ASDF dir
export ASDF_DIR="$HOME/.asdf"

# Pager (turn it off)
export PAGER='cat'

# Set the editor to sublime
if is available subl; then
  export EDITOR='subl -w'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if is existing $CUSTOM_DIR/.p10k.zsh; then
  source $CUSTOM_DIR/.p10k.zsh
fi

if is existing $HOME/.cargo/env; then
  source $HOME/.cargo/env
fi

# Ensures partial word completion does not skip over folders/dashes
export WORDCHARS=${WORDCHARS/\/}
export WORDCHARS=${WORDCHARS/-/}

export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# allows you to use the `[up, down]` key on a partial command
# to search your bash history for similar commands
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Source env specific to this environment
source $CUSTOM_DIR/load_box_env.zsh
