# install-box-config

> Install a per-machine config file by trying hostname-specific, OS-specific, then default variants.

# Usage

- Install a config file to a destination, choosing the best variant for this machine:

`install-box-config <config-source> <config-destination>`

# Resolution order

> Tries: source.HOSTNAME.ext, source.OS.ext, source.ext — errors if none exist.
> OS is detected via `uname -s` lowercased (e.g. `linux`, `darwin`).

# Examples

- Install VSCode settings, picking the best variant for this machine:

`install-box-config $CUSTOM_DIR/configs/vscode/settings.json ~/.config/Code/User/settings.json`

# Notes

> Creates a symlink via `install-link` (backs up existing files to `.bak`).
> Uses `get-hostname` for hostname detection.
> Used by the `installers/` scripts.

# Related commands

- Create a symlink with backup:
`cheat install-link`
