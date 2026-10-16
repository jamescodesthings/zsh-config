# cheat new

> Create a sheet in zsh-config's `cheatsheets/` and link it into `~/cheatsheets`.
> Does not open it. Exit 1 if the name is taken or missing.

# Commands

- Create a sheet:

`cheat new my-tool`

- Fill it in, then check it:

`cheat edit my-tool`

`cheatsheet-test my-tool.md`

# Template

- Title `# name`, then a `> ` line
- `# Usage` with an example item
- `# Related commands` with a `cheat related-name` item

# Related commands

- `cheat cheat-edit`
- `cheat cheatsheet-test`
- `cheat link-cheatsheets`
