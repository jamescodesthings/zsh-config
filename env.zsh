#!/usr/bin/env zsh

# Projects Directory
export PROJECTS="$HOME/projects"

# Custom bin directory
export PATH="$HOME/.bin:$PATH"

# ASDF dir
export ASDF_DATA_DIR="$HOME/.asdf"
export ASDF_DIR="$ASDF_DATA_DIR"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
if is existing "$ASDF_DATA_DIR/completions/_asdf"; then
  fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
  autoload -Uz compinit && compinit
fi

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

# Set the editor to sublime
if is available vim; then
  export EDITOR='vim'
elif is available subl; then
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

# NNN Plugins
export NNN_PLUG='j:autojump'

# Gcloud use local packages
export CLOUDSDK_PYTHON_SITEPACKAGES=1

export DEFAULT_MODEL=gpt-4o-mini

export GOOGLE_CLOUD_PROJECT=467061286120

# Source env specific to this environment
source $CUSTOM_DIR/load_box_env.zsh
