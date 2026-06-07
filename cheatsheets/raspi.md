# raspi

> Raspberry Pi / PicoCalc commands and filesystem reference.

# System Commands

- Battery level:

`battery`

- Check if plugged in:

`battery-supply`

- Update all packages:

`aptu`

- System config TUI:

`sudo raspi-config`

- CPU temperature:

`vcgencmd measure_temp`

- Throttling / undervoltage status bitmask:

`vcgencmd get_throttled`

# Kernel & Modules

- Watch kernel messages live:

`dmesg -wH | grep <name>`

- Check if kernel module loaded:

`lsmod | grep <name>`

- Load kernel module:

`sudo modprobe <name>`

# Input

- Test input events:

`evtest`

- Find keyboard device number:

`grep -A4 picocalc /proc/bus/input/devices`

- Watch raw key events:

`evtest /dev/input/event<n>`

# Config Files

- Hardware overlays:

`sudo nano /boot/firmware/config.txt`

- Kernel boot args:

`sudo nano /boot/firmware/cmdline.txt`

# Key Directories

- Your projects:

`~/projects/`

- Custom scripts (battery, reset, btoff, bton):

`/usr/local/bin/`

- Boot config (config.txt, cmdline.txt, overlays/):

`/boot/firmware/`

- Compiled .dtbo device tree overlays:

`/boot/firmware/overlays/`

- PicoCalc sysfs (battery_percent, keyboard_backlight):

`/sys/firmware/picocalc/`

- User app config files:

`~/.config/`

- Custom systemd unit files:

`/etc/systemd/system/`

- Module options and blacklists:

`/etc/modprobe.d/`

- Modules loaded at boot:

`/etc/modules`

- Udev device rules:

`/etc/udev/rules.d/`

- Filesystem mount table:

`/etc/fstab`

# Related commands

- Package management
`tldr apt`

- Service management
`tldr systemctl`
