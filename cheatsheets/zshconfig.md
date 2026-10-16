# zshconfig

> Jump to or edit the zsh config directory (`~/.custom`, a symlink to this repo). Alias `zshc`.

# Usage

- Change into the config directory:

`zshconfig`

- Open it in VS Code, else micro on `.zshrc`:

`zshconfig -e`

`zshconfig --edit`

- Edit this machine's env file (`env.<hostname>.zsh`, in micro):

`zshenv`

# Drop-ins

- `$CUSTOM_DIR/projects/<name>.env.zsh`: variables and PATH, every zsh
- `$CUSTOM_DIR/projects/<name>.zsh`: aliases and functions, interactive shells only
- The folder's contents are gitignored; the other project's installer writes them

# Stay in bash

- One session (bash otherwise hands over to zsh):

`NO_ZSH=1 bash`

- Over ssh:

`ssh -t host NO_ZSH=1 bash -i`

- Skip the startup file:

`bash --norc`

# Related commands

- `cheat reload`
