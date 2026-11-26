# changes

> What changed in our tools, newest first: the date, what it does, one example, and the sheet with more.
> To add one: a row at the top of Latest, its example as the command, then the date, what changed, and More with its sheet. Move the oldest to `cheat changes older`.

# Getting started

- `cheat changes older` - earlier changes, back to 2026-10-29
- `cheat help` - the index of every sheet

# Latest

- `hub night` - 2026-11-25, resolve that keeps going while you sleep: rounds until only what needs you is left, through rate limits, ending when the queue is empty or you are back (`--until 06:30`). More: `cheat hub night`
- `hub action autopick` - 2026-11-25, at night a child records the recommended option of a question as an auto-pick, never your answer, ships the work and files a check action for you. More: `cheat hub action autopick`
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

# See also

- `cheat changes older` - earlier changes
- `cheat help` - the index of our sheets
