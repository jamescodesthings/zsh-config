# zshconfig

> Jump to or edit the zsh config directory (`~/.custom`, a symlink to this repo). Alias `zshc`.

# Getting started

- `zshconfig` - change into the config directory
- `zshconfig -e` or `zshconfig --edit`: open it in VS Code, else micro on `.zshrc`
- `zshenv` - edit this machine's env file (`env.<hostname>.zsh`, in micro)
- Next: `reload <function>` picks up a function you changed

# Drop-ins

- `$CUSTOM_DIR/projects/<name>.env.zsh` - variables and PATH, every zsh
- `$CUSTOM_DIR/projects/<name>.zsh` - aliases and functions, interactive shells only
- The folder's contents are gitignored; the other project's installer writes them

# Stay in bash

- `NO_ZSH=1 bash` - one session (bash otherwise hands over to zsh)
- `ssh -t host NO_ZSH=1 bash -i` - over ssh
- `bash --norc` - skip the startup file

# See also

- `cheat reload`
- `cheat update`
- `cheat zsh-config` - everything zsh-config gives you
