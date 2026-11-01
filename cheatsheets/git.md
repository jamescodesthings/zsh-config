# git

> Aliases and helpers zsh-config adds over git. Defined only when `git` is available.

# Getting started

- `gap` - stage hunks one by one (`git add -p`)
- `gcm "message"` - commit with a message
- `git-i-fucked-up` - undo the last commit, keep the changes
- `grbi <ref>` - `git rebase -i --ignore-date`; `grbi HEAD~3` tidies the last few commits

# Branches and merging

- `gcom` - check out the main branch (`gitflow.branch.main`, default `main`)
- `gcod` - check out the develop branch (`gitflow.branch.develop`, errors when unset)
- `git-branch` - print the current branch name
- `gbD <branch>` - `git branch -D`, force delete
- `root` - cd to the repo root
- `gm <branch>` - `git merge`
- `gmff <branch>` - `git merge --ff-only`

# Submodules

- `gsa <url> [path]` - `git submodule add`
- `gsu` - `git submodule update --init --recursive`

# See also

- `cheat git cleanup-branch` - tidy a branch
- `cheat git prune-local` - delete local branches whose origin is gone
- `cheat git i-really-fucked-up` - the bigger undo
- `tldr git` - the rest of git
- `cheat zsh-config` - everything zsh-config gives you
