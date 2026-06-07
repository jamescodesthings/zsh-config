# cheat

> Personal cheatsheet viewer with tldr fallback. Cheatsheets live in ~/.custom/cheatsheets/.

# Flags

- Show help and format guide (`-h`):

`cheat --help`

- List local cheatsheets (`-l`):

`cheat --list`

- Search local + tldr by name (`-s`):

`cheat --search <query>`

- Open in $EDITOR (`-e`):

`cheat --edit <name>`

- Create new, optionally seeded from tldr (`-n`):

`cheat --new <name>`

- Update tldr page cache (`-u`):

`cheat --update`

- Print raw markdown (`-r`):

`cheat --raw <name>`

# Usage

- Show a cheatsheet:

`cheat git`

- Multi-word command — maps to git-commit.md:

`cheat git commit`

- Search for pages matching a name:

`cheat -s docker`

- Create new cheatsheet (prompts to seed from tldr if page exists):

`cheat -n my-tool`

- Edit existing cheatsheet:

`cheat -e git`

- Print raw markdown of a local or tldr sheet:

`cheat -r git`

# Cheatsheet format

> Standard markdown rendered with glow at 120 chars width.
> Every non-empty line must start with: # (heading), > (description), - (example label), or backtick (code).

- Example: description label followed by code:

`cheat related-name`

# Related commands

- Community cheatsheets for thousands of commands
`tldr <command>`
