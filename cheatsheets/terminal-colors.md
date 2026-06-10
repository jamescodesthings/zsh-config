# terminal-colors

> Test and reference functions for the terminal color system used across zsh-config.

# Test functions

- Test 24-bit (truecolor) support with a color gradient:

`test-color-24bit`

- Show all named colors from the $c[...] system with their names:

`test-color-names`

- Show color codes from the zpm-zsh-colors palette:

`test-color-codes`

# Color system

> Colors loaded by `zpm-zsh-colors` into the `$c` associative array.
> Semantic keys: `h1`, `h2`, `h3` (headings), `lead` (description), `info`, `success`, `warn`, `error`.
> More keys: `flag` (CLI flags), `param` (argument names), `sub` (secondary text), `em`, `reset`.

# Usage

- Show a primary heading in a function:

`echo "${c[h1]}my-function${c[reset]}"`

- Show an error message:

`echo "${c[error]}error:${c[reset]} something went wrong"`

- Show a success message:

`echo "${c[success]}success:${c[reset]} done"`

# Notes

> Always use `$c[...]` for output — never raw ANSI codes.
> Colors are loaded before functions in `.zshrc` (step 4 in load order).

# Related commands

- Dependency checker for functions:
`cheat deps`
