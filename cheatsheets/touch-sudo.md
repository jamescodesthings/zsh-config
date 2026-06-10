# touch-sudo

> Enable Touch ID authentication for `sudo` on macOS.

# Usage

- Enable Touch ID for sudo:

`touch-sudo`

# Notes

> macOS only — errors on Linux.
> Modifies `/etc/pam.d/sudo` (configurable via `$TOUCH_SUDO_FILE`).
> Adds `pam_tid.so` (Touch ID) and `pam_smartcard.so` to the auth chain.
> Changes take effect immediately — no reboot required.
> After a macOS update, PAM config may be reset and this will need to be re-run.

# Environment

> `TOUCH_SUDO_FILE` — PAM config file path (default: `/etc/pam.d/sudo`)

# Related commands

- Verify the change took effect:
`cat /etc/pam.d/sudo`
