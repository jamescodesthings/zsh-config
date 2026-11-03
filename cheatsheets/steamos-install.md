# steamos-install

> Reinstalls what a SteamOS update wipes: desktop entries, pacman keys, konsole, zsh, sublime, VNC, base-devel, fzf and yay.
> Needs sudo. A failed step is listed at the end and the rest carry on.

# Getting started

- `steamos-install` - run every post-update step

# Options

- `[-h|--help]` - show this sheet
- `[--plain]` - no colour

# Variables

- `DESKTOP` - where the desktop entries go (default `~/Desktop`)
- `CUSTOM_STEAM` - the folder holding the entries (default `$CUSTOM_DIR/steamos`)

# See also

- `cheat update` - update the whole machine
- `cheat zsh-config` - everything zsh-config gives you
