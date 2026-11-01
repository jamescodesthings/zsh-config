# raspi

> Raspberry Pi and PicoCalc commands and paths.
> `aptu` is a zsh-config alias. `battery` is `upower -d` on uconsole and a script in `/usr/local/bin` on the PicoCalc.

# Getting started

- `battery` / `battery-supply` - battery level, check if plugged in
- `vcgencmd measure_temp` / `vcgencmd get_throttled` - CPU temperature, throttling and undervoltage bitmask
- `aptu` - update all packages
- `sudo raspi-config` - system config TUI

# Kernel, input and files

- `dmesg -wH | grep <name>` - watch kernel messages live
- `lsmod | grep <name>` - check a module is loaded
- `sudo modprobe <name>` - load a module
- `grep -A4 picocalc /proc/bus/input/devices` - find the keyboard device number
- `evtest [/dev/input/event<n>]` - test input events, or watch one device's raw key events
- `sudo nano /boot/firmware/config.txt` - hardware overlays; `cmdline.txt` beside it is kernel boot args
- `/usr/local/bin/` - custom scripts (battery, reset, btoff, bton)
- `/boot/firmware/` - boot config; `overlays/` holds compiled .dtbo overlays
- `/sys/firmware/picocalc/` - PicoCalc sysfs (battery_percent, keyboard_backlight)
- `/etc/systemd/system/`, `/etc/modprobe.d/`, `/etc/modules`, `/etc/udev/rules.d/`, `/etc/fstab` - units, module options, boot modules, udev rules, mounts
- `~/projects/`, `~/.config/` - your projects, user app config

# See also

- `cheat zerocalc` - the PicoCalc keys
- `tldr apt`, `tldr systemctl`
- `cheat zsh-config` - everything zsh-config gives you
