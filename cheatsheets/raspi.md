# raspi

> Raspberry Pi and PicoCalc commands and paths.
> `aptu` is a zsh-config alias. `battery` is `upower -d` on uconsole and a script in `/usr/local/bin` on the PicoCalc.

# System

- battery level:

`battery`

- check if plugged in:

`battery-supply`

- update all packages:

`aptu`

- system config TUI:

`sudo raspi-config`

- CPU temperature:

`vcgencmd measure_temp`

- throttling and undervoltage bitmask:

`vcgencmd get_throttled`

# Kernel and modules

- watch kernel messages live:

`dmesg -wH | grep <name>`

- check a module is loaded:

`lsmod | grep <name>`

- load a module:

`sudo modprobe <name>`

# Input

- test input events:

`evtest`

- find the keyboard device number:

`grep -A4 picocalc /proc/bus/input/devices`

- watch raw key events:

`evtest /dev/input/event<n>`

# Config files

- hardware overlays:

`sudo nano /boot/firmware/config.txt`

- kernel boot args:

`sudo nano /boot/firmware/cmdline.txt`

# Directories

- `~/projects/`: your projects
- `/usr/local/bin/`: custom scripts (battery, reset, btoff, bton)
- `/boot/firmware/`: boot config (config.txt, cmdline.txt, overlays/)
- `/boot/firmware/overlays/`: compiled .dtbo device tree overlays
- `/sys/firmware/picocalc/`: PicoCalc sysfs (battery_percent, keyboard_backlight)
- `~/.config/`: user app config
- `/etc/systemd/system/`: custom systemd units
- `/etc/modprobe.d/`: module options and blacklists
- `/etc/modules`: modules loaded at boot
- `/etc/udev/rules.d/`: udev device rules
- `/etc/fstab`: filesystem mount table

# Related commands

- `tldr apt`
- `tldr systemctl`
- `cheat zerocalc`
