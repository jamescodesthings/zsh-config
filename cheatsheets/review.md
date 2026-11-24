# review

> Git and code review: gh, stacked PRs and review habits.

# Getting started

- `git switch -c [type]/[scope]-[desc]` - branch off main, never commit to it
- `git push -u origin [branch]` - push without force
- `gh pr create --draft` - open a draft until it is ready

# Pull requests

- `gh pr status` - your PRs and the ones awaiting you
- `gh pr checks [PR] --watch` - follow CI until it settles
- `gh pr diff [PR]` - read a PR's diff in the terminal
- `gh pr review [PR] --approve` - approve after reading

# Stacked PRs

- `gh pr create --draft --base [branch below]` - the next PR in a stack
- The bottom PR targets main; merging it retargets the next one
- Approvals count only on PRs that target the protected branch

# Habits

- One logical change per PR; split an oversized diff first
- Review your own diff before asking anyone else

# See also

- `cheat git` - aliases and helpers over plain git
- `cheat git absorb` - fold fixups into the right commits
- `cheat topics` - all work topics
