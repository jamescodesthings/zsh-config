# bat

> cat with syntax highlighting and git integration.
> Used as a fallback renderer in cheat when glow is unavailable.

# Usage

- Print file with syntax highlighting:

`bat <file>`

- Print without decorations (plain output, for piping):

`bat -p <file>`

- Print with colour always (even when piped):

`bat -p --color=always <file>`

- Specify language for syntax highlighting:

`bat -l json <file>`

- Show line numbers:

`bat -n <file>`

- Highlight specific line:

`bat --highlight-line 42 <file>`

# Related commands

- cat reference
`tldr cat`
