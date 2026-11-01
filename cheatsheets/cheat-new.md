# cheat new

> Create a sheet in zsh-config's `cheatsheets/` and link it into `~/cheatsheets`.
> Does not open it. Exit 1 if the name is taken or missing.

# Examples

- Create a sheet:

`cheat new my-tool`

- Fill it in:

`cheat edit my-tool`

- Check it:

`cheatsheet-test cheatsheets/my-tool.md`

# See also

- `cheat cheat format` - the structure a sheet should follow
- `cheat cheat edit`
- `cheat cheatsheet-test`
- `cheat link-cheatsheets`
- The template is a stub (title, `>` line, `# Usage`, `# Related commands`); reshape it to the format
