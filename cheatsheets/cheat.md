# cheat

> Personal cheatsheet viewer with tldr fallback. Cheatsheets live in `~/.custom/cheatsheets/`.

# Usage

- List all local cheatsheets (default when no args):

`cheat`

- Show a cheatsheet:

`cheat git`

- Multi-word command — maps to `git-commit.md`:

`cheat git commit`

- Print raw markdown instead of rendering:

`cheat git --raw`

# Subcommands

- List local cheatsheets:

`cheat list`

- Search local cheatsheets and tldr by name:

`cheat search <query>`

- Create a new cheatsheet from template:

`cheat new <name>`

- Open an existing cheatsheet in $EDITOR:

`cheat edit <name>`

- Print raw markdown of a local or tldr sheet:

`cheat raw <name>`

- Update the tldr page cache:

`cheat update`

- Show help:

`cheat help`

# Notes

> `cheat new <name>` creates the file but does not open it — run `cheat edit <name>` to fill it in.
> Subcommand names (list, search, edit, new, update, raw, help) are reserved sheet names.

# Related commands

- Community cheatsheets for thousands of commands:
`tldr <command>`
