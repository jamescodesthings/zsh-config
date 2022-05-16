#!/usr/bin/env zsh

# Projects Directory
export PROJECTS="$HOME/projects"

# ASDF dir
export ASDF_DIR="$HOME/.asdf"

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

if is existing $HOME/.asdf/plugins/java/set-java-home.zsh; then
  source $HOME/.asdf/plugins/java/set-java-home.zsh
fi

export FIG_DIR=$CUSTOM_DIR/autocomplete

# Ensures partial word completion does not skip over folders/dashes
export WORDCHARS=${WORDCHARS/\/}
export WORDCHARS=${WORDCHARS/-/}

export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Source env specific to this environment
source $CUSTOM_DIR/load_box_env.zsh
