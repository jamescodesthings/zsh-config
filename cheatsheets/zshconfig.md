# zshconfig

> Jump to or edit the zsh config directory (~/.custom symlink to this repo).

# Usage

- CD into the zsh config directory:

`zshconfig`

- Open config in editor (VS Code or micro):

`zshconfig -e`

- Open config in editor (long form):

`zshconfig --edit`

- Short alias, takes the same flags:

`zshc`

# Notes

> After editing any config, run `reload <function>` or `reload all` to apply changes.

# Per-machine env file

- Open the env file for the current hostname in `micro`:

`zshenv`

> Opens `$CUSTOM_DIR/env.<hostname>.zsh` — sourced automatically by `load_box_env.zsh` on shell start.
> Use for machine-specific PATH entries, tool config, and env vars like `$PICO8`.
> Hostname comes from `get-hostname` (strips domain from `uname -n`).

# Project drop-ins and NO_ZSH

- Hook another project into the shell without editing this repo:

`$CUSTOM_DIR/projects/<name>.env.zsh` (variables and PATH, every zsh)
`$CUSTOM_DIR/projects/<name>.zsh` (aliases and functions, interactive only)

> The contents of `projects/` are gitignored; the other project's installer writes and rewrites them.

- Stay in bash for one session (bash otherwise hands over to zsh):

`NO_ZSH=1 bash`

- Stay in bash over ssh, or skip the startup file entirely:

`ssh -t host NO_ZSH=1 bash -i`
`bash --norc`

# Related commands

- Reload a function without restarting shell
`cheat reload`
