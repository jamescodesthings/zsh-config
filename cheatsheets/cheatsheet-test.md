# cheatsheet-test

> Check that cheatsheets render with `cheat`, which shows them with tldr first.
> Every non-empty line must start with `# `, `> `, `- ` or a backtick, and a backtick line is one example ending in a backtick.

# Usage

- Check zsh-config's own sheets:

`cheatsheet-test`

- Check one sheet, or every sheet in a folder:

`cheatsheet-test ~/projects/personal/pkms/cheatsheets`

- Check a sheet after making or changing it:

`cheatsheet-test cheatsheets/git.md`

# Notes

> Each failure prints the file and line. tldr and glow also render each sheet when they are installed; the line check runs everywhere.
> The exit code is 1 when any sheet fails, so another project's installer or test target can call it.

# Related commands

- Create a sheet in the right shape:

`cheat new <name>`

- Link a project's sheets into `~/cheatsheets`:

`link-cheatsheets <dir>`
