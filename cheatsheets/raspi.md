# raspi

Raspberry Pi / PicoCalc commands and filesystem reference.

## System Commands

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

## Kernel & Modules

- Watch kernel messages live:

`dmesg -wH | grep <name>`

- Check if kernel module loaded:

`lsmod | grep <name>`

- Load kernel module:

`sudo modprobe <name>`

## Input

- Test input events:

`evtest`

- Find keyboard device number:

`grep -A4 picocalc /proc/bus/input/devices`

- Watch raw key events:

`evtest /dev/input/event<n>`

## Config Files

- Hardware overlays:

`sudo nano /boot/firmware/config.txt`

- Kernel boot args:

`sudo nano /boot/firmware/cmdline.txt`

## Key Directories

| Path | Contents |
| --- | --- |
| `~/projects/` | Your projects |
| `/usr/local/bin/` | Custom scripts (battery, reset, btoff, bton) |
| `/boot/firmware/` | Boot config (config.txt, cmdline.txt, overlays/) |
| `/boot/firmware/overlays/` | Compiled .dtbo device tree overlays |
| `/sys/firmware/picocalc/` | PicoCalc sysfs (battery_percent, keyboard_backlight) |
| `~/.config/` | User app config files |
| `/etc/systemd/system/` | Custom systemd unit files |
| `/etc/modprobe.d/` | Module options and blacklists |
| `/etc/modules` | Modules loaded at boot |
| `/etc/udev/rules.d/` | Udev device rules |
| `/etc/fstab` | Filesystem mount table |

## Related commands

- Package management
`tldr apt`

- Service management
`tldr systemctl`
