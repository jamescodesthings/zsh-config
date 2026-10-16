# update

> Pull zsh-config, then run every script in `updaters/` in number order.
> Asks for sudo once; a failed updater is listed at the end and the exit code is 1.

# Usage

- Run every updater:

`update`

- Run only some, by name:

`update brew tldr`

- Pull and reinstall every installed project, agent-forge included (project-manager's `projects`):

`update projects`

- Show the updaters in run order:

`update --list`

- Show the last run's errors and warnings, or that it was clean:

`update --errors`

- Show the newest error log, whichever run wrote it:

`update --errors --previous`

# Error log

- `.cache/logs/update/<YYYY-MM-DD-HH-MM-SS>.error.log`: `error:` and `warning:` lines, plus the last 30 lines of a failed updater
- A clean run leaves none; the newest 20 are kept

# Language versions

- `configs/asdf/update-policy`: `<tool> latest`, `stable` or `remove` per line
- `configs/asdf/update-policy.<hostname>`: that machine's extras
- Preview the asdf updater:

`UPDATE_ASDF_DRY_RUN=1 ~/.custom/updaters/040-asdf`

- Look elsewhere for pinning projects:

`ASDF_PIN_ROOTS="$HOME/projects:$HOME/work" update asdf`

- Never run `bun upgrade`: asdf owns bun
- `could not work out the ... version`: GitHub API limit; run `gh auth login`

# Fixes

- Xcode download with an expired Apple ID session:

`xcodes install --latest`

- A cask that needs root fails inside `010-brew`:

`brew upgrade --cask <name>`

# Related commands

- `cheat zshconfig`
- `cheat install-release`
