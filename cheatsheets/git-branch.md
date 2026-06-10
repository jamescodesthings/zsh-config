# git-branch

> Print the current git branch name.

## Usage

`git-branch`

## Notes

- Thin wrapper around `git rev-parse --abbrev-ref HEAD`
- Used internally by other functions (e.g. `git-i-really-fucked-up`, `git-cleanup-branch`)

## Related commands

- Delete a branch locally and remotely:
`cheat git-cleanup-branch`

- Prune local branches gone from remote:
`cheat git-prune-local`
