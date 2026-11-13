# iterm2

> The macOS terminal, on trial in place of kitty: Night Owl colours, the Nerd Font at 14, truecolor, option as meta.
> `cheat iterm` works too. The profile is `configs/iterm2/zsh-config.json`; settings and menu keys are in `configs/iterm2`.

# Getting started

- `cmd+enter`, `cmd+shift+enter` - split side by side; split top and bottom
- `cmd+ctrl+arrows`, `cmd+[`, `cmd+]` - go to the pane in that direction; previous or next pane
- `opt+space` - the hotkey window, from any app

# Panes and tabs

- `cmd+opt+enter`, `cmd+w` - zoom the pane and back; close the pane or tab
- `ctrl+opt+arrows` - resize the pane
- `cmd+t`, `cmd+n` - new tab here; new window
- `cmd+shift+[`, `cmd+shift+]`, `cmd+1` to `cmd+9` - previous or next tab; pick a tab
- `cmd+ctrl+f` - full screen (`cmd+enter` splits now)

# Extras

- `cmd+;`, `cmd+shift+;`, `cmd+opt+b` - autocomplete; command history; instant replay
- `imgcat [file]`, `it2copy`, `it2dl [file]` - show an image; copy to the clipboard, even over ssh; download a file
- micro - its own profile switches on while micro runs, so cmd+s, cmd+z, cmd+c and the rest reach it

# Setup

- `installers/iterm2` - link the profile, write the settings and menu keys; old settings go to `~/.local/state/zsh-config/iterm2-backups` first

# See also

- `cheat iterm2 keys`, `cheat iterm2-settings` - every key; keeping settings changed in iTerm2
- `cheat keys` - every key binding
- `cheat kitty` - the kitty keys, while kitty stays installed
