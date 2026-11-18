# log open

> View one log with timestamps dimmed, or open it in your editor.
> With no argument it picks with fzf on a terminal, and otherwise shows the latest.

# Options

- `last` - the latest log
- `~N` - the Nth log back, `~0` is last; a bare `N` works too, as zsh expands an unquoted `~N`
- `child` - the latest child log
- `<name>` - a file name, or part of one when it matches only one log
- `-e, --editor` - open in `$EDITOR` (vi when unset) instead of printing
- `--plain` - no colour

# Examples

- `log open last` - the latest log
- `log open 1` - the one before it
- `log open child --editor` - edit the latest child log

# Notes

- Exit: 0 done, 1 no such log, 2 bad option

# See also

- `cheat log` - the top sheet
- `cheat log list` - see the handles
