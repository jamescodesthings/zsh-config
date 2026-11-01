# cli

> The helper library for zsh tools: colour, status lines, pickers, progress, logs and settings.

# Getting started

- `cheat-help <tool> "$@" && return 0` - first line: `--help` shows the tool's sheet
- `cli-init "$@"` - second: sets plain mode, loads the palette
- `say ok|info|warn|fail <text>` - report; or `problem <text>` and `problems` at the end

# Output

- `say ok|info|warn|fail <text>` - one status line with an icon; fail goes to stderr
- `cli-icon [-v VAR] <name>` - a glyph: ok info warn err step log ask run done fail
- `problem <text>`, `fix <command> [reason]` - remember them, outside `$(...)`
- `problems` - print them on stderr, returns 1 if there were any
- `col [-v VAR] <name>` - a palette colour escape

# Work

- `pick [-v VAR] <header> <items...>` - fzf choice for a missing argument
- `progress start|step|done|fail` - spinner with steps; `cheat cli progress`
- `run-quiet <label> <command...>` - run it into a child log
- `log-start <command>` - open a log; `log-line <text>` adds to it
- `config [--schema FILE] <tool>` - the tool's settings

# Plain mode and palette

- `--plain`, `NO_COLOR` or a stdout that is no tty: no colour, no animation; icons stay (`progress` draws on stderr, so it also goes plain when stderr is no tty)
- `configs/palette/palette.conf` - hues and roles; `~/.config/zsh-config/palette.conf` overrides

# See also

- One sheet each: `cheat cli col`, `cheat cli progress`, `cheat cli sheets`
- `cheat zsh-config` - everything zsh-config gives you
