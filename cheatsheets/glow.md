# glow

> Markdown renderer. `cheat` renders sheets with `glow -w 120`.

# Options

- `-w <n>`: wrap width
- `-p`: use a pager
- `-s <style>`: `auto` (default), `dark`, `light`
- `-t`: TUI file browser for a directory

# Usage

- Render a file:

`glow <file.md>`

- Render at the width cheat uses:

`glow -w 120 <file.md>`

- Render from stdin:

`echo "# Hello" | glow -`

- Browse a directory:

`glow -t <directory>`

# Related commands

- `cheat bat`
