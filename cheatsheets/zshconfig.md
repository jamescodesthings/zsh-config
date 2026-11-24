# zshconfig

> Open the zsh config (`~/.custom`, a symlink to this repo) in an editor. Alias `zshc`.

# Getting started

- `zshconfig` - open the config in VS Code, else micro on `.zshrc`
- `cd ~/.custom` - change into the config directory
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

# Options

- `--plain` - no colour or animation
- `-q`, `--quiet` - print only warnings and errors
- `-v`, `--verbose` - accepted
- Exit: 0 opened, 1 no editor found

# See also

- `cheat reload`
- `cheat update`
- `cheat zsh-config` - everything zsh-config gives you
