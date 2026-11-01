# install-release

> Install the latest GitHub release of a tool into `~/.local/bin`, no sudo. Debian only.
> Tools and asset names are rows in `configs/releases`. Exit 1 on an unknown tool or failure; on macOS it says brew owns the tool and exits 0.

# Getting started

- `install-release <tool>` - install or update one, e.g. `install-release glow`
- `install-release --help` - show the usage
- Next: `update` refreshes them all (`115-releases`)

# Output

- `installed:` - new release placed, completion linked when the tool has one
- `current:` - already on the latest tag

# See also

- `cheat update`
- `cheat zsh-config` - everything zsh-config gives you
