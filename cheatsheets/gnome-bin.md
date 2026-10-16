# gnome-bin

> Window scripts for GNOME on Wayland, in `configs/gnome/bin/`, linked to `~/.local/bin/` by `./installers/gnome`.
> Need the `window-list@personal` extension. Focus scripts exit 0 if focused, 1 if not found; they skip minimised windows.

# Scripts

- Close every window (apps may ask to save):

`quit-all-apps`

- List windows with class, title and minimised state:

`list-windows`

- List window classes, sorted and unique:

`list-window-classes`

- List window titles, minimised ones prefixed `[minimized]`:

`list-window-names`

- Focus by class (case-insensitive, exact):

`focus-window-by-class <class>`

- Focus by title substring (case-insensitive):

`focus-window-by-name <name>`

- Focus by title regex:

`focus-window-by-name-regex <pattern>`

- Check the extension, tools and fallbacks:

`window-debug-env`

# Related commands

- `cheat is`
