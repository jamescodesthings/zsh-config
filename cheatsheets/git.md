# git

> Custom git aliases and helpers for this zsh config.

# Aliases

- Commit with message:

`gcm "message"`

- Stage hunks interactively:

`gap`

- Interactive rebase on last N commits:

`grbi HEAD~<n>`

- Checkout main/master branch:

`gcom`

- Checkout develop branch:

`gcod`

- CD to git root of current repo:

`root`


## Gitflow

- Check out the main branch (reads `git config gitflow.branch.main`, defaults to `main`):

`gcom`

- Check out the develop branch (reads `git config gitflow.branch.develop`):

`gcod`

## Utilities

- Print the current branch name:

`git-branch`

# Related commands

- Hard reset to origin/current-branch (destructive)
`cheat git-i-really-fucked-up`

- Delete local branches gone from remote
`cheat git-prune-local`

- Delete a branch locally and on origin
`cheat git-cleanup-branch`

- Standard git subcommands
`tldr git`
