# is

> Predicates for shell conditionals. Exit 0 true, 1 false.
> `is not <predicate>` negates; `a`, `an` and `the` are allowed before it (`is an existing <path>`).

# Getting started

- `if is available brew; then brew install something; fi`: use it in a condition
- `is not empty "$var"`: negate
- Next: pick a predicate below

# Path

- `is file|dir|link|existing <path>`: regular file, directory, symlink, exists (any type)
- `is readable|writeable|executable <path>`
- `is older|newer <a> <b>`: modification time

# Command and text

- `is available <command>`: in PATH
- `is alias <name>`: alias is defined
- `is empty "$var"`: empty or unset
- `is equal "$a" "$b"`: equal, as text or as numbers
- `is matching "<regex>" "$val"`: whole value matches
- `is substring "<text>" "$val"`: value contains it
- `is number "$val"`: integer or decimal
- `is gt|lt|ge|le "$a" "$b"`: numeric compare
- `is true|false "$val"`: `true` or `0` counts as true

# Platform

- `is osx|linux|debian|arch|ubuntu|windows`
- `is supported`: macOS or Debian family
- `is m1`: Apple Silicon
- `is iterm`: running in iTerm
- `is tty`: Linux with no display (console)
- `is gnome|wayland|x11`

# More

- `cheat confirm`, `cheat deps`: other shell helpers
- `cheat zsh-config`: everything zsh-config gives you
