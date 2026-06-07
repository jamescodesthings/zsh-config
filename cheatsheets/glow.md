# glow

Markdown renderer for the terminal. Used by `cheat` to display cheatsheets.

## Usage

- Render a markdown file:

`glow <file.md>`

- Render at a specific width (120 chars — used by cheat):

`glow -w 120 <file.md>`

- Render from stdin:

`echo "# Hello" | glow -`

- Render with pager:

`glow -p <file.md>`

- Browse markdown files interactively (TUI):

`glow -t <directory>`

## Styles

- Auto-detect dark/light (default):

`glow -s auto <file.md>`

- Force dark or light style:

`glow -s dark <file.md>`

## Related commands

- bat for syntax-highlighted file viewing
`cheat bat`
