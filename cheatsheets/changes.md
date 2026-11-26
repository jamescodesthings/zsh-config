# changes

> What changed in our tools, newest first: the date, what it does, one example, and the sheet with more.
> To add one: a row at the top of Latest, its example as the command, then the date, what changed, and More with its sheet. Move the oldest to `cheat changes older`.

# Getting started

- `cheat changes older` - earlier changes, back to 2026-10-29
- `cheat help` - the index of every sheet

# Latest

- `ha robot -r` - 2026-11-25, list, show and edit catch up with pick: hub action list takes a repo filter and -r for newest first, as pick does. More: `cheat hub action list`
- `hub action list -s zebra` - 2026-11-25, only the actions whose text, a note or an answer mentions the word, case blind. More: `cheat hub action list`
- `hub action snooze 41`, `z` - 2026-11-25, snooze an action until 07:00 the next morning, out of pick and the waiting count; z in pick does it, u undoes it. More: `cheat hub action pick`
- `e`, `E`, `t` - 2026-11-25, pick keys: e edits an action in a form, E opens its context in your editor, t or Space ticks a checklist box. More: `cheat hub action pick`
- `hub down all` - 2026-11-26, all, children and idle now skip your own Claude sessions; name one to act on it. More: `cheat hub target`
- `hub action add --step ... --option 'A|...'` - 2026-11-26, actions carry numbered steps and selectable options; show and hap fold notes, t toggles. More: `cheat hub action add`
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

# See also

- `cheat changes older` - earlier changes
- `cheat help` - the index of our sheets
