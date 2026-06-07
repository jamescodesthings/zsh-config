# eza

> Modern replacement for ls with colour, icons, and git status. Used as ls alias in this config.

# Basic listing

- List files (aliased as ls):

`eza`

- Long format with permissions, size, date:

`eza -l`

- Include hidden files:

`eza -a`

- Long format including hidden:

`eza -la`

# Display options

- Show file sizes in human-readable format:

`eza -lh`

- Show git status column:

`eza -l --git`

- Show file icons:

`eza --icons`

- Sort by modified time (newest first):

`eza -l --sort=modified`

- Sort by size:

`eza -l --sort=size`

# Tree view

- Tree view of current directory:

`eza --tree`

- Tree limited to depth N:

`eza --tree --level=<n>`

- Tree with long format:

`eza --tree -l`

# Related commands

- Full eza reference
`tldr eza`
