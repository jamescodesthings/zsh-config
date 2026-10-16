# terminal-colors

> Colour test functions and the `$c[...]` array from `zpm-zsh-colors`, loaded before the functions in `.zshrc`.

# Test functions

- `test-color-24bit`: 24-bit gradient
- `test-color-names`: named colours
- `test-color-codes`: colour codes

# Keys

- Headings: `h1`, `h2`, `h3`
- Text: `lead`, `info`, `info-small`, `flag`, `param`
- Status: `success`, `warn`, `error`
- `reset`: back to normal

# Usage

- Heading:

`echo "${c[h1]}my-function${c[reset]}"`

- Error:

`echo "${c[error]}error:${c[reset]} something went wrong"`

- Success:

`echo "${c[success]}success:${c[reset]} done"`

# Related commands

- `cheat deps`
