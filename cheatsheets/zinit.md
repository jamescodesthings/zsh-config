# zinit

Zsh plugin manager. Plugins are declared in `plugins.zsh` in this config.

## Plugin management

- Update all plugins:

`zinit update`

- Update a specific plugin:

`zinit update <plugin>`

- List loaded plugins:

`zinit list`

- Show plugin status and report:

`zinit report <plugin>`

## Loading modes (used in plugins.zsh)

- Load a plugin immediately:

`zinit light <user/repo>`

- Load a plugin and enable reporting (for debugging):

`zinit load <user/repo>`

- Load a snippet (single file):

`zinit snippet <url-or-path>`

## Debugging

- Show what zinit loaded at startup:

`zinit times`

- Check load order and timing:

`zinit times | sort -n`

## Related commands

- Edit plugin declarations
`cheat zshconfig`
