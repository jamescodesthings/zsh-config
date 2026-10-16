# j

> Directory jumper over rupa/z, with commands to manage z's history.
> Needs the z plugin loaded. Bare `j` lists z's ranks; an unknown word is passed to z as a query.

# Commands

- `cheat j list`: list every entry by rank
- `cheat j search`: filter entries by regex
- `cheat j add`: add a path or raise its rank
- `cheat j delete`: remove entries matching a regex
- `cheat j bump`: put one entry at the top
- `cheat j reorder`: reorder the top entries in your editor
- `cheat j clean`: remove entries for missing directories
- `cheat j stats`: totals, top 5, oldest and newest
- `cheat j edit`: open the z data file in your editor

# Help

- `j help`, `j -h`, `j --help`: show usage

# Jump

- Go to the best match, or to the best match for several terms:

`j <query>`

`j projects zsh`

# Environment

- `_Z_DATA`: z data file (default `~/.z`)
- `EDITOR`: used by `reorder` and `edit` (default `micro`)

# Related commands

- `tldr z`
