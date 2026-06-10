# picoh

> Launch PICO-8 in the background with the current directory as the cart root path.

## Usage

- Open PICO-8 with the current directory as root:

`picoh`

## Notes

- Requires `$PICO8` environment variable to be set to the PICO-8 binary path
- On machines other than `zerocalc`, launches with `-width 512 -height 512 -window_x 0 -window_y 0`
- Runs in the background — your terminal stays free

## Environment

- `PICO8` — path to the PICO-8 binary (set in your per-host env file, e.g. `env.hostname.zsh`)

## Related commands

- Open PICO-8 without a specific root path:
`pico`
