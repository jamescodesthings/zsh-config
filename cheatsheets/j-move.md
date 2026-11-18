# j move

> Rewrite z entries for a folder and its subfolders to a new path, after the folder itself moved.
> The old folder need not exist. Entries landing on an existing path merge: ranks added, newer time kept.

# Options

- `--dry-run` - show what would change, change nothing

# Examples

- `j move <old> <new>` - move entries
- `j move --dry-run <old> <new>` - preview only

# Notes

- Exit: 0 done, 1 bad arguments or nothing to move

# See also

- `cheat j` - the top sheet
- `cheat j clean`
- `cheat hist move`
