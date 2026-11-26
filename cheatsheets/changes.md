# changes

> What changed in our tools, newest first: the date, what it does, one example, and the sheet with more.
> To add one: a row at the top of Latest, its example as the command, then the date, what changed, and More with its sheet. Move the oldest to `cheat changes older`.

# Getting started

- `cheat changes older` - earlier changes, back to 2026-10-29
- `cheat help` - the index of every sheet

# Latest

- `hub night check` - 2026-11-26, checks the access open actions need before a night; hub night on --wait refuses while any is missing. More: `cheat hub night`
- `ha` - 2026-11-26, pick shows Action #id (N outstanding); notes have a cursor, Enter saves, Esc cancels; Esc returns to the walk from any sub-view. More: `cheat hub action pick`
- `hub dropped` - 2026-11-26, lists work a dropped or killed session left; --pickup works a guarded ladder. More: `cheat hub dropped`
- `hub review run <target>` - 2026-11-26, repeats a review until a blind pass finds nothing new above p2. More: `cheat hub review`
- `hub reports` - 2026-11-26, reports for you to read, filed to ~/Desktop/claude-reports with a zip each; check, read and archive. More: `cheat hub reports`
- `hub resolve end` - 2026-11-26, burn-down chart in the resolve report and a copy on ~/Desktop/hub-reports with a 'Read the overnight report' check action. More: `cheat hub resolve`
- `☾ 07:00` - 2026-11-26, the Claude status line shows a moon while hub night is on; HUB_NIGHT_BADGE=0 hides it. More: `cheat hub night`
- `cheat hub` - 2026-11-26, regrouped by what you are doing, an actions section, new `cheat updating`. More: `cheat updating`
- `ha robot -r` - 2026-11-25, list, show and edit catch up with pick: hub action list takes a repo filter and -r for newest first, as pick does. More: `cheat hub action list`
- `hub action list -s zebra` - 2026-11-25, only the actions whose text, a note or an answer mentions the word, case blind. More: `cheat hub action list`
- `hub action snooze 41`, `z` - 2026-11-25, snooze an action until 07:00 the next morning, out of pick and the waiting count; z in pick does it, u undoes it. More: `cheat hub action pick`
- `e`, `E`, `t` - 2026-11-25, pick keys: e edits an action in a form, E opens its context in your editor, t or Space ticks a checklist box. More: `cheat hub action pick`
- `hub down all` - 2026-11-26, all, children and idle now skip your own Claude sessions; name one to act on it. More: `cheat hub target`
- `hub action add --step ... --option 'A|...'` - 2026-11-26, actions carry numbered steps and selectable options; show and hap fold notes, t toggles. More: `cheat hub action add`
- `hub night` - 2026-11-25, resolve that keeps going while you sleep: rounds until only what needs you is left, through rate limits, ending when the queue is empty or you are back (`--until 06:30`). More: `cheat hub night`
- `hub action autopick` - 2026-11-25, at night a child records the recommended option of a question as an auto-pick, never your answer, ships the work and files a check action for you. More: `cheat hub action autopick`
- `hub history` - 2026-11-25, scan the latest replies of the hub and each session, newest first: up and down move through replies, left and right through sessions, Enter answers one. More: `cheat hub history`

# See also

- `cheat changes older` - earlier changes
- `cheat help` - the index of our sheets
