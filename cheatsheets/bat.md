# bat

> cat with syntax highlighting and git integration. `cheat` falls back to it when glow is missing.
> Where only `batcat` is installed, `bat` is aliased to it.

# Getting started

- `bat <file>`: print a file highlighted
- `bat -l json <file>`: force the language
- `bat -p --color=always <file>`: plain, coloured, for piping

- Next: `bat --color=never <file>` turns colour off.

# Options

- `-p`: plain output, no decorations
- `--color=always`: keep colour when piped
- `--color=never`: no colour
- `-l <lang>`: set the language
- `-n`: line numbers only
- `--highlight-line <n>`: highlight a line

# More

- `tldr bat`: all the options
- `cheat fzf`: uses bat as its previewer
- `cheat zsh-config`: everything zsh-config gives you
