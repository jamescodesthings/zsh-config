# deps

> Check that commands exist; used by other functions.
> Prints `missing dependency:` and an install hint for each one missing. Exit 1 if any is missing.
> Hints exist for asdf, eza, gh, http and python.

# Getting started

- `deps <command>...` - e.g. `deps git gh jq`
- Next: `is available <command>` tests one command quietly

# Options

- `--plain` - no colour or animation
- `-q`, `--quiet` - print only warnings and errors
- Exit: 0 done, 1 failed, 2 wrong usage

# See also

- `cheat is`
- `cheat zsh-config` - everything zsh-config gives you
