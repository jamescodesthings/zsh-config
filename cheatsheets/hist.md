# hist

> History helper for per-directory-history. Manages shell history stored across global and per-directory files.

# Subcommands

- Search all history for a pattern (global first, then per-directory):

`hist search <query>`

- Search quietly — commands only, no directory headers:

`hist search <query> -q`

- List all history entries (global first):

`hist list`

- List quietly — commands only:

`hist list -q`

- Find all matching lines, confirm, then delete them from every history file:

`hist delete <query>`

- Open the history base directory in $EDITOR:

`hist open`

- Remove history files whose directory no longer exists on disk:

`hist clean`

- Show entry count per directory, sorted by most entries:

`hist stats`

# Output format

> Duplicate commands are grouped: `git status (4)` means 4 occurrences.
> `search` highlights the matching pattern in each result.
> In delete output, duplicates appear as separate lines.

# Environment

> `PER_DIRECTORY_HISTORY_BASE` — root dir for history files (default: `~/.zsh_history_dirs`)
> `PER_DIRECTORY_HISTORY_FILE` — per-dir history filename (default: `zsh-per-directory-history`)
> `_per_directory_history_main_histfile` — global history file (default: `~/.zsh_history`)

# Related commands

- Toggle between global and per-directory history mode (Ctrl+G):
`cheat zinit`
