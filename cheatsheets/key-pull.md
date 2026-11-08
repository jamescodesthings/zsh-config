# key pull

> Reads the key from 1Password into the store, saving a different existing key as `<name>.key.<n>`.
> Needs a terminal, because `op` waits on the 1Password app. The key never goes on argv.

# Options

- `<name>` - the key's name
- `--to FILE` - also write `VAR=key` into FILE
- `--var VAR`, `--op REF` - override and remember the variable and the reference
- `[-y|--yes]` - accepted and ignored, so a caller can pass it

# Examples

`key pull agent-forge`

`key pull agent-forge --to ~/projects/agent-forge/.env --var SKILLS_ENCRYPTION_KEY`

# See also

- `cheat key push` - the other direction
- `cheat key` - all subcommands
