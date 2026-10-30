# cheat

> Show a personal cheatsheet from `~/cheatsheets`, falling back to tldr when none matches.
> Renders with tldr, then glow, bat, cat. Needs `CHEATSHEET_DIR` set. Exit: 0 done, 1 error.

# Getting started

- `cheat <tool>`: show a sheet, e.g. `cheat git`
- `cheat`: list every local sheet
- `cheat search <query>`: find a sheet by part of its name
- Next: `cheat cheat new <name>` makes a sheet of your own

# Show a sheet

- `cheat <word> [<word>...]`: words join with `-`, so `cheat git commit` shows `git-commit.md`
- `cheat <tool> <word>`: a word with no sheet falls back to the nearest parent sheet
- `cheat <tool> --raw`: print the markdown instead of rendering it
- `<tool> --help`: zsh-config tools show their own sheet
- `NO_COLOR=1 cheat <tool>`: colour off

# Make and keep sheets

- `cheat cheat new <name>`: create from the template and link it
- `cheat cheat edit <name>`: open in `$EDITOR`
- `cheat cheat raw <name>`: print a sheet's markdown
- `cheat cheat refresh`: refresh the tldr cache (it also refreshes itself every 7 days)

# Rules

- `list`, `search`, `edit`, `new`, `refresh`, `raw` and `help` are reserved: no sheet can have those names
- `$VAR` names outside backticks expand when shown
- `cheat help`, `cheat -h` and `cheat --help` show this sheet

# More

- `cheat cheat list`, `cheat cheat search`, `cheat cheat new`, `cheat cheat edit`, `cheat cheat raw`, `cheat cheat refresh`: one sheet each
- `cheat cheat format`: the shared sheet structure
- `cheat cheatsheet-test`: check sheets render
- `cheat link-cheatsheets`: link a project's sheets in
- `cheat zsh-config`: everything zsh-config gives you
