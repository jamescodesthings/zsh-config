# hist move

> Move the per-directory history of a folder and its subfolders to a new path, after the folder itself moved.
> The old folder need not exist. Where the new history file exists, the two are merged by time.

# Options

- `--dry-run` - show what would move, change nothing

# Examples

- `hist move <old> <new>` - move history
- `hist move --dry-run <old> <new>` - preview only

# Notes

- Exit: 0 done, 1 bad arguments or nothing to move

# See also

- `cheat hist` - the top sheet
- `cheat hist clean`
- `cheat j move`
