# compress-pdf-all

> Runs `compress-pdf` on every PDF in this folder that has no copy in `compressed/` yet; with -r, in every folder below too.
> A failed file is listed at the end and the rest carry on.

# Options

- `[-r|--recursive] [dir]` - also every folder below this one, or below dir; each gets its own `compressed/`
- `[-h|--help]` - show this sheet
- `[--plain]` - no colour

# Examples

- `compress-pdf-all` - compress this folder
- `compress-pdf-all -r` - this folder and every folder below it
- `compress-pdf-all -r scans` - every folder under scans

# Notes

- -r skips hidden folders such as .git, node_modules, and never goes into a `compressed/` folder

# See also

- `cheat compress-pdf` - one file
- `cheat compress-jpg-all` - the same for JPEGs
