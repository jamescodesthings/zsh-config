# key push

> Sends the stored key to 1Password, creating the item or editing its field. It asks once unless `-y`.
> Asking needs a terminal, because `op` waits on the 1Password app. The key goes to `op` in a 600 template file, never on argv.

# Options

- `<name>` - the key's name
- `--from FILE` - import FILE's last `VAR=` line (or its one bare-key line) into the store first
- `--var VAR`, `--op REF` - override and remember the variable and the reference
- `[-y|--yes]` - do not ask

# Examples

`key push agent-forge`

`key push agent-forge -y`

`key push agent-forge --from ~/projects/agent-forge/.env --var SKILLS_ENCRYPTION_KEY -y`

# See also

- `cheat key cycle` - make a new key first, then push it
- `cheat key pull` - the other direction
- `cheat key` - all subcommands
