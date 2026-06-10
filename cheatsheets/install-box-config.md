# install-box-config

> Install a per-machine config file by trying hostname-specific, OS-specific, then default variants.

## Usage

- Install a config file to a destination, choosing the best variant for this machine:

`install-box-config <config-source> <config-destination>`

## Resolution order

Given `config-source` = `/path/to/settings.json` on hostname `ubuntu`:

1. `/path/to/settings.ubuntu.json` — hostname-specific
2. `/path/to/settings.linux.json` — OS-specific (`uname -s` lowercased)
3. `/path/to/settings.json` — default fallback
4. Error if none exist

## Examples

`install-box-config $CUSTOM_DIR/configs/vscode/settings.json ~/.config/Code/User/settings.json`

## Notes

- Creates a symlink via `install-link` (backs up existing files to `.bak`)
- Uses `get-hostname` for hostname detection
- Used by the `installers/` scripts

## Related commands

- Create a symlink with backup:
`cheat install-link`
