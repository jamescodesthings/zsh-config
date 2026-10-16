# git

> Aliases and helpers zsh-config adds over git. Defined only when `git` is available.

# Aliases

- `gcm`: `git commit -m`
- `gap`: `git add -p`, stage hunks
- `grbi`: `git rebase -i --ignore-date`
- `gm`: `git merge`
- `gmff`: `git merge --ff-only`
- `gbD`: `git branch -D`
- `gsu`: `git submodule update --init --recursive`
- `gsa`: `git submodule add`
- `root`: cd to the repo root
- `git-i-fucked-up`: `git reset HEAD~1`, undo the last commit and keep the changes

# Gitflow

- `gcom`: check out `git config gitflow.branch.main`, default `main`
- `gcod`: check out `git config gitflow.branch.develop`, no default, errors when unset

# Utilities

- `git-branch`: print the current branch name

# Examples

- Commit with a message:

`gcm "message"`

- Interactive rebase on the last N commits:

`grbi HEAD~3`

# Related commands

- `cheat git-i-really-fucked-up`
- `cheat git-prune-local`
- `cheat git-cleanup-branch`
- `tldr git`
