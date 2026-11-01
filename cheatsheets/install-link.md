# install-link

> Symlink `<from>` to `<to>`, backing up what is there. Runs `rm`, `mv` and `ln` through sudo.
> Exit 1 on wrong arguments or any failed step.

# Getting started

- `install-link <from> <to>` - e.g. `install-link ./configs/asdf/.asdfrc ~/.asdfrc`
- Next: `install-box-config` picks a per-machine `<from>` for you

# Existing target

- A symlink: removed
- A file: moved to `<to>.bak`
- A directory: moved to `<to>_bak`

# See also

- `cheat install-box-config`
- `cheat zsh-config` - everything zsh-config gives you
