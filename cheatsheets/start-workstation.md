# start-workstation

> Run the GitHub Actions workflow that starts the cloud workstation.
> Needs `gh` logged in (`gh auth login`). Clones `$GH_REPO` into `$PROJECT_DIR` if missing.

# Getting started

- `start-workstation` - start it
- Next: set the variables below to point it at another org or workstation

# Environment

- `ORG` - GitHub org (default `7digital`)
- `PROJECT_DIR` - clone folder (default `~/projects/$ORG`)
- `USER_NAME` - workstation name passed to the workflow (default `jamesm`)
- `GH_REPO` - repo holding the workflow (default `developer-cloud-workstation`)
- `WORKFLOW_ID` - workflow name (default `Start Workstation`)

# See also

- `cheat zsh-config` - everything zsh-config gives you
