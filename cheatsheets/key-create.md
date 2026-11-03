# key create

> Makes a key where none exists, with `openssl rand -base64 32`. It never replaces one: use `key cycle`.
> A `--op` or `--var` you pass is remembered in `<name>.conf`.

# Options

- `<name>` - the key's name, `[a-z0-9][a-z0-9._-]*`
- `--to FILE` - also write `VAR=key` into FILE (other lines kept, mode 600)
- `--var VAR` - the variable name (default: the name upper-cased, `-` and `.` as `_`, plus `_KEY`)
- `--op REF` - the 1Password reference (default `op://$KEY_OP_VAULT/<name>-key/password`, vault `Personal`)

# Examples

`key create agent-forge`

`key create agent-forge --to ~/projects/agent-forge/.env --var SKILLS_ENCRYPTION_KEY`

# See also

- `cheat key cycle` - replace an existing key
- `cheat key` - all subcommands
