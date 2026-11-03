# install

> Run every installer in `installers/` in name order, live. A failed installer does not stop the run.
> Prints a problems block at the end and exits 1 when any failed.

# Getting started

- `./install` - run all installers
- `./installers/<name>` - run one alone, e.g. `./installers/fonts`
- Next: `update` keeps the machine current afterwards

# Options

- `[-q|--quiet]` - hide ok and info lines, keep warnings and failures
- `[-v|--verbose]` - more detail from the installers
- `--plain` - no colour or animation, icons stay
- `--help` - show this sheet

# Examples

`./install --plain`

# See also

- `cheat update`
- `cheat zsh-config` - everything zsh-config gives you
