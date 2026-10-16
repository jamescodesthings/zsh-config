# cheat

> Show a personal cheatsheet from `~/cheatsheets`, falling back to tldr when none matches.
> Renders with tldr, then glow, bat, cat. Needs `CHEATSHEET_DIR` set. Exit: 0 done, 1 error.

# Commands

- `cheat cheat list`: list local sheets (also bare `cheat`)
- `cheat cheat search`: search local sheets and tldr by name
- `cheat cheat new`: create a sheet from the template
- `cheat cheat edit`: open a sheet in `$EDITOR`
- `cheat cheat raw`: print a sheet's markdown
- `cheat cheat update`: refresh the tldr cache
- `cheat help` (`-h`, `--help`): the built-in help

# Show a sheet

- Show a sheet:

`cheat git`

- Several words join with `-` (`git-commit.md`):

`cheat git commit`

- Print the markdown instead of rendering:

`cheat git --raw`

# Rules

- The subcommand names above are reserved: no sheet can be called `list`, `search`, `edit`, `new`, `update`, `raw` or `help`
- `$VAR` names outside backticks expand when shown
- The tldr cache refreshes itself in the background every 7 days

# Related commands

- `cheat cheatsheet-test`
- `cheat link-cheatsheets`
