# cli run-quiet

> Run a command with its output appended to a child log, so nothing from it reaches the terminal.
> Advances `progress` with the label when a run is active. Call it in the tool's own shell, never inside `$(...)`.

# Options

- `run-quiet <label> <command...>` - run the command with stdin closed, stdout and stderr in the log
- `~/.custom/logs/children/` - where the log goes, named by date, parent and label; `CLI_LOG_DIR` moves it
- failure - records a `problem` and a `fix` of `log open <that log>`, and returns the command's exit code

# Examples

- Run one command quietly:

`run-quiet "brew" brew update`

- Show what failed at the end:

`problems`

# See also

- `cheat cli` - the top sheet
- `cheat cli progress` - the spinner it advances
- `cheat log` - read the child logs
- Exit: the command's own code, 1 when the log cannot be made, 2 without a label and a command
