# deps

> Dependency checker used internally by zsh functions. Verifies required commands are available before a function runs.

## Usage (inside a function)

```zsh
function myfn() {
  local DEPS=(git gh jq)
  if ! deps "${DEPS[@]}"; then
    return 1
  fi
  # ... rest of function
}
```

## Notes

- Checks each item in the array with `is available <cmd>`
- Prints a `$c[error]` message for each missing dependency
- If any are missing, prints install hints from the hint lookup table and returns 1
- Hint lookup table lives in `functions/deps` — add entries for common tools there
- Not intended to be called by users directly

## Hint table (in `functions/deps`)

Currently has install hints for: `asdf`, `eza`, `gh`, `http`, `python`

## Related commands

- Check if a command is available:
`cheat is`
