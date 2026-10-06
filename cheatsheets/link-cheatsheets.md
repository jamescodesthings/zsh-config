# link-cheatsheets

> Link every `*.md` sheet in a folder into `$CHEATSHEET_DIR` so `cheat` finds it.
> Stale links into that folder are removed; real files and other folders' links are never touched.

# Usage

- Link a project's sheets:

`link-cheatsheets ~/projects/personal/pkms/cheatsheets`

- Use it from an installer only when it exists:

`whence link-cheatsheets && link-cheatsheets "$REPO_DIR/cheatsheets"`

# Related commands

- `cheat cheat`
