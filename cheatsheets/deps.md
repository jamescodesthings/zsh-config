# deps

> Dependency checker used by zsh functions. Verifies required commands are available before running.
> Prints an error for each missing command and install hints. Returns 1 if any are missing.
> Not intended to be called directly by users.

# Usage

- Check that git, gh, and jq are available (returns 1 if any missing):

`deps git gh jq`

# Notes

> Checks each argument with `is available <cmd>`.
> Install hints are defined in `functions/deps` for: asdf, eza, gh, http, python.

# Related commands

- Check if a command is available:
`cheat is`
