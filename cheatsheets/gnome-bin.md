# gnome-bin

> Window scripts for GNOME on Wayland, in `configs/gnome/bin/`, linked to `~/.local/bin/` by `./installers/gnome`.
> Need the `window-list@personal` extension. Focus scripts exit 0 if focused, 1 if not found; they skip minimised windows.

# Getting started

- `list-windows`: see windows with class, title and minimised state
- `focus-window-by-class <class>`: bring one to the front
- `window-debug-env`: check the extension, tools and fallbacks if something fails

- Next: `quit-all-apps` closes everything at once.

# List windows

- `list-windows`: windows with class, title and minimised state
- `list-window-classes`: classes, sorted and unique
- `list-window-names`: titles, minimised ones prefixed `[minimized]`

# Focus a window

- `focus-window-by-class <class>`: by class (case-insensitive, exact)
- `focus-window-by-name <name>`: by title substring (case-insensitive)
- `focus-window-by-name-regex <pattern>`: by title regex

# Close and debug

- `quit-all-apps`: close every window (apps may ask to save)
- `window-debug-env`: check the extension, tools and fallbacks

# More

- `cheat is`: the predicate the scripts use
- `cheat zsh-config`: everything zsh-config gives you
