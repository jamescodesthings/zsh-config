# cheat new

> Create a sheet in zsh-config's `cheatsheets/` and link it into `~/cheatsheets`.
> Does not open it. Exit 1 if the name is taken or missing.

# Examples

- `cheat new my-tool` - create a sheet
- `cheat edit my-tool` - fill it in
- `cheatsheet-test cheatsheets/my-tool.md` - check it

# Notes

- The template follows the format and passes `--strict`: title, `>` line, Getting started, Usage, Examples as rows, See also with pointers

# See also

- `cheat cheat format` - the structure a sheet should follow
- `cheat edit <name>` - fill it in
- `cheat cheatsheet-test`
- `cheat link-cheatsheets`
