# md-to-html

> Convert markdown to a styled, self-contained html page next to each input.
> Overwrites existing output. Needs pandoc and file.

# Options

- `-o`, `--output <file>` - write one file elsewhere (ends in .html or .htm, not the input)
- `--help` - show usage
- `--plain` - no colour or animation
- `-q`, `--quiet` - print only warnings and errors
- Exit: 0 done, 1 failed, 2 wrong usage

# Examples

- Convert one file:

`md-to-html notes.md`

- Convert several:

`md-to-html *.md`

- Write elsewhere:

`md-to-html notes.md -o ~/Desktop/notes.html`

# See also

- `cheat md-to-pdf`
- `cheat zsh-config` - everything zsh-config gives you
