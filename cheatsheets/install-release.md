# install-release

> Install the latest GitHub release of a tool into `~/.local/bin`, no sudo. Debian only.
> Tools and asset names are rows in `configs/releases`. Exit 1 on an unknown tool or failure; on macOS it says brew owns the tool and exits 0.

# Usage

- Install or update one tool:

`install-release glow`

- Show the usage:

`install-release --help`

# Output

- `installed:`: new release placed, completion linked when the tool has one
- `current:`: already on the latest tag

# Related commands

- `cheat update`
