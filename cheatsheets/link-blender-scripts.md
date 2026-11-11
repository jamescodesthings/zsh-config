# link-blender-scripts

> Link every file under a scripts folder into each Blender version's `scripts` folder.
> Prints `linked N, already linked N, backed up N`. Exit 0 when done or Blender is absent; 1 on a failed link; 2 on bad usage.

# Getting started

- `link-blender-scripts <folder>` - link e.g. `<repo>/configs/blender/scripts`
- Next: `update blender` links a version folder made later

# Edge cases

- Only version folders named like `4.5` are used; `config` and the rest are skipped
- A file or link already there moves to `<name>.bak`, then `.bak.1`, `.bak.2`
- A link that already points at the source file is left alone
- Settings folder missing: skips, exit 0

# Options

- `--plain` - no colour or animation
- `-q`, `--quiet` - print only warnings and errors
- Exit: 0 done, 1 failed, 2 wrong usage

# Variables

- `BLENDER_USER_DIR` - settings root; default `~/Library/Application Support/Blender` on macOS, `~/.config/blender` on Linux

# See also

- `cheat link-cheatsheets` - the same idea for cheat sheets
- `cheat zsh-config` - everything zsh-config gives you
