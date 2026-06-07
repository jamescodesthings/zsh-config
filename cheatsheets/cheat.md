# cheat

Personal cheatsheet viewer with tldr fallback. Cheatsheets live in `~/.custom/cheatsheets/`.

## Flags

| Flag | Short | Description |
| --- | --- | --- |
| `--help` | `-h` | Show help and format guide |
| `--list` | `-l` | List local cheatsheets |
| `--search <query>` | `-s` | Search local + tldr by name |
| `--edit <name>` | `-e` | Open in $EDITOR |
| `--new <name>` | `-n` | Create new, optionally seeded from tldr |
| `--update` | `-u` | Update tldr page cache |
| `--raw <name>` | `-r` | Print raw markdown |

## Usage

- Show a cheatsheet:

`cheat git`

- Multi-word command — maps to `git-commit.md`:

`cheat git commit`

- Search for pages matching a name:

`cheat -s docker`

- Create new cheatsheet (prompts to seed from tldr if page exists):

`cheat -n my-tool`

- Edit existing cheatsheet:

`cheat -e git`

- Print raw markdown of a local or tldr sheet:

`cheat -r git`

## Cheatsheet format

Standard Markdown, rendered with glow at 120 chars width.

**Supported:** `# headings`, `**bold**`, `*italic*`, `` `code` ``, `- lists`, tables

**Related commands convention:**

```
## Related commands

- Brief description of related tool
`cheat related-name`
```

## Related commands

- Community cheatsheets for thousands of commands
`tldr <command>`
