# hist

> Search and tidy history across the global file and the per-directory files.
> Bare `hist` is `hist list`. Exit: 0 done, 1 bad query or regex.

# Getting started

- `hist search <regex>`: find a command in all history
- `hist list [-q]`: list everything, `-q` for commands only
- `hist stats`: entry count per directory

- Next: tidy with `hist clean`, or `hist move` after moving a folder.

# Find

- `hist list [-q]`: list all history, global first
- `hist search <regex> [-q]`: find a pattern in all history
- `hist stats`: entry count per directory
- `hist open`: open the history folder

# Tidy

- `hist delete <regex>`: delete matching lines from every file
- `hist clean`: remove files for missing directories
- `hist move [--dry-run] <old> <new>`: carry a moved folder's history over

# Environment

- `PER_DIRECTORY_HISTORY_BASE`: history folder (default `~/.zsh_history_dirs`)
- `PER_DIRECTORY_HISTORY_FILE`: per-directory file name (default `zsh-per-directory-history`)
- `_per_directory_history_main_histfile`: global file (default `~/.zsh_history`)
- `hist help`, `hist -h`, `hist --help`: show usage

# More

- `cheat hist <command>`: one sheet per command above
- `cheat j`: the same tidying for the directory jumper
- `cheat zinit`: the plugin manager behind per-directory history
- `cheat zsh-config`: everything zsh-config gives you
