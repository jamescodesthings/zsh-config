#!/usr/bin/env zsh

OMZ_DEBUG=0

# Libraries to load
OMZ_LIBS=(
  history
  directories
  git
)

# Plugins to load
OMZ_PLUGINS=(
  common-aliases
  dircycle
  extract
  git
  # ripgrep # 404
  # pod #404?
  safe-paste
)

if is equal "$OMZ_DEBUG" "1"; then
    echo $c[cyan] Loading OMZ Plugins $c[reset]
  fi

#loads libs
for lib in $OMZ_LIBS; do
  if is equal "$OMZ_DEBUG" "1"; then
    echo $c[cyan] Lib: $c[white]$lib.zsh $c[reset]
  fi

  zinit snippet "OMZL::$lib.zsh"
done
#loads plugins
for plugin in $OMZ_PLUGINS; do
  if is equal "$OMZ_DEBUG" "1"; then
    echo $c[cyan] Plugin: $c[white]$plugin $c[reset]
  fi

  zinit snippet "OMZP::$plugin"
done

# Using carefulRM instead here
if alias rm 2>&1 > /dev/null; then
  unalias rm
fi

