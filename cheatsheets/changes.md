# changes

> What changed in our tools, newest first: the date, what it does, one example, and the sheet with more.
> To add one: a row at the top of Latest, its example as the command, then the date, what changed, and More with its sheet. Move the oldest to `cheat changes older`.

# Getting started

- `cheat changes older` - earlier changes, back to 2026-10-29
- `cheat help` - the index of every sheet

# Latest

- `hooks/cli-colour-lint` - 2026-11-23, a commit that adds plain echo or print output to a zsh-config tool is stopped; use say or col, or mark data lines `# colour-ok: <reason>`; wipcrypt and iterm2-settings now print say lines. More: `cheat cli`
- `cht tar` - 2026-11-23, a tldr page cheat falls back to keeps its colours instead of printing plain white; piped or NO_COLOR output stays plain. More: `cheat cheat`
- `lazygit`, `git absorb` - 2026-11-19, lazygit and git-absorb now install on Debian too (a GitHub release and apt), not only through the Brewfile. More: `cheat git lazygit`
- `hist delete` - 2026-11-18, `hist delete` and `j delete` work on macOS; sheets made by cheat new pass the strict check; fzf comes with install and update; `link-blender-scripts`, `log` and `config` tab-complete. More: `cheat hist delete`
- `prst` - 2026-11-16, gh pr aliases: `my-prs`, `create-pr`, `open-pr` and `prst`. More: `cheat aliases git`
- `git status` - 2026-11-16, in a repo too big for the dirty counts (the prompt shows ─) the prompt no longer shows a staged +N, which could be stale after a checkout or pull. More: `cheat troubleshoot`
- `installers/iterm2` - 2026-11-16, split panes in iTerm2 no longer have a title bar with a close cross; the bottom status bar stays. More: `cheat iterm2`
- `git diff` - 2026-11-16, the scroll wheel and touchpad scroll pagers in iTerm2 (git, delta, less, man), and text selection still works. More: `cheat iterm2 keys`
- `update` - 2026-11-16, stops before pulling when zsh-config has local changes or unpushed commits, shows them, and on a terminal offers to commit and push them first (default no). More: `cheat update`
- `gh pr view --web` - 2026-11-13, many more iTerm2 snippets and actions, in tag folders: git, gh PRs and runs, Claude, lazygit and absorb. More: `cheat iterm2`
- `false` - 2026-11-13, the iTerm2 status bar now shows the last command's exit code and time (only when it failed or took 5 s or more), the host over ssh, and CPU, memory, network and battery meters; the job and held-tasks items are gone. More: `cheat iterm2`
- `installers/iterm2` - 2026-11-13, iTerm2 snippets in the status bar's Snippets menu: hub status, cldr, gst, git-speedup and lazygit; your own snippets stay. More: `cheat iterm2`
- `gh browse` - 2026-11-13, iTerm2's Actions menu can copy the branch or open the repo in the browser. More: `cheat iterm2`
- `installers/iterm2` - 2026-11-13, the iTerm2 status bar takes Night Owl's colours: a muted bar with the branch, job and tasks picked out. More: `cheat iterm2`
- `installers/iterm2` - 2026-11-13, iTerm2 opens full screen with a status bar at the bottom: folder, branch, job, held tasks, snippets, actions and clock; notifications on. More: `cheat iterm2`
- `cmd+shift+a` - 2026-11-13, iTerm2's Open Quickly is on kitty's command palette key; select last output moves to cmd+shift+o. More: `cheat iterm2 keys`
- `ctrl+shift+arrows` - 2026-11-13, swap iTerm2 panes; in micro cmd+d duplicates the line and cmd+backspace deletes it; inactive panes dimmed less. More: `cheat iterm2 keys`

# See also

- `cheat changes older` - earlier changes
- `cheat help` - the index of our sheets
