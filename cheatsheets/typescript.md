# typescript

> TypeScript and JavaScript with ESLint, Prettier and tsc, run through npm scripts.

# Getting started

- `npm install` - install dependencies
- `npm test` - run the test script
- `npx tsc --noEmit` - type check without writing output

# Format and lint

- `npx prettier --write [paths]` - format files
- `npx eslint [paths]` - lint files
- `npx eslint --fix [paths]` - lint and autofix

# Debug

- `node --inspect-brk [file]` - wait for a debugger on port 9229
- `package.json run gutter` - run or debug a script from the gutter in WebStorm or IntelliJ IDEA

# Notes

- Prettier reads `.prettierrc` and ESLint reads `eslint.config.js` from the project root

# See also

- `cheat bazel` - build and test around the code
- `cheat idea` - IntelliJ setup and keys
- `cheat debugging` - debugging across languages
