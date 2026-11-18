# key push

> Sends the stored key to 1Password, creating the item or editing its field. It asks once unless `-y`.
> Asking needs a terminal, because `op` waits on the 1Password app. The key goes to `op` in a 600 template file, never on argv.

# Options

- `<name>` - the key's name
- `--from FILE` - import FILE's last `VAR=` line (or its one bare-key line) into the store first
- `--var VAR`, `--op REF` - override and remember the variable and the reference
- `[-y|--yes]` - do not ask

# Examples

- `key push hub` - send the stored key to 1Password, asking first
- `key push hub -y` - send it without asking
- `key push hub --from ~/projects/personal/hub/.env --var SKILLS_ENCRYPTION_KEY -y` - import the key from that file, then send it without asking

# See also

- `cheat key cycle` - make a new key first, then push it
- `cheat key pull` - the other direction
- `cheat key` - all subcommands
