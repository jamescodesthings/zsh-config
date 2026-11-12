# j alias

> Fixed bookmarks to folders, kept in `~/.config/zsh-config/j-aliases`; `j [name]` jumps to one.
> A lone word that names an alias wins over z's matching; two or more words always go to z.

# Usage

- `j alias add [name] [path]` - save `path` (default here) as `name`, overwriting one of that name
- `j alias show [name]` - print the folder an alias points at
- `j alias rename [old] [new]` - give an alias a new name
- `j alias rm [name]` - remove an alias
- `j alias list [--json]` - list every alias; a missing folder is marked

# Examples

- `j alias add tutorial .` - bookmark this folder as tutorial
- `j tutorial` - jump to it
- `j alias rm tutorial` - forget it

# Notes

- A name has no spaces or slashes, does not start with `-` and is not a j command such as `list`
- `show` and `rm` with no name open a picker; with no terminal they exit 2
- An alias whose folder is gone does not fall back to z: `j [name]` fails and names `j alias add` and `j alias rm` as fixes
- `XDG_CONFIG_HOME` moves the store

# See also

- `cheat j` - the top sheet
- `cheat functions everyday` - the everyday functions
