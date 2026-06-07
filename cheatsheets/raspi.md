# raspi

## commands

Battery level:
`battery`

Plugged In:
`battery-supply`

Update all packages:
`aptu`

System config TUI:
`sudo raspi-config`

Hardware overlays:
`sudo nano /boot/firmware/config.txt`

Kernel boot args:
`sudo nano /boot/firmware/cmdline.txt`

CPU temperature:
`vcgencmd measure_temp`

Throttling / Undervoltage Status Bitmask:
`vcgencmd get_throttled`

Watch kernel messages live:
`dmesg -wH | grep <name>`

Check if kernel module is loaded:
`lsmod | grep <name>`

Load kernel module:
`sudo modprobe <name>`

Test input events:
`evtest`

Find keyboard device number:
`grep -A4 picocalc /proc/bus/input/devices`

Watch raw key events:
`evtest /dev/input/event<n>`

## directories

Your projects directory:
`~/projects/`

Custom scripts: battery, reset, btoff, bton, supply:
`/usr/local/bin/`

Boot config: config.txt, cmdline.txt, overlays/:
`/boot/firmware/`

Compiled .dtbo device tree overlays:
`/boot/firmware/overlays/`

Picocalc sysfs: battery_percent, keyboard_backlight, screen_backlight:
`/sys/firmware/picocalc/`

User app config files:
`~/.config/`

Custom systemd unit files (.service):
`/etc/systemd/system/`

Module options and blacklists:
`/etc/modprobe.d/`

Modules loaded at boot:
`/etc/modules`

Udev device rules:
`/etc/udev/rules.d/`

Machine hostname:
`/etc/hostname`

Static hostname / IP mappings:
`/etc/hosts`

Package source lists:
`/etc/apt/sources.list.d/`

Filesystem mount table:
`/etc/fstab`