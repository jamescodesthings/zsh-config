# md-to-pdf

> Convert markdown to an A4 pdf next to each input, or every .md under a folder, optionally joined into one pdf.
> Overwrites each single pdf. Needs pandoc, file and weasyprint; --combine needs qpdf, pdfunite or macOS's join script.

# Options

- `[-r|--recursive] [dir]` - every .md under dir; skips hidden folders such as .git, and node_modules
- `--combine` - also join the pdfs, in order, into `<this folder's name>.pdf` in this folder
- `[-f|--force]` - replace that combined pdf when it exists
- `--plain` - no colour or animation
- `[-q|--quiet]` - print only warnings and errors

# Examples

- `md-to-pdf notes.md` - convert one file
- `md-to-pdf *.md` - convert several
- `md-to-pdf -r docs` - every .md under docs
- `md-to-pdf -r . --combine` - everything here, joined into one pdf named after this folder

# Notes

- Order with -r: path order, except a folder's README.md or index.md comes first in it; files given by name keep their order
- The single pdfs stay beside their sources after combining
- An existing combined pdf stops the run before anything converts; a source whose own pdf would be that file is a usage error (exit 2)
- A failed conversion skips the combine; nothing is joined from a partial set
- Exit: 0 done, 1 failed, 2 wrong usage

# See also

- `cheat md-to-html` - the html step
- `cheat functions files` - the other file tools
- `cheat zsh-config` - everything zsh-config gives you
