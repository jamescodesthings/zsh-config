# npm-update-latest

> Interactively update all outdated npm packages to `@latest`, one at a time with confirmation.

## Usage

- Check for outdated packages and prompt to update each one:

`npm-update-latest`

## Notes

- Runs `npm outdated --json` to find outdated packages
- Prompts `[y/n]` before each `npm install <pkg>@latest --save`
- Skips packages where you answer `n`
- Run from the project root (requires `package.json`)

## Related commands

- Check current package versions:
`npm list --depth=0`
