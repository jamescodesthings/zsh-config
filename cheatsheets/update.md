# update

> Pull zsh-config, then run every script in `updaters/` in number order.
> Asks for sudo once; a failed updater is listed at the end and the exit code is 1.

# Getting started

- `update`: run every updater
- `update --errors`: show the last run's errors and warnings, or that it was clean
- Next: `update --list` shows what runs, in order

# Run

- `update <name>...`: only the named updaters, e.g. `update brew tldr`
- `update projects`: pull and reinstall every installed project, agent-forge included
- `update --list`: the updaters in run order

# Error log

- `update --errors --previous`: the newest log, whichever run wrote it
- `.cache/logs/update/<YYYY-MM-DD-HH-MM-SS>.error.log`: `error:` and `warning:` lines, plus the last 30 lines of a failed updater
- A clean run leaves none; the newest 20 are kept

# Language versions

- `configs/asdf/update-policy`: `<tool> latest`, `stable` or `remove` per line
- `configs/asdf/update-policy.<hostname>`: that machine's extras
- `UPDATE_ASDF_DRY_RUN=1 ~/.custom/updaters/040-asdf`: preview the asdf updater
- `ASDF_PIN_ROOTS="$HOME/projects:$HOME/work" update asdf`: look elsewhere for pinning projects
- Never run `bun upgrade`: asdf owns bun
- `could not work out the ... version`: GitHub API limit; run `gh auth login`

# Fixes

- `xcodes install --latest`: Xcode download with an expired Apple ID session
- `brew upgrade --cask <name>`: a cask that needs root fails inside `010-brew`

# More

- `cheat install-release`: Debian release tools
- `cheat zshconfig`
- `cheat zsh-config`: everything zsh-config gives you
