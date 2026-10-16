# cheatsheet-test

> Check that sheets render with `cheat`: the line shape, then tldr and glow when installed.
> Exit 1 when any sheet fails; each failure prints the file and line.

# Rules

- Every non-empty line starts with `# `, `> `, `- ` or a backtick
- A backtick line is one example ending in a backtick
- No indenting

# Usage

- Check zsh-config's own sheets:

`cheatsheet-test`

- Check one sheet:

`cheatsheet-test cheatsheets/git.md`

- Check every sheet in a folder:

`cheatsheet-test ~/projects/personal/pkms/cheatsheets`

# Related commands

- `cheat cheat-new`
- `cheat link-cheatsheets`
