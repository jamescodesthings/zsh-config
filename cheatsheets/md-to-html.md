# md-to-html

> Convert markdown to a styled, self-contained html page next to each input.
> Overwrites existing output. Needs `pandoc` and `file`. Exit 1 if any file failed, 130 on ctrl-c, which also stops a batch.

# Usage

- Convert one file, or several:

`md-to-html notes.md`

`md-to-html *.md`

- Write one file elsewhere (`-o` or `--output`; ends in `.html` or `.htm`, not the input):

`md-to-html notes.md -o ~/Desktop/notes.html`

- Show usage:

`md-to-html --help`

# Related commands

- `cheat md-to-pdf`
