# hist

> Search and tidy history across the global file and the per-directory files.
> Bare `hist` is `hist list`. Exit: 0 done, 1 bad query or regex.

# Commands

- `cheat hist list`: list all history
- `cheat hist search`: find a pattern in all history
- `cheat hist delete`: delete matching lines from every file
- `cheat hist open`: open the history folder
- `cheat hist clean`: remove files for missing directories
- `cheat hist move`: move a folder's history to its new path
- `cheat hist stats`: entry count per directory

# Help

- `hist help`, `hist -h`, `hist --help`: show usage

# Environment

- `PER_DIRECTORY_HISTORY_BASE`: history folder (default `~/.zsh_history_dirs`)
- `PER_DIRECTORY_HISTORY_FILE`: per-directory file name (default `zsh-per-directory-history`)
- `_per_directory_history_main_histfile`: global file (default `~/.zsh_history`)

# Related commands

- `cheat zinit`
