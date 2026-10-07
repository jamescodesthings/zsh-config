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
    # What `brew shellenv` exports, without the fork
    export HOMEBREW_PREFIX=$_p
    export HOMEBREW_CELLAR=$_p/Cellar
    case $_p in
      /opt/homebrew) export HOMEBREW_REPOSITORY=$_p ;;
      /usr/local) export HOMEBREW_REPOSITORY=/usr/local/Homebrew ;;
      *) export HOMEBREW_REPOSITORY=$_p/Homebrew ;;
    esac
    # Idempotent: add only when not already present. MANPATH keeps its trailing colon.
    if [[ ":$MANPATH:" != *":$_p/share/man:"* ]]; then
      export MANPATH="$_p/share/man${MANPATH+:$MANPATH}:"
    fi
    if [[ ":$INFOPATH:" != *":$_p/share/info:"* ]]; then
      export INFOPATH="$_p/share/info${INFOPATH+:$INFOPATH}"
    fi
    break
  fi
done

path=($_path_new $path)

# JetBrains Toolbox launchers, last
[[ -d $HOME/Library/Application\ Support/JetBrains/Toolbox/scripts ]] && path+=("$HOME/Library/Application Support/JetBrains/Toolbox/scripts")
unset _path_new _p
