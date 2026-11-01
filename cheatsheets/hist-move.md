# hist move

> Move the per-directory history of a folder and its subfolders to a new path, after the folder itself moved.
> The old folder need not exist. Where the new history file exists, the two are merged by time.

# Options

- `--dry-run` - show what would move, change nothing

# Examples

- Move history:

`hist move <old> <new>`

- Preview only:

`hist move --dry-run <old> <new>`

# See also

- `cheat hist` - the top sheet
- `cheat hist clean`
- `cheat j move`
- Exit: 0 done, 1 bad arguments or nothing to move
