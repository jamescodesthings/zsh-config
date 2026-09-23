# md-to-html

> Convert a markdown file to a styled, self-contained html page next to it.
> Overwrites any existing output without asking.

# Usage

- Convert notes.md to notes.html in the same folder:

`md-to-html notes.md`

- Convert several files, or a glob, each beside its input:

`md-to-html *.md`

- Write one file somewhere else (`-o` must end in `.html` or `.htm` and can't be the input):

`md-to-html notes.md -o ~/Desktop/notes.html`

# Notes

> Uses pandoc with GitHub markdown plus task lists, pipe tables and strikethrough.
> The stylesheet is `~/.custom/configs/md/md.css`, embedded into the page.
> The page title is the filename. Needs `pandoc` and `file`.
> Images are resolved relative to the markdown file, not the current folder.
> A pandoc warning (a missing image, say) is printed to stderr even on success.
> Pandoc older than 2.19 falls back to `--self-contained` automatically.
> In a batch a file that fails is reported and the rest carry on; the exit status is 1 if any failed, and ctrl-c stops the batch.
> Errors say what failed, how to fix it, and point at `~/.custom/functions/md-to-html`.

# Related commands

- `cheat md-to-pdf`
