# pico-8

> PICO-8 zsh helpers. Requires `$PICO8` set to binary path (in per-host env file).

## Usage

- Launch PICO-8 with current directory as cart root (background):

`picoh`

- Launch PICO-8 without a specific cart root:

`pico`

## Environment

- `PICO8` — path to the PICO-8 binary (set in `env.$HOSTNAME.zsh`, e.g. `env.MacBookPro.zsh`)
- Current binary: `$PICO8`

## Notes

> On machines other than `zerocalc`, `picoh` passes `-width 512 -height 512 -window_x 0 -window_y 0`.
> `pico`, `pico-8`, and `pico8` are aliases — all launch the same binary.

## Related commands

- Edit the per-host env file:
`cheat zshconfig`

- PICO-8 language/API reference:
`cheat pico-8-lang`
