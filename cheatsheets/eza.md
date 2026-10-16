# eza

> ls replacement. `ls` is aliased to `eza --group-directories-first` when eza is installed.

# Options

- `-l`: long format
- `-a`: include hidden files
- `-h`: human-readable sizes (long format)
- `--git`: git status column (with `-l`)
- `--icons`: file icons
- `--sort=modified`: sort by modified time
- `--sort=size`: sort by size
- `--tree`: tree view
- `--level=<n>`: limit the tree depth

# Usage

- Long list with hidden files:

`eza -la`

- Tree two levels deep, long format:

`eza --tree --level=2 -l`

# Related commands

- `tldr eza`
