# hist move

> Move the per-directory history of a folder and its subfolders to a new path, after the folder itself moved.
> The old folder need not exist. Where the new history file exists, the two are merged by time. Exit: 0 done, 1 bad arguments or nothing to move.

# Usage

- Move history:

`hist move <old> <new>`

- Show what would move, change nothing:

`hist move --dry-run <old> <new>`

# Related commands

- `cheat hist clean`
- `cheat j move`
