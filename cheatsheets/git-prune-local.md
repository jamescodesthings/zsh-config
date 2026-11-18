# git-prune-local

> Delete local branches whose origin branch is gone (git branch -D).
> Lists them and asks first.

# Options

- `--plain` - no colour or animation
- `-q`, `--quiet` - print only warnings and errors
- Exit: 0 done, 1 failed; extra arguments are ignored

# Examples

- `git-prune-local` - run `git fetch --prune` first so gone branches show, then list and prune

# See also

- `cheat git`
- `cheat git-cleanup-branch` - delete one named branch
- `cheat zsh-config` - everything zsh-config gives you
