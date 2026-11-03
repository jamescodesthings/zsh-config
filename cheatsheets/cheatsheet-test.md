# cheatsheet-test

> Check that sheets render with `cheat`: the line shape, then the shared structure.
> Exit 1 when any sheet fails; each failure prints the file and line.

# Getting started

- `cheatsheet-test` - check zsh-config's own sheets
- `cheatsheet-test <sheet> [<folder>...]` - check sheets or whole folders
- `cheatsheet-test --strict <sheet>` - make the structure warnings fail

# Line rules

- Every non-empty line starts with `# `, `> `, `- ` or a backtick
- A backtick line is one example ending in a backtick
- No indenting

# Options

- `--strict` - turn the structure warnings into failures
- `--plain` - no colour or animation
- `-q`, `--quiet` - print only warnings and errors
- Exit: 0 done, 1 failed, 2 wrong usage

# See also

- `cheat cheat format` - the structure it checks
- `cheat cheat new` - start a sheet from the template
- `cheat link-cheatsheets`
- `cheat zsh-config` - everything zsh-config gives you
