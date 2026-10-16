# zinit

> Zsh plugin manager. Plugins are declared in `plugins.zsh`; zinit installs itself to `~/.zinit` on first load.

# Commands

- `zinit update`: update all plugins
- `zinit update <plugin>`: update one
- `zinit list`: list loaded plugins
- `zinit report <plugin>`: report for a plugin
- `zinit times`: load time per plugin
- `zinit times | sort -n`: sorted by time

# In plugins.zsh

- `zinit light <user/repo>`: load a plugin
- `zinit load <user/repo>`: load with reporting, for debugging
- `zinit snippet <url-or-path>`: load a single file

# Related commands

- `cheat zshconfig`
