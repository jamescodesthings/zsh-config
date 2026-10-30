# link-cheatsheets

> Link every `*.md` in a folder into `$CHEATSHEET_DIR` so `cheat` finds it.
> Prints `linked N, already linked N, clashes N`. Exit 0 when nothing clashed; 1 on a clash, an error or bad usage.

# Getting started

- `link-cheatsheets <folder>`: link a project's sheets, e.g. `link-cheatsheets ~/projects/personal/pkms/cheatsheets`
- Next: `cheat <name>` shows them

# From an installer

- `whence link-cheatsheets && link-cheatsheets "$REPO_DIR/cheatsheets"`: only when it exists

# Edge cases

- Stale links into that folder are removed
- A name taken by a real file or another folder's link: warns, never overwritten, exit 1
- `$CHEATSHEET_DIR` inside the folder: error; open a new shell
- `$CHEATSHEET_DIR` unset: skips

# More

- `cheat cheat`: the viewer
- `cheat cheatsheet-test`: check sheets render
- `cheat zsh-config`: everything zsh-config gives you
