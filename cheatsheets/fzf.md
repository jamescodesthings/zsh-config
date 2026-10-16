# fzf

> Fuzzy finder. Key bindings come from `load-fzf.zsh` in interactive shells.

# Key bindings

- `Ctrl+R`: search command history
- `Ctrl+T`: pick files or directories, insert the paths at the cursor
- `Alt+C`: pick a subdirectory and cd into it

# Usage

- Select from a list:

`cat list.txt | fzf`

- Multi-select (Tab marks, Enter confirms):

`ls | fzf -m`

- Preview the file under the cursor:

`fzf --preview 'bat --color=always {}'`

- Check out a branch:

`git branch | fzf | xargs git checkout`

# Related commands

- `tldr fzf`
