#!/usr/bin/env zsh

# OS-generic settings first, then the per-machine file. ${HOST%%.*} avoids
# forking get-hostname on every shell start.
if [[ $OSTYPE == darwin* ]]; then
  [[ -f $CUSTOM_DIR/env.osx.zsh ]] && source $CUSTOM_DIR/env.osx.zsh
else
  [[ -f $CUSTOM_DIR/env.linux.zsh ]] && source $CUSTOM_DIR/env.linux.zsh
fi

[[ -f $CUSTOM_DIR/env.${HOST%%.*}.zsh ]] && source $CUSTOM_DIR/env.${HOST%%.*}.zsh
