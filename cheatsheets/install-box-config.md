# install-box-config

> Install a per-machine config by symlink, picking the best variant for this machine.
> Exit 1 on no arguments, no hostname or an unsupported OS.

# Getting started

- `install-box-config <default-file> <destination>` - e.g. `install-box-config $CUSTOM_DIR/configs/vscode/settings.json ~/.config/Code/User/settings.json`
- Next: add `settings.<hostname>.json` or `settings.osx.json` beside the default to override it

# Order tried

- `settings.<hostname>.json` - this machine
- `settings.osx.json` or `settings.linux.json`: this OS
- `settings.json` - the default

# Edge cases

- Links with `install-link`: an existing target is backed up
- No variant and no default: warns, exit 0
- No variant, file at destination: moved to the host variant name, then linked

# See also

- `cheat install-link`
- `cheat zsh-config` - everything zsh-config gives you
