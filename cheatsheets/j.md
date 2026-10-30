# j

> Directory jumper over rupa/z, with commands to manage z's history.
> Needs the z plugin loaded. Bare `j` lists z's ranks; an unknown word is passed to z as a query.

# Getting started

- `j <query>`: jump to the best match; several terms narrow it, e.g. `j projects zsh`
- `j list`: see every entry by rank
- `j stats`: totals, top 5, oldest and newest

- Next: tidy the list with `j clean` and `j reorder`.

# Find

- `j list`: list every entry by rank
- `j search <regex>`: filter entries by regex
- `j stats`: totals, top 5, oldest and newest

# Change ranks

- `j add <path>`: add a path or raise its rank
- `j bump <regex>`: put one entry at the top
- `j reorder [--count N]`: reorder the top entries in your editor
- `j edit`: open the z data file in your editor

# Tidy

- `j delete <regex>`: remove entries matching a regex
- `j clean`: remove entries for missing directories
- `j move [--dry-run] <old> <new>`: carry a moved folder's ranks over

# Environment

- `_Z_DATA`: z data file (default `~/.z`)
- `EDITOR`: used by `reorder` and `edit` (default `micro`)
- `j help`, `j -h`, `j --help`: show usage

# More

- `cheat j <command>`: one sheet per command above
- `cheat hist`: the same tidying for shell history
- `tldr z`: the z plugin itself
- `cheat zsh-config`: everything zsh-config gives you
