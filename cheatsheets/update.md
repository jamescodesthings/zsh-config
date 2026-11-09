# update

> Pull zsh-config, then run every script in `updaters/` in number order, quietly, with a step counter.
> Asks for sudo once (again if the ticket lapses mid-run); a failed updater is listed at the end and the exit code is 1.

# Getting started

- `update` - run every updater
- `update --errors [--previous]` - the last run's errors and warnings, or that it was clean; `--previous` for the newest log whichever run wrote it
- `update --list` - the updaters in run order

# Run

- `update <name>...` - only the named updaters, e.g. `update brew tldr`
- `update projects` - pull and reinstall every installed project, hub included
- `update [-v|--verbose]` - show each updater's output as it runs instead of the step counter
- `update [-q|--quiet]` - print only warnings, failures and the log
- `update --plain` - no colour or animation
- `# update: interactive` - a marker line near the top of an updater: with a terminal it gets stdin and live output for prompts (`035-xcode`, Apple sign-in and 2FA); without one it runs quietly

# Logs

- `log open last` - this run's log; a failed updater's fix line gives the exact `log open <name>` for its output
- `~/.custom/logs/update/<YYYY-MM-DD-HH-MM-SS>.error.log` - warning and failure lines per updater, plus the last 30 lines of a failed one; a clean run leaves none, the newest 20 are kept

# See also

- `cheat update asdf` - language versions, the update policy and common fixes
- `cheat install-release` - Debian release tools
- `cheat zshconfig`
- `cheat zsh-config` - everything zsh-config gives you
