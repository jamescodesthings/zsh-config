#!/usr/bin/env zsh

export _Z_CMD="j"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

# Disable pager for commands that use it by default, I like to use the terminal's scrollback instead
# export PAGER=
# export DELTA_PAGER=


# Legacy

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

# Claude custom statusline
export CLAUDE_STATUSLINE_NERDFONT=1

# Source env specific to this environment
source $CUSTOM_DIR/load_box_env.zsh
