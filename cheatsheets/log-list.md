# log list

> List the logs of both folders, interleaved by date with the newest last.
> Each row has a handle (`last`, `~1`, `~2`...), a `[command]` or `[child]` tag and the file name.

# Options

- `-n, --lines N` - show the newest N logs (default 20; N must be a positive number)
- `--plain` - no colour

# Examples

- The newest 20:

`log list`

- The newest 50:

`log list -n 50`

# See also

- `cheat log` - the top sheet
- `cheat log open` - view a log by its handle
- `CLI_LOG_DIR` - moves the log folder
- Exit: 0 done, 2 bad option
