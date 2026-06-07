# gnome-bin

> Window management scripts for GNOME Wayland sessions.
> Requires the `window-list@personal` D-Bus extension. Install with `./installers/gnome`.
> All scripts in `configs/gnome/bin/`, symlinked to `~/.local/bin/` by the installer.

## quit-all-apps

- Gracefully close all open application windows (save dialogs appear for unsaved work):

`quit-all-apps`

## list-windows

- List all windows with class, title, and minimized state (table format):

`list-windows`

## list-window-classes

- List all open window WM_CLASS values (sorted, unique — useful for focus scripts):

`list-window-classes`

## list-window-names

- List all window titles (minimized windows prefixed with `[minimized]`):

`list-window-names`

## focus-window-by-class

- Bring window to front by WM_CLASS (case-insensitive exact match, non-minimized only):

`focus-window-by-class <class>`

## focus-window-by-name

- Bring window to front by title substring (case-insensitive, non-minimized only):

`focus-window-by-name <name>`

## focus-window-by-name-regex

- Bring window to front by title regex (non-minimized only):

`focus-window-by-name-regex <pattern>`

## window-debug-env

- Diagnose the window management environment: extension status, available tools, fallback methods:

`window-debug-env`

## Related commands

- Check session type and desktop:
`cheat is`
