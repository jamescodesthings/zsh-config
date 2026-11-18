# key

> Per-project named keys kept outside git, pulled from and pushed to 1Password, written into a file on request.

# Getting started

- `key create <name>` - make a key where none exists
- `key pull <name>` - pull the key from 1Password (needs a terminal)

# Everyday

- `key create <name> [--to FILE]` - new key; `--to` also writes it into FILE
- `key cycle <name> [--to FILE] [-n|--dry-run] [-y|--yes]` - replace the key, keep the old as a backup
- `key pull <name> [--to FILE] [-y|--yes]` - 1Password to the store; `--to` also writes FILE
- `key push <name> [--from FILE] [-y|--yes]` - the store to 1Password; `--from` imports FILE first
- `key import <name> --from FILE` - FILE's key into the store, no 1Password
- `key export <name> --to FILE` - the stored key into FILE, no 1Password
- `key rm <name> [-n|--dry-run] [-y|--yes]` - move a key out of the store, recoverable
- `key list [--json]` - name, stored or not, backups, op reference, variable; never a key
- `--var VAR`, `--op REF` - variable name, 1Password reference; remembered (not `--op` on import, export)
- `key path <name> [-p|--previous]` - the key file's path, or the newest backup's; exit 1 when none

# Variables

- `KEY_DIR` - the store (default `~/.custom/config/keys`)
- `KEY_OP_BIN` - the 1Password CLI (default `op`)
- `KEY_OP_ACCOUNT` - 1Password account for every op call; unset, the last signed in
- `KEY_OP_VAULT` - the vault in the default reference (default `Personal`)

# See also

- `cheat key pull` - and one sheet for each other subcommand
- `cheat wipcrypt` - encrypts a tree with a stored key
- `cheat zsh-config` - everything zsh-config gives you
