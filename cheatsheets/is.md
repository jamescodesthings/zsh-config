# is

> Predicate utility for shell conditionals. Returns 0 (true) or 1 (false).
> Supports is not <predicate> for negation.

# Path predicates

- Test if path is a regular file:

`is file <path>`

- Test if path is a directory:

`is dir <path>`

- Test if path is a symlink:

`is link <path>`

- Test if path exists (any type):

`is existing <path>`

- Test if path is readable / writeable / executable:

`is readable <path>`

# Command predicates

- Test if command is in PATH:

`is available <command>`

# String predicates

- Test if variable is empty/unset:

`is empty "$var"`

- Test if two values are equal:

`is equal "$a" "$b"`

- Test if value matches regex:

`is matching "^[0-9]+$" "$val"`

- Test if value contains substring:

`is substring "foo" "$val"`

# Numeric predicates

- Test if value is a number:

`is number "$val"`

- Greater than / less than:

`is gt "$a" "$b"`

- Greater than or equal / less than or equal:

`is ge "$a" "$b"`

# Platform predicates

- macOS / Linux / Apple Silicon / Arch:

`is osx` / `is linux` / `is m1` / `is arch`

- Running in iTerm / TTY:

`is iterm` / `is tty`

- Running in GNOME / Wayland / X11:

`is gnome` / `is wayland` / `is x11`

# File age predicates

- First path older than second:

`is older <path-a> <path-b>`

- First path newer than second:

`is newer <path-a> <path-b>`

# Negation

- Negate any predicate with not:

`is not empty "$var"`

- Use as condition in scripts:

`if is available brew; then brew install something; fi`
