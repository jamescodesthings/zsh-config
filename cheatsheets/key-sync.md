# key sync

> Pulls the key from 1Password into the store, saving a different existing key as `<name>.key.<n>`; `--push` sends the stored key up.
> Pull and an unconfirmed push need a terminal, because `op` waits on the 1Password app. The key never goes on argv.

# Options

- `<name>` - the key's name
- `--push` - push the stored key to 1Password (create or edit the item); asks once
- `[-l|--local]` - skip 1Password; only write the stored key into `--to` FILE (needs `--to`)
- `--from FILE` - take the key from FILE's last `VAR=` line instead of 1Password; with `--push`, then push it
- `--to FILE` - also write `VAR=key` into FILE
- `--var VAR`, `--op REF` - override and remember the variable and the reference
- `[-y|--yes]` - do not ask before a push

# Examples

`key sync agent-forge`

`key sync agent-forge --push -y`

`key sync agent-forge --from ~/projects/agent-forge/.env --var SKILLS_ENCRYPTION_KEY --push`

`key sync agent-forge -l --to ~/projects/agent-forge/.env`

# See also

- `cheat key cycle` - make a new key first, then push it
- `cheat key` - all subcommands
