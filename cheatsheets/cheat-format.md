# cheat format

> The shared shape of every repo's cheat sheets: get a first-time user working, then serve as the reference.
> Check it with `cheatsheet-test --strict <dir>`; every line keeps the tldr shape.

# Top sheet: tool.md

- First line: `# tool`, then one `>` line saying what it is for, and at most one more for what it needs
- `# Getting started`: the 2 or 3 commands that get you working, then one line on what to do next
- Then the everyday groups, in the order a user works, then maintenance
- Command lines show their options and targets: `` `tool join [target] [--all]` ``: what it does
- `# More`: `cheat tool <command>`, the topic sheets, and `see cheat <repo>`
- Fits half a kitty window split horizontally: 35 rendered lines

# Command sheet: tool-command.md

- `# tool command`, then what it does and why in 2 `>` lines at most
- `# Options`: every option and flag, one line each
- `# Examples`: a description line, then the command in backticks
- `# See also`: related sheets, then any quirks, one line each

# Topic sheet: tool-topic.md

- For a subject rather than a command (`cheat hub target`, `cheat hub messages`)
- `# Examples` of what to run, how and why, then `# See also`

# Repo overview: repo.md

- `cheat zsh-config`, `cheat agent-forge`, `cheat pkms`: the repo as a whole, its tools grouped by job
- Every top sheet of a repo's tools points back to it under `# More`

# Lines

- A line starts with `# `, `> `, `- ` or a backtick; an example line is one command ending in a backtick
- No `##`, no code fences, no indenting, no wrapped lines
- Headings are plain words; the renderer colours them, so no icons
- Colour off:

`NO_COLOR=1 cheat hub`

# --help

- `tool [words...] --help` shows `cheat tool [words...]`, all other flags ignored
- A word with no sheet falls back to the nearest parent: `cheat hub join all` shows `cheat hub join`
- In a zsh tool, as its first line:

`cheat-help tool "$@" && return 0`

# See also

- `cheat cheatsheet-test`: the line and structure checks
- `cheat cheat new`: start a sheet from the template
- `cheat zsh-config`: the repo overview
