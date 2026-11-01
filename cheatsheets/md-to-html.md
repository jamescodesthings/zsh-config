# md-to-html

> Convert markdown to a styled, self-contained html page next to each input.
> Overwrites existing output. Needs pandoc and file.

# Options

- `-o`, `--output <file>` - write one file elsewhere (ends in .html or .htm, not the input)
- `--help` - show usage

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
- Exit: 1 if any file failed, 130 on ctrl-c, which also stops a batch
