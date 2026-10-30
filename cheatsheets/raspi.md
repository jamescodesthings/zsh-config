# raspi

> Raspberry Pi and PicoCalc commands and paths.
> `aptu` is a zsh-config alias. `battery` is `upower -d` on uconsole and a script in `/usr/local/bin` on the PicoCalc.

# Getting started

- `battery`: battery level
- `vcgencmd measure_temp`: CPU temperature
- `aptu`: update all packages
- Next: `evtest` if the keyboard misbehaves, `sudo raspi-config` for settings

# System

- `battery-supply`: check if plugged in
- `sudo raspi-config`: system config TUI
- `vcgencmd get_throttled`: throttling and undervoltage bitmask

# Kernel and modules

- `dmesg -wH | grep <name>`: watch kernel messages live
- `lsmod | grep <name>`: check a module is loaded
- `sudo modprobe <name>`: load a module

# Input

- `evtest`: test input events
- `grep -A4 picocalc /proc/bus/input/devices`: find the keyboard device number
- `evtest /dev/input/event<n>`: watch raw key events

# Config files

- `sudo nano /boot/firmware/config.txt`: hardware overlays
- `sudo nano /boot/firmware/cmdline.txt`: kernel boot args

# Directories

- `/usr/local/bin/`: custom scripts (battery, reset, btoff, bton)
- `/boot/firmware/`: boot config; `overlays/` holds compiled .dtbo overlays
- `/sys/firmware/picocalc/`: PicoCalc sysfs (battery_percent, keyboard_backlight)
- `/etc/systemd/system/`, `/etc/modprobe.d/`, `/etc/modules`, `/etc/udev/rules.d/`, `/etc/fstab`: units, module options, boot modules, udev rules, mounts
- `~/projects/`, `~/.config/`: your projects, user app config

# More

- `cheat zerocalc`: the PicoCalc keys
- `tldr apt`, `tldr systemctl`
- `cheat zsh-config`: everything zsh-config gives you
