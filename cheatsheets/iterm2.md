# iterm2

> The macOS terminal, on trial in place of kitty: opens full screen, Night Owl colours, the Nerd Font at 14, option as meta.
> `cheat iterm` works too. The profile is `configs/iterm2/zsh-config.json`; settings and menu keys are in `configs/iterm2`.

# Getting started

- `cmd+enter`, `cmd+shift+enter` - split side by side; split top and bottom
- `cmd+ctrl+arrows`, `cmd+[`, `cmd+]` - go to the pane in that direction; previous or next pane
- `opt+space` - the hotkey window, from any app

# Panes and tabs

- `cmd+opt+enter`, `cmd+w` - zoom the pane and back; close the pane or tab
- `ctrl+opt+arrows`, `ctrl+shift+arrows` - resize the pane; swap it with its neighbour
- `cmd+t`, `cmd+n` - new tab here; new window
- `cmd+shift+[`, `cmd+shift+]`, `cmd+1` to `cmd+9` - previous or next tab; pick a tab
- `cmd+ctrl+f` - full screen (`cmd+enter` splits now)

# Extras

- `cmd+;`, `cmd+shift+;`, `cmd+opt+b` - autocomplete; command history; instant replay
- `cmd+shift+a` - Open Quickly, to find a session, tab, command or setting
- `imgcat [file]`, `it2copy`, `it2dl [file]` - show an image; copy to the clipboard, even over ssh; download a file
- Status bar, at the bottom in Night Owl blue - folder, branch, job, held hub tasks, clock; the Snippets menu (hub status, cldr, gst, git-speedup, lazygit) and actions: copy the branch, open the repo in the browser
- micro - its own profile switches on while micro runs, so cmd+s, cmd+z, cmd+c and the rest reach it, cmd+d duplicates the line and cmd+backspace deletes it

# Setup

- `installers/iterm2` - link the profile, write the settings, menu keys and snippets (yours are kept); old ones go to `~/.local/state/zsh-config/iterm2-backups` first

# See also

- `cheat iterm2 keys`, `cheat iterm2-settings` - every key; keeping settings changed in iTerm2
- `cheat keys`, `cheat kitty` - every key binding; the kitty keys, while kitty stays
