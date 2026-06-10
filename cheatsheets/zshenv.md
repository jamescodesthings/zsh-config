# zshenv

> Open the per-machine zsh env file for the current hostname in `micro`.

## Usage

`zshenv`

## Notes

- Opens `$CUSTOM_DIR/env.<hostname>.zsh` where hostname comes from `get-hostname`
- This file is sourced automatically by `load_box_env.zsh` on shell start
- Use it for machine-specific PATH entries, tool config, and env vars like `$PICO8`
- Requires `micro` editor — install via `$CUSTOM_DIR/installers/micro`

## Related commands

- Print the current hostname:
`cheat get-hostname`
