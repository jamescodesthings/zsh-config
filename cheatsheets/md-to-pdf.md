# md-to-pdf

> Convert a markdown file to an A4 pdf next to it.
> Overwrites any existing output without asking.

# Usage

- Convert notes.md to notes.pdf in the same folder:

`md-to-pdf notes.md`

- Convert several files, or a glob, each beside its input:

`md-to-pdf *.md`

# Notes

> Renders html with md-to-html into a fresh temp dir, prints it with weasyprint,
> then strips the producer tags with exiftool and qpdf. The temp dir is always removed.
> Images are resolved relative to the markdown file, not the current folder.
> A notes.html beside the input is never read or changed.
> Rendering the same file twice gives a byte-identical pdf.
> Interrupting it (ctrl-c) cleans up and exits 130 without a success line; in a batch it also stops the files still to come.
> In a batch a file that fails is reported and the rest carry on; the exit status is 1 if any failed.
> Print styles live in the `@media print` block of `~/.custom/configs/md/md.css`.
> Without exiftool or qpdf the pdf is still written, with a warning.
> Errors say what failed, how to fix it, print the tool's own output, and point at
> `~/.custom/functions/md-to-pdf`.

# Related commands

- `cheat md-to-html`
