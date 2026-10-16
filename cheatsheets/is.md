# is

> Predicates for shell conditionals. Exit 0 true, 1 false.
> `is not <predicate>` negates; `a`, `an` and `the` are allowed before it (`is an existing <path>`).

# Path

- `is file <path>`: regular file
- `is dir <path>`: directory
- `is link <path>`: symlink
- `is existing <path>`: exists, any type
- `is readable <path>`, `is writeable <path>`, `is executable <path>`
- `is older <a> <b>`, `is newer <a> <b>`: modification time

# Command

- `is available <command>`: in PATH
- `is alias <name>`: alias is defined

# String and number

- `is empty "$var"`: empty or unset
- `is equal "$a" "$b"`: equal, as text or as numbers
- `is matching "<regex>" "$val"`: whole value matches
- `is substring "<text>" "$val"`: value contains it
- `is number "$val"`: integer or decimal
- `is gt`, `is lt`, `is ge`, `is le` with `"$a" "$b"`: numeric compare
- `is true "$val"`, `is false "$val"`: `true` or `0` counts as true

# Platform

- `is osx`, `is linux`, `is debian`, `is arch`, `is ubuntu`, `is windows`
- `is supported`: macOS or Debian family
- `is m1`: Apple Silicon
- `is iterm`: running in iTerm
- `is tty`: Linux with no display (console)
- `is gnome`, `is wayland`, `is x11`

# Examples

- Negate:

`is not empty "$var"`

- In a condition:

`if is available brew; then brew install something; fi`
