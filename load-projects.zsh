#!/usr/bin/env zsh

# Interactive project drop-ins: projects/<name>.zsh, except *.env.zsh which
# .zshenv already sourced.
for _f in $CUSTOM_DIR/projects/*.zsh(N); do
  [[ $_f == *.env.zsh ]] && continue
  source $_f
done
unset _f
