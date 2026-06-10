# install-link

> Create a symlink from a source path to a target path, backing up any existing file.

## Usage

- Symlink `<from>` to `<to>`, backing up any existing file at `<to>`:

`install-link <from> <to>`

## Examples

`install-link ./configs/asdf/.asdfrc ~/.asdfrc`

## Notes

- If `<to>` is an existing symlink: removes it
- If `<to>` is an existing file: moves it to `<to>.bak`
- Creates any missing parent directories
- Used by installer scripts and `install-box-config`

## Related commands

- Install a per-machine config with hostname/OS fallback:
`cheat install-box-config`
