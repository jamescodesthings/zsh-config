# functions cli

> The helper library every house CLI uses: checks, colour, status lines, progress, logs and settings.

# Usage

- `is [test] [args]` - predicate for conditionals, such as `is available brew`
- `confirm [question]` - ask y/n, exit 0 on yes
- `deps [command...]` - check that commands exist
- `cli-init` - a tool's first line: plain mode, flags, palette
- `cli-icon [name]` - print an nf-md status glyph
- `col [name|role]` - print a palette colour escape
- `say [ok|info|warn|fail] [text]` - print one status line
- `problem [text]` - record a problem for the end of the run
- `fix [command] [reason]` - record the fix for a problem
- `problems` - print the problems and fixes, return 1 when there were any
- `pick [header] [items...]` - ask for a missing argument with fzf
- `progress [start|step|pause|resume|done|fail]` - draw a progress line
- `run-quiet [label] [command...]` - run a command into a child log
- `log [list|open]` - read the run logs
- `log-start [command]` - open a run's log
- `log-line [text]` - append a stamped line to the log
- `config [tool] [list|get|set|unset|edit]` - a tool's JSON settings

# See also

- `cheat functions` - every function, by group
- `cheat cli` - the helper library
