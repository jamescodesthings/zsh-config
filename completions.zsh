#!/usr/bin/env zsh

# The one compinit. Nothing else may call it.
fpath=($CUSTOM_DIR/completions $fpath)
[[ -f ${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf ]] && fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
[[ -d $HOME/.local/share/zsh/site-functions ]] && fpath=($HOME/.local/share/zsh/site-functions $fpath)

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Apply the compdefs zinit held back while plugins loaded
(( $+functions[zicdreplay] )) && zicdreplay -q
