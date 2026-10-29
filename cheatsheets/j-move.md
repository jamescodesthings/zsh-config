# j move

> Rewrite z entries for a folder and its subfolders to a new path, after the folder itself moved.
> The old folder need not exist. Entries landing on an existing path merge: ranks added, newer time kept. Exit: 0 done, 1 bad arguments or nothing to move.

# Usage

- Move entries:

`j move <old> <new>`

- Show what would change, change nothing:

`j move --dry-run <old> <new>`

# Related commands

- `cheat j clean`
- `cheat hist move`
