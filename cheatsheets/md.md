# md

> Make a directory (with parents) and cd into it.
> Not the markdown converters; those are `md-to-html` and `md-to-pdf`.

# Getting started

- `md <path>` - make the directory and cd into it
- `md --no-follow <path>` - make it without entering

- Next: convert markdown with `md-to-html` or `md-to-pdf`.

# Options

- `--no-follow` - create the directory without changing into it
- `--help` - show usage

# Examples

- Make and enter:

`md ~/projects/my-app`

- Make without entering:

`md --no-follow dist/assets`

# See also

- `cheat md-to-html` - markdown to a styled html page
- `cheat md-to-pdf` - markdown to an A4 pdf
- `cheat zsh-config` - everything zsh-config gives you
