# install-link

> Symlink `<from>` to `<to>`, backing up what is there. Runs `rm`, `mv` and `ln` through sudo.
> Exit 2 on wrong arguments, 1 on a failed step.

# Getting started

- `install-link <from> <to>` - e.g. `install-link ./configs/asdf/.asdfrc ~/.asdfrc`
- Next: `install-box-config` picks a per-machine `<from>` for you

# Existing target

- A symlink: removed
- A file: moved to `<to>.bak`
- A directory: moved to `<to>_bak`

# Options

- `--plain` - no colour or animation
- `-q`, `--quiet` - print only warnings and errors
- Exit: 0 done, 1 failed, 2 wrong usage

# See also

- `cheat install-box-config`
- `cheat zsh-config` - everything zsh-config gives you
