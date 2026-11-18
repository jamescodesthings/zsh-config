# cli pick

> Ask for a missing argument with fzf, so a tool never hangs or guesses.
> The header says what happens after the choice; the first item is the default and Enter takes it.

# Options

- `pick <header> <items...>` - choose one item and print it
- `[-v|--var] <VAR>` - store the choice in VAR instead of printing it
- `--` - end of options, for a header that starts with a dash
- plain mode, no fzf, or no terminal on stdin and stderr - fails naming the missing argument (the header), never waits
- `CLI_PICK_FORCE=1` - skip the terminal check, for tests with a fake fzf

# Examples

- `pick "which branch to delete" main dev topic` - print the choice
- `pick -v branch "which branch to delete" main dev topic` - store it

# Notes

- Exit: 0 chosen, 1 escape or ctrl-c (prints nothing), 2 missing header, items or variable name, or no way to ask

# See also

- `cheat cli` - the top sheet
- `cheat cli run-quiet` - run a command quietly
