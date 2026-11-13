# iterm2

> The macOS terminal, on trial in place of kitty: Night Owl colours, the Nerd Font, truecolor, option as meta.
> The profile is `configs/iterm2/zsh-config.json` (a Dynamic Profile, linked); settings are in `configs/iterm2/defaults`.

# Getting started

- `cmd+t`, `cmd+d`, `cmd+shift+d` - new tab; split side by side; split top and bottom
- `cmd+opt+arrows`, `cmd+[`, `cmd+]` - move between panes
- iTerm2 menu, Make iTerm2 Default Term - once, by hand

# Panes and tabs

- `cmd+shift+enter`, `cmd+w` - zoom the pane and back; close the pane or tab
- `cmd+1` to `cmd+9`, `cmd+shift+[`, `cmd+shift+]` - pick a tab; previous or next tab

# Editing and finding

- `opt+left`, `opt+right`, `opt+backspace` - back, forward or delete one word
- `cmd+left`, `cmd+right`, `cmd+backspace` - start or end of the line; delete to the start
- `cmd+f`, `cmd+k`, `cmd+shift+h` - search the scrollback; clear; paste history
- `cmd+shift+up`, `cmd+shift+down` - jump between prompts (shell integration)
- `cmd+click` - open a link or file; select to copy

# Setup

- `installers/iterm2` - link the profile and write the settings; old ones go to `~/.local/state/zsh-config/iterm2-backups` first
- `defaults import com.googlecode.iterm2 [backup]` - put a backup back, with iTerm2 quit

# See also

- `cheat keys` - every key binding
- `cheat kitty` - the kitty keys, while kitty stays installed
- `cheat setup` - how the config fits together
