# wipcrypt

> Encrypts a plaintext tree into a ciphertext tree and back (AES-256-CBC, pbkdf2), for work-in-progress files kept out of a public repo.
> hub calls it for its WIP tiers.

# Getting started

- `wipcrypt status --key <name>` - what is encrypted, decrypted or out of step
- `wipcrypt encrypt --key <name>` - plaintext to ciphertext for every pair
- `wipcrypt decrypt --key <name>` - and back

# Usage

- `wipcrypt <encrypt|decrypt|status|cycle-key> [--root DIR] [--pairs FILE] [--key NAME] [--env FILE] [--dry-run] [SRC DST]`

# Options

- `--key NAME` - take the key from the store (`cheat key`)
- `--env FILE` - without `--key`, read `SKILLS_ENCRYPTION_KEY` from FILE
- `--root DIR`, `--pairs FILE` - the project root; the folder pairs
- `[--dry-run]` - encrypt only: say what would change, write nothing

# Cycling

- `wipcrypt cycle-key --key <name>` - runs `key cycle <name> -y`, then re-encrypts every pair
- `--env FILE` with it also rewrites FILE's key line; other roots come from `<name>.users`

# Examples

`wipcrypt cycle-key --key hub --env ~/projects/personal/hub/.env`

# See also

- `cheat key` - make, cycle, pull and push the keys
- `cheat zsh-config` - everything zsh-config gives you
