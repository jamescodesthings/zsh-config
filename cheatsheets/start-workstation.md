# start-workstation

> Trigger a GitHub Actions workflow to start a cloud workstation.

# Usage

- Start the workstation:

`start-workstation`

# What it does

> Authenticates `gh` CLI, creates `$PROJECT_DIR` if needed, clones `$GH_REPO` if not already cloned.
> Runs: `gh workflow run "$WORKFLOW_ID" -f name=$USER_NAME`

# Environment

> `ORG` — GitHub org (default: `7digital`)
> `PROJECT_DIR` — local clone directory (default: `~/projects/$ORG`)
> `USER_NAME` — workstation name passed to workflow (default: `jamesm`)
> `GH_REPO` — repository containing the workflow (default: `developer-cloud-workstation`)
> `WORKFLOW_ID` — workflow name to trigger (default: `Start Workstation`)

# Related commands

- Authenticate GitHub CLI:
`gh auth login`
