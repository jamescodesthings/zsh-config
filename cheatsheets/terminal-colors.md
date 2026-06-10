# terminal-colors

> Test and reference functions for the terminal color system used across zsh-config.

## Test functions

- Test 24-bit (truecolor) support with a color gradient:

`test-color-24bit`

- Show all named colors from the `$c[...]` system with their names:

`test-color-names`

- Show color codes from the `zpm-zsh-colors` palette:

`test-color-codes`

## Color system (`$c[...]`)

Colors are loaded by `zpm-zsh-colors` into the `$c` associative array.

**Semantic colors used in zsh-config output:**

| Name | Use |
|---|---|
| `$c[h1]` | Primary heading |
| `$c[h2]` | Section heading |
| `$c[h3]` | Sub-heading |
| `$c[lead]` | Lead/description text |
| `$c[info]` | Informational highlight |
| `$c[success]` | Success message |
| `$c[warn]` | Warning |
| `$c[error]` | Error |
| `$c[flag]` | CLI flag names |
| `$c[param]` | Parameter/argument names |
| `$c[sub]` | Secondary/muted text |
| `$c[em]` | Emphasis |
| `$c[reset]` | Reset to default |

## Usage in functions

```zsh
echo "${c[h1]}my-function${c[reset]}"
echo "${c[error]}error:${c[reset]} something went wrong"
echo "${c[success]}success:${c[reset]} done"
```

## Notes

- Raw ANSI codes should never be used — always use `$c[...]` for consistency
- Colors are loaded before functions in `.zshrc` (step 4 in load order)

## Related commands

- Dependency checker for functions:
`cheat deps`
