# hist

> Search and tidy history across the global file and the per-directory files.
> Bare `hist` is `hist list`. Takes `-v` and `--plain`. Exit: 0 done, 1 invalid regex, 2 missing query or unknown subcommand.

# Getting started

- `hist search <regex> [-q]` - find a pattern in all history
- `hist list [-q]` - list all history, global first; `-q` for commands only
- `hist stats` - entry count per directory

# Tidy

- `hist open` - open the history folder
- `hist delete <regex>` - delete matching lines from every file
- `hist clean` - remove files for missing directories
- `hist move [--dry-run] <old> <new>` - carry a moved folder's history over

# Environment

- `PER_DIRECTORY_HISTORY_BASE` - history folder (default `~/.zsh_history_dirs`)
- `PER_DIRECTORY_HISTORY_FILE` - per-directory file name (default `zsh-per-directory-history`)
- `_per_directory_history_main_histfile` - global file (default `~/.zsh_history`)
- `hist [help|-h|--help]` - show usage
- `[--plain|-v|--verbose]` - accepted
- Exit: 2 on an unknown subcommand, or a search or delete with no query

# See also

- `cheat hist <command>` - one sheet per command above
- `cheat j` - the same tidying for the directory jumper
- `cheat zinit` - the plugin manager behind per-directory history
- `cheat zsh-config` - everything zsh-config gives you
