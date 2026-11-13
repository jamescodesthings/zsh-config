# setup

> How this machine's config fits together: which repo owns what, and how changes reach a running session.

# Getting started

- `update` - pull zsh-config, then update the whole machine
- `hub update` - stop sessions, pull hub, install, sync every project's instructions, start the hub
- `hub install` - install or refresh hub's links, hooks, skills, sheets without stopping anything

# Repos

- `~/projects/personal/zsh-config` - the shell, linked as `~/.custom`
- `~/projects/personal/hub` - hub, skills and Claude config
- `~/projects/personal/pkms` - the Anytype knowledge system
- `~/projects/personal/readerr` - text to speech
- `~/projects/personal/apple-scripts` - Google Meet scripts for the Stream Deck

# When to restart

- `exec zsh` - after `update`, or a change to zsh-config or `private.zsh`
- `/exit`, then `cldr` - after `hub install` changes skills, hooks or settings, so Claude reads them again

# Order for a full refresh

- `hub down` - safe point and stop every session
- `update`, then `hub` - update the machine, then bring the hub back

# See also

- `cheat hub install`, `cheat update` - each install in detail
- `cheat help` - the index of our sheets
