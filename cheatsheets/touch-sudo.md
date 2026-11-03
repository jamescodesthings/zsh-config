# touch-sudo

> Enable Touch ID for `sudo` on macOS. Asks first; errors on Linux.
> Rewrites `/etc/pam.d/sudo` with `pam_tid.so` and `pam_smartcard.so` first in the auth chain; a macOS update may reset it.

# Getting started

- `touch-sudo` - enable
- `cat /etc/pam.d/sudo` - check the result
- Next: run it again after a macOS update resets it

# Environment

- `TOUCH_SUDO_FILE` - PAM file to write (default `/etc/pam.d/sudo`)

# Options

- `--plain` - no colour or animation
- `-q`, `--quiet` - print only warnings and errors
- Exit: 0 done, 1 failed, 2 wrong usage

# See also

- `cheat zsh-config` - everything zsh-config gives you
