# git-speedup

> Checks this repo's local git settings for a big working tree and prints the command for each one missing.
> Writes nothing unless `--apply`, which sets them in this repo only and starts background maintenance.

# Options

- `--apply` - set core.fsmonitor, core.untrackedCache and feature.manyFiles here, then `git maintenance start`
- `--plain` - no colour

# Examples

- `git-speedup` - what is missing in this repo
- `git-speedup --apply` - set it all

# Notes

- The prompt hides dirty counts above 100k files, since gitstatusd cannot use fsmonitor; `gstu` is a fast `git status`
- `scalar register` does more for one repo, and `git sparse-checkout` cuts the tree itself

# See also

- `cheat functions git` - the other git functions
- `cheat aliases git` - git aliases
