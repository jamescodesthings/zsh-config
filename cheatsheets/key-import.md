# key import

> Puts the key from a file into the store, with no 1Password. A different existing key is saved as `<name>.key.<n>`.
> Reads the last `VAR=` line, one pair of quotes stripped, or a file holding one bare key line.

# Options

- `<name>` - the key's name
- `--from FILE` - the file to read (required)
- `--var VAR` - the variable to look for (default from `<name>.conf`), remembered

# Examples

`key import agent-forge --from ~/projects/agent-forge/.env --var SKILLS_ENCRYPTION_KEY`

# See also

- `cheat key export` - the other direction
- `cheat key push` - send it on to 1Password
- `cheat key` - all subcommands
