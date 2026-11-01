# j move

> Rewrite z entries for a folder and its subfolders to a new path, after the folder itself moved.
> The old folder need not exist. Entries landing on an existing path merge: ranks added, newer time kept.

# Options

- `--dry-run` - show what would change, change nothing

# Examples

- Move entries:

`j move <old> <new>`

- Preview only:

`j move --dry-run <old> <new>`

# See also

- `cheat j` - the top sheet
- `cheat j clean`
- `cheat hist move`
- Exit: 0 done, 1 bad arguments or nothing to move
