# md-to-html

> Convert a markdown file to a styled, self-contained html page next to it.
> Overwrites any existing output without asking.

# Usage

- Convert notes.md to notes.html in the same folder:

`md-to-html notes.md`

- Write somewhere else:

`md-to-html notes.md ~/Desktop/notes.html`

The second argument must end in `.html` or `.htm`, and can't be the input file itself.

# Notes

> Uses pandoc with GitHub markdown plus task lists, pipe tables and strikethrough.
> The stylesheet is `~/.custom/configs/md/md.css`, embedded into the page.
> The page title is the filename. Needs `pandoc` and `file`.
> Images are resolved relative to the markdown file, not the current folder.
> A pandoc warning (a missing image, say) is printed to stderr even on success.
> Pandoc older than 2.19 falls back to `--self-contained` automatically.
> Errors say what failed, how to fix it, and point at `~/.custom/functions/md-to-html`.

# Related commands

- `cheat md-to-pdf`
