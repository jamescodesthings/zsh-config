# fzf

> Fuzzy finder. Key bindings come from `load-fzf.zsh` in interactive shells.

# Getting started

- `ctrl+r`: search command history
- `ctrl+t`: pick files or directories, insert the paths at the cursor
- `alt+c`: pick a subdirectory and cd into it

- Next: pipe any list into `fzf`.

# Pipe

- `fzf`: filter lines from stdin, prints the pick
- `ls | fzf -m`: multi-select, tab marks, enter confirms
- `fzf --preview 'bat --color=always {}'`: preview the file under the cursor
- Check out a branch:

`git branch | fzf | xargs git checkout`

# More

- `tldr fzf`: all the options
- `cheat bat`: the previewer
- `cheat zsh-config`: everything zsh-config gives you
