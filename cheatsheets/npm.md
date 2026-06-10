# npm

> npm aliases and helpers.

## Running

- Start the project:

`npmst`

- Run a script:

`npmr <script>`

## Installing

- Install a dependency (save to dependencies):

`npmS <pkg>`

- Install a dev dependency:

`npmD <pkg>`

- Install exact version (no semver range):

`npmSE <pkg>`

- Install exact dev dependency:

`npmDE <pkg>`

- Install with legacy peer deps:

`npmil`

- Install exact with legacy peer deps:

`npmSEl <pkg>`

- Install exact dev with legacy peer deps:

`npmDEl <pkg>`

- Install globally:

`npmg <pkg>`

- Init new project (skip prompts):

`npmiy`

## Uninstalling

- Uninstall a package:

`npmU <pkg>`

- Uninstall with legacy peer deps:

`npmUl <pkg>`

- Uninstall global package:

`npmUG <pkg>`

## Listing

- List installed packages (local):

`npmL0`

- List installed packages (global):

`npmL0g`

## Updating

- Interactively update outdated packages to latest, one at a time:

`npm-update-latest`

- Interactively check and update packages (uses `npx npm-check`):

`npm-check-update`

`ncu`

## Notes

> `npm-update-latest` runs `npm outdated --json`, prompts `[y/n]` for each outdated package,
> then runs `npm install <pkg>@latest --save` (or `--save-dev` for dev dependencies) for confirmed updates.
> All aliases only defined when `npm` is available.

## Related commands

- Full npm reference:
`tldr npm`
