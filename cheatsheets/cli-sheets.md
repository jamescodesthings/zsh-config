# cli sheets

> How a sheet is written so `cheat-render` lays it out: a subset of markdown, one construct per line.
> Check it with `cheatsheet-test --strict <sheet>`.

# Lines

- `# heading` - a section
- `> text` - prose under the title
- `- text` - a prose item
- A backtick line - an example, alone on its line, ending in a backtick

# Rows

- A row is `- ` then the command in backticks, ` - `, then the explanation
- Flags go in brackets: `[-v|--verbose]`; targets in `[target]` or `<target>`
- The second column is aligned by the renderer: as wide as the longest command, capped at 40
- A command longer than 40 drops its explanation to the next line
- Never pad by hand

# Spans

- `[text]{.warn .bold}` - classes are roles, hues, `hue-NN` or `bold`, combined in order
- Inline code goes in single backticks

# Order

- `# Getting started` first, `# See also` last, exactly
- `# Variables`, when present, just before the last section

# See also

- `cheat cheat format` - the shared structure
- `cheat cli col` - the colours
- `cheat cheatsheet-test` - the checks
