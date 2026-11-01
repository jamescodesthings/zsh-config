# config

> Read and change a zsh-config tool's settings, kept as JSON in `~/.custom/config/<tool>.json`.
> Needs jq. Each tool ships a schema of its settings, defaults and meanings.

# Getting started

- `config <tool>` - pick a setting with fzf and type a new value
- `config <tool> list` - every setting, its value and meaning
- `config <tool> set <key> <value>` - change one

# Use

- `config <tool> get <key>` - the value, or the default when unset
- `config <tool> unset <key>` - back to the default
- `config <tool> edit` - open the JSON file in `$EDITOR`
- `config <tool> list` - unset settings show `(default)`; no fzf or plain mode: `config <tool>` lists too

# For tool authors

- `config --schema <file> <tool> ...` - pass the schema on each call
- `<config dir>/<tool>.schema.json` - or link the schema there once
- `{"key": {"default": 1, "meaning": "one line"}}` - the schema shape
- `set` turns `true`/`false` and numbers into JSON ones; other values stay strings

# Environment

- `CLI_CONFIG_DIR` - config folder (default `~/.custom/config`)
- `EDITOR` - used by `edit`

# See also

- `cheat cli` - the helper library
- `cheat zsh-config` - everything zsh-config gives you
