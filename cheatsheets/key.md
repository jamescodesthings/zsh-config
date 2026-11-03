# key

> Per-project named keys kept outside git, synced with 1Password, written into a file on request.

# Getting started

- `key create <name>` - make a key where none exists
- `key sync <name>` - pull the key from 1Password (needs a terminal)
- `key list` - every key in the store

# Everyday

- `key create <name> [--to FILE]` - new key; `--to` also writes it into FILE
- `key cycle <name> [--to FILE] [-n|--dry-run] [-y|--yes]` - replace the key, keep the old as a backup
- `key sync <name> [--push] [-l|--local] [--to FILE] [-y|--yes]` - 1Password to the store; `--push` the other way

# Inspect

- `key list [--json]` - name, stored or not, backups, op reference, variable; never a key
- `key path <name> [-p|--previous]` - the key file's path (even if none yet), or the newest backup's

# Variables

- `KEY_DIR` - the store (default `~/.custom/config/keys`)
- `KEY_OP_BIN` - the 1Password CLI (default `op`)
- `KEY_OP_VAULT` - the vault in the default reference (default `Personal`)

# See also

- `cheat key create`, `cheat key cycle`, `cheat key sync` - one sheet each
- `cheat wipcrypt` - encrypts a tree with a stored key
- `cheat zsh-config` - everything zsh-config gives you
