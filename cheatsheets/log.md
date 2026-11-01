# log

> Read the logs that zsh-config tools write: one file per run, plus the output of the commands they ran quietly.
> Logs live in `~/.custom/logs/commands` and `children`; the newest 50 of each are kept.

# Getting started

- `log list` - the newest 20 logs, newest last
- `log open last` - view the latest log
- Next: `log open child` shows a child command's output.

# Look

- `log list [-n|--lines N]` - list logs, both folders interleaved by date
- `log open [last|~N|child|<name>] [-e|--editor]` - view one log, or edit it
- `log open` - pick one with fzf (no fzf or plain mode: the latest)
- `log open 2` - a bare number works as `~2`, because zsh expands an unquoted `~2` itself

# For tool authors

- `log-start <command>` - open this run's log and set `LOG_FILE` and `LOG_COMMAND`
- `log-line <text>` - append `HH:MM:SS text` to `LOG_FILE`; does nothing without one
- `run-quiet <label> <command>` - the command's output goes to a child log
- `problems` - at the end of a run, hints `log open last` when a log is open

# Environment

- `CLI_LOG_DIR` - log folder (default `~/.custom/logs`)

# See also

- `cheat log list`, `cheat log open` - one sheet each
- `cheat cli` - the helper library
- `cheat zsh-config` - everything zsh-config gives you
