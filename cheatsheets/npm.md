# npm

> Aliases and helpers zsh-config adds over npm. Defined only when `npm` is available.

# Run

- `npmst`: `npm start`
- `npmr <script>`: `npm run`

# Install

- `npmS <pkg>`: `npm i -S`
- `npmD <pkg>`: `npm i -D`
- `npmSE <pkg>`: `npm i -E`, exact version
- `npmDE <pkg>`: `npm i -D -E`
- `npmil`: `npm i --legacy-peer-deps`
- `npmSEl <pkg>`: `npm i -E --legacy-peer-deps`
- `npmDEl <pkg>`: `npm i -D -E --legacy-peer-deps`
- `npmg <pkg>`: `npm i -g`
- `npmiy`: `npm init -y`

# Uninstall

- `npmU <pkg>`: `npm uninstall -S -D`
- `npmUl <pkg>`: `npm uninstall -S -D --legacy-peer-deps`
- `npmUG <pkg>`: `npm uninstall -g`

# List

- `npmL0`: local packages, top level
- `npmL0g`: global packages, top level

# Update

- `npm-update-latest`: for each outdated package, ask `[y/n]`, then `npm install <pkg>@latest` with `--save` or `--save-dev`
- `npm-check-update`, `ncu`: `npx npm-check -u -E`

# Related commands

- `tldr npm`
