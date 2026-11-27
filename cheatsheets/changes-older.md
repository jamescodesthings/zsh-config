# changes older

> Earlier changes, newest first. Entries move here from `cheat changes` when it fills up.

# Earlier

- `hub history` - 2026-11-25, scan the latest replies of the hub and each session, newest first: up and down move through replies, left and right through sessions, Enter answers one. More: `cheat hub history`
- `hub questions robot` - 2026-11-25, the questions you asked, each paired with the reply that answered it, in the hub history reader. More: `cheat hub questions`
- `hub sudo robot --re 412 yes` - 2026-11-25, your words as an answer to one stored reply, by the id hub history shows. More: `cheat hub sudo`
- `ha` - 2026-11-25, replies point at ha instead of listing actions; the status line shows run ha to act. More: `cheat hub action pending`
- `ha` - 2026-11-25, bare hub action opens pick (alias ha), hub action hide/unhide, pick --all shows hidden and blocked actions, blockers in red, left/right to look back. More: `cheat hub action pick`
- `ha robot --reverse` - 2026-11-25, hub action pick takes a fuzzy repo filter and -r/--reverse for newest first. More: `cheat hub action pick`
- `hub action edit <id>` - 2026-11-25, with no flags opens your editor; hub action note <id> likewise; e in ha edits. More: `cheat hub action`
- `hub down all --force` - 2026-11-25, kills stalled sessions with no handover; the stall message walks through it. More: `cheat hub down`
- `hub status` - 2026-11-25, each session shows its short id; hub status <name> shows the full session id. More: `cheat hub status`
- `har`, `hal` - 2026-11-25, hub aliases: `har` picks a report to read; `hal` now picks from the action list, Enter opens a report and m marks it read. More: `cheat hub action report`
- `hub join --detach` - 2026-11-25, hub and hubx join take `--detach` or `--no-attach` (or HUB_NO_ATTACH=1) to start a session without attaching; inside tmux, join switches the client instead. More: `cheat hub join`
- `ham` - 2026-11-25, hub alias: `ham` lists only the actions waiting on you (`hub action list --mine`). More: `cheat aliases claude`
- `ha`, `hst` - 2026-11-24, hub aliases: `ha` answers waiting actions, `hal` lists them, `has 41` shows one, `hst` is hub status. More: `cheat aliases claude`
- `zshc` - 2026-11-24, zshconfig opens the config in VS Code (else micro) instead of changing into it; VS Code adds a final newline on save. More: `cheat zshconfig`
- `cmd+shift+enter` - 2026-11-25, splits top and bottom again in iTerm2 3.7.9, whose British menus renamed Maximize to Maximise and let it take the key back; quit and reopen iTerm2 once. More: `cheat iterm2 keys`
- `cheat topics` - 2026-11-24, sheets for languages, platforms, tools and topics (java to typescript, ios and android, bazel and buf, testing to api design); new TUIs use gum. More: `cheat languages`
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
- `cmd+enter` - 2026-11-13, iTerm2 keys like kitty: split with cmd+enter, panes on cmd+ctrl+arrows, resize on ctrl+opt+arrows, a micro profile, lighter dimming, and `cheat iterm`. More: `cheat iterm2 keys`
- `installers/iterm2` - 2026-11-13, the iTerm2 status bar is gone, and the font is 14 point. More: `cheat iterm2`
- `git absorb --and-rebase` - 2026-11-13, lazygit and git-absorb come with the Brewfile. More: `cheat git absorb`
- `iterm2-settings diff` - 2026-11-13, settings changed in iTerm2's window can be adopted into the repo, or dropped. More: `cheat iterm2-settings`
- `imgcat photo.png` - 2026-11-13, iTerm2 extras: an opt+space hotkey window, a status bar (folder, git, CPU, memory, clock) and the iTerm2 utilities. More: `cheat iterm2`
- `installers/iterm2` - 2026-11-13, iTerm2 replaces kitty on macOS as a trial: Night Owl profile, option as meta, mouse for micro, shell integration. More: `cheat iterm2`
- `compress-pdf-all -r` - 2026-11-12, compress the PDFs in every folder below, each into its own compressed/. More: `cheat compress-pdf-all`
- `md-to-pdf -r . --combine` - 2026-11-12, convert every .md under a folder and join them into one pdf named after this folder. More: `cheat md-to-pdf`
- `cheat help` - 2026-11-12, an index of our own sheets, basics first. More: `cheat help`
- `j alias add tutorial .` - 2026-11-12, fixed bookmarks to folders; then `j tutorial` jumps there. More: `cheat j alias`
- `cheat functions` - 2026-11-12, every zsh-config function, one row each in groups. More: `cheat functions`
- `cheat aliases` - 2026-11-12, every alias, most used first. More: `cheat aliases`
- `readerr speak` - 2026-11-12, with nothing selected, reads the front window's whole document, PDFs included. More: `cheat readerr speak`
- `readerr config set volume 0.6` - 2026-11-12, a playback volume setting. More: `cheat readerr config`
- `link-blender-scripts` - 2026-11-11, Blender startup scripts linked into every Blender version. More: `cheat link-blender-scripts`
- `key pull myproj` - 2026-11-08, key names its direction: pull, push, import, export. More: `cheat key`
- `hub` - 2026-11-08, agent-forge is now called hub. More: `cheat hub`
- `hub task list` - 2026-11-07, hub task: the Claude-tagged Anytype tasks from the shell, replacing the old any CLI. More: `cheat hub action`
- `hub resolve` - 2026-11-04, resolve every Claude task across the repos in rounds. More: `cheat hub resolve`
- `readerr speak` - 2026-11-04, readerr reads headings, lists, tables and code by their shape, at terse, normal or detailed level. More: `cheat readerr speak`
- `update` - 2026-11-03, the updater runs quietly with a step counter and keeps an error log; `update --errors` shows it. More: `cheat update`
- `key create myproj` - 2026-11-03, per-project named keys kept outside git and backed by 1Password. More: `cheat key create`
- `log open last` - 2026-11-01, every tool run keeps a log. More: `cheat log`
- `config mytool list` - 2026-11-01, per-tool settings in JSON. More: `cheat config`
- `cheat git` - 2026-11-01, sheets render in the shared palette with aligned columns. More: `cheat cheat`
- `j --help` - 2026-10-30, every tool's --help shows its cheat sheet. More: `cheat cheat`
- `j move ~/old ~/new` - 2026-10-29, carry z ranks and history over to a moved folder. More: `cheat j move`

# See also

- `cheat changes` - the latest changes
