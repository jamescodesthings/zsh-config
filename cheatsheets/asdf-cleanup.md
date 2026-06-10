# asdf-cleanup

> Remove old versions of asdf plugins, keeping only the globally set version.

## Usage

- Remove all non-current versions of every installed asdf plugin:

`asdf-cleanup`

## Notes

- Reads the current version for each plugin from `asdf current`
- Removes all other installed versions with `asdf uninstall <plugin> <version>`
- Safe to run regularly to reclaim disk space
- Won't remove versions set locally in a `.tool-versions` file (those are still "current" in that dir)

## Related commands

- See all installed versions for a plugin:
`asdf list <plugin>`

- See current version in this directory:
`asdf current`

- Full asdf reference:
`cheat asdf`
