# key rm

> Moves a key's files out of the store into `removed/<name>-<stamp>/`, so nothing is deleted. It never touches 1Password.
> Asks once unless `-y`; answering no leaves the key alone and exits 1. Without a terminal it needs `-y`.

# Options

- `<name>` - a key in the store (else exit 1, see `key list`)
- `[-n|--dry-run]` - list the files and warnings, move nothing
- `[-y|--yes]` - do not ask

# Examples

`key rm hub -n`

`key rm hub -y`

# See also

- `cheat key cycle` - replace a key and keep the old one
- `cheat wipcrypt` - its trees need the key; rm warns about each root still using it
- `cheat key` - all subcommands
