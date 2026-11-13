# aliases git

> Git aliases. zsh-config's own replace the oh-my-zsh ones of the same name; the rest come from the oh-my-zsh git plugin.

# Usage

- `gst` - git status (oh-my-zsh)
- `gss` - git status --short (oh-my-zsh)
- `gstu` - git status without untracked files, fast in a monorepo
- `ga [file]`, `gaa` - git add; git add --all (oh-my-zsh)
- `gap` - git add -p, stage hunk by hunk
- `gc` - git commit --verbose (oh-my-zsh)
- `gcm [message]` - git commit -m
- `gp`, `gl` - git push; git pull (oh-my-zsh)
- `gpsup` - push and set upstream to origin (oh-my-zsh)
- `gco [branch]`, `gcb [branch]`, `gsw [branch]` - checkout; new branch; switch (oh-my-zsh)
- `gd` - git diff (oh-my-zsh)
- `glog` - one-line graph log (oh-my-zsh)
- `grbm` - rebase on the main branch (oh-my-zsh)
- `grbi [ref]` - git rebase -i --ignore-date
- `gm [branch]`, `gmff [branch]` - git merge; merge fast-forward only
- `gbD [branch]` - force-delete a local branch
- `gsu`, `gsa [url]` - submodule update --init --recursive; submodule add
- `git-skip [file]`, `git-unskip [file]` - stop and restart tracking local changes to a file
- `git-i-fucked-up` - undo the last commit, keep its changes (reset HEAD~1)
- `root` - cd to the top of this git repo

# See also

- `cheat aliases` - every alias
- `cheat git` - git itself
