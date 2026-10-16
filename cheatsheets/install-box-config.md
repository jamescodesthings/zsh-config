# install-box-config

> Install a per-machine config by symlink, picking the best variant for this machine.
> Exit 1 on no arguments, no hostname or an unsupported OS.

# Usage

- Install a config, host variant first:

`install-box-config $CUSTOM_DIR/configs/vscode/settings.json ~/.config/Code/User/settings.json`

# Order

- `settings.<hostname>.json`: this machine
- `settings.osx.json` or `settings.linux.json`: this OS
- `settings.json`: the default

# Markers

- Links with `install-link`: an existing target is backed up
- No variant and no default: warns, exit 0
- No variant, file at destination: moved to the host variant name, then linked

# Related commands

- `cheat install-link`
