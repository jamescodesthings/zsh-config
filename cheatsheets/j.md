# j

> Wrapper around rupa/z (directory frecency). Subcommands manage z history; unrecognised args navigate.

# Navigation

- Jump to highest-ranked directory matching query:

`j <query>`

- Jump to highest-ranked directory matching multiple terms:

`j projects zsh`

# Subcommands

- List all tracked directories sorted by rank:

`j list`

- Search entries by regex:

`j grep <regex>`

- Grep with no argument — navigates to best z match:

`j grep`

- Add a path to history (increments rank if already present):

`j add <path>`

- Delete entries matching a regex (shows matches, confirms):

`j delete <regex>`

- Set a single matching entry to max rank + 1 (bring to top):

`j bump <regex>`

- Reorder top 10 entries in $EDITOR (opens paths-only file):

`j reorder`

- Reorder top N entries:

`j reorder --count <n>`

- Remove entries for directories that no longer exist:

`j clean`

- Show stats: total, top 5, oldest/newest:

`j stats`

- Open z data file directly in $EDITOR:

`j edit`

# How frecency works

> z tracks directories you visit and scores them by frequency + recency.
> Higher score = higher priority when jumping. `j bump` promotes an entry above all others.

# Environment

> `_Z_DATA` — path to z data file (default: `~/.z`)
> `EDITOR` — editor for `reorder` and `edit` (default: `micro`)

# Related commands

- Full z reference (upstream):
`tldr z`
