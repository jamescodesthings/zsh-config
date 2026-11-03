# git-cleanup-branch

> Delete a branch locally (git branch -D) and on origin.
> Refuses main, master and the current branch.

# Options

- `--plain` - no colour or animation
- `-q`, `--quiet` - print only warnings and errors
- Exit: 0 done, 1 failed, 2 wrong usage

# Examples

- Delete the branch:

`git-cleanup-branch <branch>`

# See also

- `cheat git`
- `cheat zsh-config` - everything zsh-config gives you
- `cheat git-prune-local`
- Exit 1 on refusal or failure
