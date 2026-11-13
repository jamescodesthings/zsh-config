# iterm2

> The macOS terminal, on trial in place of kitty: Night Owl colours, the Nerd Font, truecolor, option as meta.
> The profile is `configs/iterm2/zsh-config.json` (a Dynamic Profile, linked); settings are in `configs/iterm2/defaults`.

# Getting started

- `cmd+t`, `cmd+d`, `cmd+shift+d` - new tab; split side by side; split top and bottom
- `cmd+opt+arrows`, `cmd+[`, `cmd+]` - move between panes
- `opt+space` - the hotkey window: a terminal that drops down from the top, from anywhere
- iTerm2 menu, Make iTerm2 Default Term - once, by hand

# Extras

- `imgcat [file]`, `it2copy`, `it2dl [file]` - show an image; copy to the clipboard, even over ssh; download a file

# Setup

- `installers/iterm2` - link the profile and write the settings; old ones go to `~/.local/state/zsh-config/iterm2-backups` first
- `defaults import com.googlecode.iterm2 [backup]` - put a backup back, with iTerm2 quit

# See also

- `cheat iterm2 keys`, `cheat iterm2-settings` - every key; keeping settings changed in iTerm2
- `cheat keys` - every key binding
- `cheat kitty` - the kitty keys, while kitty stays installed
- `cheat setup` - how the config fits together
