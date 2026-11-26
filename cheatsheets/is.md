# is

> Predicates for shell conditionals. Exit 0 true, 1 false; every predicate is silent.
> `is not <predicate>` negates; `a`, `an` and `the` are allowed before it (`is an existing <path>`).

# Getting started

- `if is available brew; then brew install something; fi` - use it in a condition
- `is not empty "$var"` - negate

# Values and paths

- `is file <path>` - regular file; also `is dir`, `is link`, `is existing` (any type)
- `is readable <path>` - permission check; also `is writeable`, `is executable`
- `is older <a> <b>` - modification time; also `is newer`
- `is available <name>` - command in PATH; `is alias` for a defined alias
- `is empty "$var"` - empty or unset
- `is equal "$a" "$b"` - equal, as text or as numbers
- `is matching "<pattern>" "$val"` - whole value matches a regex; `is substring` if it contains the text
- `is number "$val"` - integer or decimal
- `is gt "$a" "$b"` - numeric compare; also `is lt`, `is ge`, `is le`
- `is true "$val"` - `true` or `0` counts as true; also `is false`

# Platform

- Platform checks: `is osx`, `is linux`, `is debian`, `is arch`, `is ubuntu`, `is windows`, `is gnome`, `is wayland`, `is x11`
- `is supported` - macOS or Debian family
- `is m1` - Apple Silicon; `is iterm` when running in iTerm
- `is tty` - Linux with no display (console)

# See also

- `cheat confirm`, `cheat deps` - other shell helpers
- `cheat zsh-config` - everything zsh-config gives you
