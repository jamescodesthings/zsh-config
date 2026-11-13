# git absorb

> Folds staged changes into the earlier commits they belong to, as fixup commits, so review fixes need no manual rebase.
> Installed from the Brewfile.

# Options

- `[-r|--and-rebase]` - also run the autosquash rebase, so the fixups disappear into their commits
- `[-n|--dry-run]` - show what it would do
- `[-b|--base] [commit]` - look no further back than this commit

# Examples

- `git add -p`, then `git absorb --and-rebase` - stage the fixes, fold each into its commit
- `git absorb` - leave fixup commits to check before `git rebase -i --autosquash`

# See also

- `cheat git` - the git sheet
- `cheat git lazygit` - the git terminal UI
