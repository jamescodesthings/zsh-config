# start-workstation

> Trigger a GitHub Actions workflow to start a cloud workstation.

## Usage

- Start the workstation:

`start-workstation`

## What it does

1. Verifies `gh` CLI is authenticated
2. Creates `$PROJECT_DIR` if it doesn't exist
3. Clones `$ORG/$GH_REPO` into `$PROJECT_DIR` if not already cloned
4. Runs `gh workflow run "$WORKFLOW_ID" -f name=$USER_NAME`

## Environment

- `ORG` — GitHub org (default: `7digital`)
- `PROJECT_DIR` — local clone directory (default: `~/projects/$ORG`)
- `USER_NAME` — workstation name passed to workflow (default: `jamesm`)
- `GH_REPO` — repository containing the workflow (default: `developer-cloud-workstation`)
- `WORKFLOW_ID` — workflow name to trigger (default: `Start Workstation`)

## Related commands

- Authenticate GitHub CLI:
`gh auth login`
