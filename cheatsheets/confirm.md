# confirm

> Ask y/n. Exit 0 on `y` or `Y`, 1 on anything else.

# Getting started

- `confirm` - ask with the default message
- `confirm "Delete this?"` - ask with your own message
- `if confirm "Continue?"; then rm -rf /tmp/myapp; fi` - guard a command

# Options

- `-y`, `--yes` - answer yes without asking
- `CLI_YES=1` - the same, for a whole run

# See also

- `cheat is`
- `cheat zsh-config` - everything zsh-config gives you
