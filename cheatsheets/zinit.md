# zinit

> Zsh plugin manager. Plugins are declared in `plugins.zsh`; zinit installs itself to `~/.zinit` on first load.

# Getting started

- `zinit list`: loaded plugins
- `zinit update`: update all plugins
- `zinit times`: load time per plugin

- Next: add a plugin line to `plugins.zsh`.

# Commands

- `zinit update <plugin>`: update one
- `zinit report <plugin>`: report for a plugin
- `zinit times | sort -n`: sorted by time

# In plugins.zsh

- `zinit light <user/repo>`: load a plugin
- `zinit load <user/repo>`: load with reporting, for debugging
- `zinit snippet <url-or-path>`: load a single file

# More

- `cheat update`: `update` also updates zinit
- `cheat zsh-config`: everything zsh-config gives you
