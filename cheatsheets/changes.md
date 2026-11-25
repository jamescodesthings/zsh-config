# changes

> What changed in our tools, newest first: the date, what it does, one example, and the sheet with more.
> To add one: a row at the top of Latest, its example as the command, then the date, what changed, and More with its sheet. Move the oldest to `cheat changes older`.

# Getting started

- `cheat changes older` - earlier changes, back to 2026-10-29
- `cheat help` - the index of every sheet

# Latest

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

# See also

- `cheat changes older` - earlier changes
- `cheat help` - the index of our sheets
