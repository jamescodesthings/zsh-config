# link-cheatsheets

> Link every `*.md` in a folder into `$CHEATSHEET_DIR` so `cheat` finds it.
> Prints `linked N, already linked N, clashes N`. Exit 0 when nothing clashed; 1 on a clash, an error, or usage (no argument, a non-folder, `--help`).

# Usage

- Link a project's sheets:

`link-cheatsheets ~/projects/personal/pkms/cheatsheets`

- From an installer, only when it exists:

`whence link-cheatsheets && link-cheatsheets "$REPO_DIR/cheatsheets"`

# Markers

- Stale links into that folder are removed
- A name taken by a real file or another folder's link: warns, never overwritten, exit 1
- `$CHEATSHEET_DIR` inside the folder: error; open a new shell
- `$CHEATSHEET_DIR` unset: skips

# Related commands

- `cheat cheat`
