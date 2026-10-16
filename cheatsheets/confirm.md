# confirm

> Ask y/n. Exit 0 on `y` or `Y`, 1 on anything else.

# Usage

- Ask with the default message:

`confirm`

- Ask with your own message:

`confirm "Delete this?"`

- Guard a command:

`if confirm "Continue?"; then rm -rf /tmp/myapp; fi`
