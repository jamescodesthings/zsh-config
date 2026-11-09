# key cycle

> Replaces an existing key and keeps the old one as `<name>.key.<n>`. It does not push to 1Password or re-encrypt anything.
> Asks once unless `-y`; answering no leaves the key alone and exits 1. Without a terminal it needs `-y`.

# Options

- `<name>` - a key that already exists (else `key create`)
- `--to FILE` - back FILE up to `FILE.<n>`, then rewrite its `VAR=` line
- `--var VAR` - the variable in FILE (default from `<name>.conf`)
- `[-n|--dry-run]` - say what would happen, change nothing
- `[-y|--yes]` - do not ask

# Examples

`key cycle hub -n`

`key cycle hub -y --to ~/projects/personal/hub/.env`

# See also

- `cheat wipcrypt` - `cycle-key --key` cycles and re-encrypts every tree
- `cheat key push` - push the new key to 1Password
- `cheat key` - all subcommands
