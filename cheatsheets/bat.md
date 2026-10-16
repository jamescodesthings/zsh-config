# bat

> cat with syntax highlighting and git integration. `cheat` falls back to it when glow is missing.
> Where only `batcat` is installed, `bat` is aliased to it.

# Options

- `-p`: plain output, no decorations
- `--color=always`: keep colour when piped
- `-l <lang>`: set the language
- `-n`: line numbers only
- `--highlight-line <n>`: highlight a line

# Usage

- Print a file highlighted:

`bat <file>`

- Plain, coloured, for piping:

`bat -p --color=always <file>`

- Force the language:

`bat -l json <file>`

# Colour

- Turn colour off:

`bat --color=never <file>`

# Related commands

- `tldr cat`
