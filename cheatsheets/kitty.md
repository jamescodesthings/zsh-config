# kitty

> Terminal keys for this config. macOS keys live in `configs/kitty/os.macos.conf`,
> Linux keys in `configs/kitty/os.linux.conf`; kitty loads the one for the OS it runs on.

# Usage

- New tab in the current folder:

`cmd+t` (Linux: `ctrl+t`)

- New pane in the current folder:

`cmd+enter` (Linux: `ctrl+shift+enter`)

- Split the pane to the right or below:

`cmd+d` / `cmd+shift+d`

- Close the pane (the last pane closes its tab):

`cmd+w` (Linux: `ctrl+w`)

- Zoom the current pane to full size and back:

`cmd+shift+enter`

- Move focus to the pane in that direction:

`ctrl+arrows`

- Step to the previous or next pane:

`cmd+[` / `cmd+]`

- Move the pane itself:

`ctrl+shift+arrows`

- Jump to the start or end of the command line:

`cmd+left` / `cmd+right`

- Move a word left or right:

`opt+left` / `opt+right`

- Search the scrollback (opens the pager, then press `/`):

`cmd+f`

- Detach the pane into its own tab or window:

`cmd+opt+p`

- Command palette:

`cmd+shift+a` (Linux: `ctrl+shift+a`)

# Notes

> Selecting text copies it to the clipboard; `cmd+c` and `cmd+v` still copy and paste.
> kitty's own macOS keys still work: `cmd+k` clears, `cmd+1` to `cmd+9` pick a tab,
> `cmd+shift+[` and `]` step through tabs, `cmd+plus` and `cmd+minus` change the font size.
> `ctrl+left` and `ctrl+right` only reach kitty while macOS's "Move left/right a space"
> shortcuts are off or moved (System Settings, Keyboard, Keyboard Shortcuts, Mission Control).
> The config reloads itself when saved.

# Related commands

- `cheat zshconfig`
