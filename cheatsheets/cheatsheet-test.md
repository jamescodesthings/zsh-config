# cheatsheet-test

> Check that sheets render with `cheat`: the line shape, then tldr and glow when installed, then the shared structure.
> Exit 1 when any sheet fails; each failure prints the file and line.

# Getting started

- `cheatsheet-test` - check zsh-config's own sheets
- `cheatsheet-test <sheet> [<folder>...]` - check sheets or whole folders
- `cheatsheet-test --strict <sheet>` - make the structure warnings fail

# Line rules (always failures)

- Every non-empty line starts with `# `, `> `, `- ` or a backtick
- A backtick line is one example ending in a backtick
- No indenting

# Structure warnings

- Top sheet (no parent sheet beside it): first section `Getting started`, last section `More`
- Top sheet: at most 35 rendered lines
- Child sheet (`hub-join.md` beside `hub.md`): last section `See also`
- `--strict` - turn these warnings into failures

# See also

- `cheatsheet-test cheatsheets/git.md` - check one sheet
- `cheatsheet-test --strict <repo>/cheatsheets` - check a project's sheets strictly
- `cheat cheat format` - the structure it checks
- `cheat cheat new` - start a sheet from the template
- `cheat link-cheatsheets`
- `cheat zsh-config` - everything zsh-config gives you
