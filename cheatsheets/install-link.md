# install-link

> Symlink `<from>` to `<to>`, backing up what is there. Runs `rm`, `mv` and `ln` through sudo.
> Exit 1 on wrong arguments or any failed step.

# Usage

- Link a config into place:

`install-link ./configs/asdf/.asdfrc ~/.asdfrc`

# Existing target

- A symlink: removed
- A file: moved to `<to>.bak`
- A directory: moved to `<to>_bak`

# Related commands

- `cheat install-box-config`
