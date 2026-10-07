#!/usr/bin/env zsh

# Sourced from .zshenv and .zprofile, so it runs in every zsh, more than once.
# Idempotent, silent, and no forks: only [[ -d ]] tests.
typeset -U path

[[ -d $HOME/.local/bin ]] || mkdir -p $HOME/.local/bin

_path_new=()
for _p in $HOME/.local/bin $HOME/.bin ${ASDF_DATA_DIR:-$HOME/.asdf}/shims; do
  [[ -d $_p ]] && _path_new+=($_p)
done

# Homebrew: Apple silicon, then Intel macOS, then Linuxbrew
for _p in /opt/homebrew /usr/local /home/linuxbrew/.linuxbrew; do
  # /usr/local is only Homebrew on macOS; on Linux it is a system prefix
  [[ $_p == /usr/local && $OSTYPE != darwin* ]] && continue
  if [[ -d $_p/bin ]]; then
    _path_new+=($_p/bin)
    [[ -d $_p/sbin ]] && _path_new+=($_p/sbin)
    break
  fi
done

path=($_path_new $path)
unset _path_new _p
