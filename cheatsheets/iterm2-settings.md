# iterm2-settings

> Brings settings changed in iTerm2's own window under management, in `configs/iterm2/defaults`.
> Diffs the live settings against a snapshot you take, ignoring window positions and other noise.

# Usage

- `iterm2-settings baseline` - snapshot the live settings; do this before changing things in iTerm2
- `iterm2-settings diff` - what changed since the snapshot and is not managed yet
- `iterm2-settings adopt [key,key]` - copy a setting's live value into the managed list
- `iterm2-settings drop [key,key]` - take a setting out of the list; iTerm2 keeps its value
- `iterm2-settings status` - every managed setting, ok or drifted

# Examples

- `iterm2-settings adopt HideScrollbar` - keep the scrollbar hidden on every Mac

# Notes

- Profile changes are a list, not a plain value: Profiles, Other Actions, Save Profile as JSON, then copy what you want into `configs/iterm2/zsh-config.json`
- `configs/iterm2/ignore` lists the keys diff never offers
- `installers/iterm2` applies the managed list on any Mac

# See also

- `cheat iterm2` - the terminal itself
