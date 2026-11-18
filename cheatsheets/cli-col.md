# cli col

> Print a palette colour as an escape, for tools that colour their output.
> Truecolor when `COLORTERM` says so, the nearest of 256 colours otherwise, nothing in plain mode.

# Options

- `col <name>` - print the escape for a hue, `hue-NN`, role, `bold` or `reset`
- `-v VAR <name>` - set VAR instead of printing, saving a subshell
- `--hex <name>` - print the resolved `#rrggbb`, colour or not
- `--list` - every hue at its steps, then each role

# Palette

- Hues: red orange yellow lime green teal cyan sky blue indigo purple magenta pink grey white
- `hue-NN` - NN per cent of the hue laid over the background (0 to 100), so `grey-50` is dimmer
- Roles are aliases of hues: cmd tool target flag num heading marker prose dim ok info warn err tag-cmd tag-child
- `configs/palette/palette.conf` - the base; `key = value`, a value is `#rrggbb`, another key or `key-NN`
- `~/.config/zsh-config/palette.conf` - your override, wins per key

# Examples

- `col -v on err` - set a variable
- `col --list` - look at the whole palette
- `col --hex blue-75` - resolve a mix

# Notes

- Exit: 0 done, 1 unknown colour or alias loop, 2 bad option

# See also

- `cheat cli` - the top sheet
- `cheat cli sheets` - colour spans in a sheet
