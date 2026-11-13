# troubleshoot

> Fixes for problems already seen on this machine, symptom first.

# Getting started

- `hub doctor` - checks hub, keys, Anytype and context cost; start here
- `update --errors` - what the last `update` run logged
- `log open last` - the last run's log of any house tool

# Seen before

- Readerr reads the clipboard, not the selection - a rebuild signed ad hoc lost the Accessibility grant; build with a stable identity (`cheat readerr setup`), then re-grant in System Settings
- A new key in `private.zsh` is not seen - run `source ~/.custom/private.zsh`, or open a new shell
- An MCP server is missing or failed - run `/mcp` in the session to reconnect; check `~/.claude.json`
- `rg: command not found` - `brew install ripgrep`; for any tool, `brew install` it, then `exec zsh`
- A sheet is missing from `cheat` - run `link-cheatsheets` in that repo's `cheatsheets/`, or that repo's install

# See also

- `cheat hub doctor` - every check doctor runs
- `cheat readerr doctor` - readerr's own checks
- `cheat help` - the index of our sheets
