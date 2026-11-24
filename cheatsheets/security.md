# security

> Dependencies, vulnerability scans and secrets; no secret value ever goes in a repo, a log or a chat.

# Getting started

- `npm audit` - check a Node project's dependencies
- `gh pr list --author app/dependabot` - open Dependabot PRs in a repo

# Dependency updates

- `.github/dependabot.yml` - Dependabot config; set `schedule.interval` and `ignore` entries
- `renovate.json` - Renovate config; `ignoreDeps` skips a package, and `schedule` batches updates
- Review update PRs on a fixed day so they do not pile up

# Vulnerability scanning

- `snyk test` - scan a project's dependencies
- `pip-audit` - scan a Python environment
- `cargo audit` - scan a Rust project's lockfile

# Secrets

- `git secrets --scan` - look for credentials before committing
- Keep a secret in a secret manager or a password manager, not in the repo
- Never commit a key, token or `.env`; add `.env` to `.gitignore`
- Rotate a secret as soon as it has leaked, then clean the history

# See also

- `cheat git` - commit and push flow
- `cheat review` - pull requests
- `cheat topics` - all work topics
