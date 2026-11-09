# key export

> Writes the stored key into a file as `VAR=key`, with no 1Password. Other lines are kept and the file is mode 600.
> A file whose `VAR=` line holds another value is backed up first.

# Options

- `<name>` - the key's name
- `--to FILE` - the file to write (required)
- `--var VAR` - the variable name (default from `<name>.conf`), remembered

# Examples

`key export hub --to ~/projects/personal/hub/.env`

# See also

- `cheat key import` - the other direction
- `cheat key pull` - get the key from 1Password first
- `cheat key` - all subcommands
