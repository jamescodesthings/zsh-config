# cli

> The helper library for zsh tools: colour, status lines, pickers, progress, logs and settings.

# Getting started

- `cheat-help <tool> "$@" && return 0` - first line: `--help` shows the tool's sheet
- `cli-init "$@"` - second: sets plain mode and `-q`/`-v`, loads the palette
- `say ok|info|warn|fail <text>` - report; `problem` and `problems` at the end

# Output

- `say ok|info|warn|fail <text>` - one status line with an icon; fail goes to stderr
- `cli-icon [-v VAR] <name>` - a glyph
- `problem <text>`, `fix <cmd> [why]` - collect; `problems` prints
- `col [-v VAR] <name>` - a palette colour escape
- `-q`, `-v` - `cli-init` sets `CLI_QUIET` (silences ok, info) and `CLI_VERBOSE`

# Work

- `pick [-v VAR] <header> <items...>` - fzf choice for a missing argument
- `confirm [-y]` - ask y/n; `-y` or `CLI_YES=1` says yes
- `progress start|step|done|fail` - spinner with steps; `cheat cli progress`
- `run-quiet <label> <command...>` - run it into a child log
- `log-start <command>`, `log-line <text>` - open a log, add to it
- `config [--schema FILE] <tool>` - the tool's settings

# Plain mode

- `--plain`, `NO_COLOR`, no tty: no colour or animation; `CLICOLOR_FORCE=1` keeps colour

# See also

- One sheet each: `cheat cli col`, `cheat cli progress`, `cheat cli sheets`
- `cheat zsh-config` - everything zsh-config gives you
