# cheat format

> The shared shape of every repo's cheat sheets: get a first-time user working, then serve as the reference.
> Rendered by cheat-render; check with `cheatsheet-test --strict <dir>`.

# Top sheet: tool.md

- First line: `# tool`, then one `>` line saying what it is for, and at most one more for what it needs
- `# Getting started` - the 2 or 3 commands that get you working
- Then the everyday groups, in the order a user works, then maintenance
- A row is `- `, the command in backticks, ` - `, then what it does; options and targets show in the command
- Flag alternatives go in brackets: `[-n|--lines N]`
- `# Variables` - when present, just before the last section
- `# See also` last, exactly - `cheat tool <command>`, the topic sheets, and the repo as an ordinary row
- Fits half a kitty window split horizontally: 35 rendered lines

# Rows and spans

- The renderer aligns the second column: its width is the longest command, capped at 40
- A command longer than 40 drops its explanation to the next line
- Never pad by hand
- Inline spans: `[text]{.warn .bold}`, with palette roles, hues, `hue-NN` and `bold`
- `cheat cli sheets` has the details

# Command sheet: tool-command.md

- `# tool command`, then what it does and why in 2 `>` lines at most
- `# Options` - every option and flag, one line each
- `# Examples` - a description line, then the command in backticks
- `# See also` - related sheets, then any quirks, one line each

# Topic sheet: tool-topic.md

- For a subject rather than a command (`cheat hub target`, `cheat hub messages`)
- `# Examples` of what to run, how and why, then `# See also`

# Repo overview: repo.md

- `cheat zsh-config`, `cheat agent-forge`, `cheat pkms` - the repo as a whole, its tools grouped by job
- Every top sheet of a repo's tools points back to it under `# See also`, as an ordinary aligned row

# Lines

- A line starts with `# `, `> `, `- ` or a backtick; an example line is one command ending in a backtick
- No `##`, no code fences, no indenting, no wrapped lines
- Headings are plain words; the renderer colours them, so no icons
- Standard headings, spelled exactly and in this order, others allowed between: Getting started, Usage, Options, Examples, Variables, See also
- A row may list several commands, each in its own backticks, joined by commas; a long list reads better as a prose item that starts with words, such as Git helpers, then the sheets
- A word after the tool is a subcommand only when its sheet exists (`hub-join.md`); other words colour as targets
- Colour off:

`NO_COLOR=1 cheat hub`

# --help

- `tool [words...] --help` shows `cheat tool [words...]`, all other flags ignored
- A word with no sheet falls back to the nearest parent: `cheat hub join all` shows `cheat hub join`
- In a zsh tool, as its first line:

`cheat-help tool "$@" && return 0`

# See also

- `cheat cli sheets` - writing for the renderer
- `cheat cheatsheet-test` - the line and structure checks
- `cheat cheat new` - start a sheet from the template
- `cheat zsh-config` - the repo overview
