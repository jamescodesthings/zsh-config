# dsp

> Stops every running Docker container, prunes the system and removes dangling volumes.
> [Destructive]{.warn .bold}: stopped containers, unused images, networks and build cache go.

# Getting started

- `dsp` - stop, prune, remove dangling volumes
- `dsp -a` - extra arguments go to `docker system prune`

# Options

- `[-h|--help]` - show this sheet
- `[--plain]` - no colour
- `[-q|--quiet|-v|--verbose]` - accepted, not passed to docker
- Exit: 1 when docker is missing

# See also

- `cheat docker` - docker aliases
- `cheat zsh-config` - everything zsh-config gives you
