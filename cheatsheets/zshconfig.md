# zshconfig

> Jump to or edit the zsh config directory (~/.custom symlink to this repo).

# Usage

- CD into the zsh config directory:

`zshconfig`

- Open config in editor (VS Code or micro):

`zshconfig -e`

- Open config in editor (long form):

`zshconfig --edit`

# Notes

> After editing any config, run `reload <function>` or `reload all` to apply changes.

# Per-machine env file

- Open the env file for the current hostname in `micro`:

`zshenv`

> Opens `$CUSTOM_DIR/env.<hostname>.zsh` — sourced automatically by `load_box_env.zsh` on shell start.
> Use for machine-specific PATH entries, tool config, and env vars like `$PICO8`.
> Hostname comes from `get-hostname` (strips domain from `uname -n`).

# Related commands

- Reload a function without restarting shell
`cheat reload`
