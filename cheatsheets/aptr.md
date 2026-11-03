# aptr

> Removes an apt package, then runs autoremove for the dependencies it left behind.
> Needs apt and sudo.

# Getting started

- `aptr <package>` - `sudo apt remove -y`, then `sudo apt autoremove -y`

# Options

- `[-h|--help]` - show this sheet
- `[--plain]` - no colour

# Examples

- Remove vim and its orphans:

`aptr vim`

# See also

- `cheat apt` - the apt aliases
- `cheat zsh-config` - everything zsh-config gives you
