# npm

> Aliases and helpers zsh-config adds over npm. Defined only when `npm` is available.

# Getting started

- `npmiy`: `npm init -y`
- `npmS <pkg>`, `npmD <pkg>`: `npm i -S`, `npm i -D`
- `npmr <script>`: `npm run`

- Next: `npmst` is `npm start`.

# Install

- `npmSE <pkg>`, `npmDE <pkg>`: exact version, `-E`, as dependency or dev dependency
- `npmil`: `npm i --legacy-peer-deps`
- `npmSEl <pkg>`, `npmDEl <pkg>`: exact version with `--legacy-peer-deps`
- `npmg <pkg>`: `npm i -g`

# Uninstall and list

- `npmU <pkg>`: `npm uninstall -S -D`
- `npmUl <pkg>`: the same with `--legacy-peer-deps`
- `npmUG <pkg>`: `npm uninstall -g`
- `npmL0`, `npmL0g`: top level packages, local or global

# Update

- `npm-update-latest`: for each outdated package, ask `[y/n]`, then install `@latest`
- `npm-check-update`, `ncu`: `npx npm-check -u -E`

# More

- `tldr npm`: npm itself
- `cheat zsh-config`: everything zsh-config gives you
