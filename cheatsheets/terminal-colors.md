# terminal-colors

> The palette is the only colour path: `col` prints an escape, `say` prints a status line.
> Never write raw ANSI codes in a tool.

# Getting started

- `col --list` - show every hue and role in the palette
- `test-color-24bit` - 24-bit gradient, to check truecolor works
- `cheat cli col` - the `col` reference

# Usage

- `say ok done` - a success line in the `ok` colour
- `say warn careful` - a warning line
- `say fail broken` - an error line on stderr
- `col -v VAR cmd` - put the `cmd` escape in a variable, no subshell

# See also

- `cheat cli` - the helper library
- `cheat test-color-24bit` - the truecolor ramps
- `cheat zsh-config` - everything zsh-config gives you
