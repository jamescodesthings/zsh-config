# confirm

> Interactive yes/no prompt. Returns 0 if confirmed, 1 if denied.

# Usage

- Prompt with default message:

`confirm`

- Prompt with custom message:

`confirm "Are you sure you want to delete this?"`

# In scripts

- Use as a guard:

`if confirm "Delete all temp files?"; then rm -rf /tmp/myapp; fi`

- Use with negation:

`if ! confirm "Continue?"; then echo "Aborted."; return 1; fi`
