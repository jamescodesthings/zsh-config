# touch-sudo

> Enable Touch ID for `sudo` on macOS. Asks first; errors on Linux.
> Rewrites `/etc/pam.d/sudo` with `pam_tid.so` and `pam_smartcard.so` first in the auth chain; a macOS update may reset it.

# Usage

- Enable:

`touch-sudo`

- Check the result:

`cat /etc/pam.d/sudo`

# Environment

- `TOUCH_SUDO_FILE`: PAM file to write (default `/etc/pam.d/sudo`)
