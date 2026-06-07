# fzf

Fuzzy finder for the terminal. Integrated into this shell for history search and file selection.

## Shell key bindings (loaded by load-fzf.zsh)

- Fuzzy search command history:

`Ctrl+R`

- Fuzzy file finder (inserts path at cursor):

`Ctrl+T`

- Fuzzy cd into subdirectory:

`Alt+C`

## Piped usage

- Fuzzy select from a list:

`cat list.txt | fzf`

- Multi-select (Tab to select, Enter to confirm):

`ls | fzf -m`

- Preview file content while selecting:

`fzf --preview 'bat --color=always {}'`

## In scripts

- Select a git branch:

`git branch | fzf | xargs git checkout`

- Kill a process by name:

`ps aux | fzf | awk '{print $2}' | xargs kill`

## Related commands

- Full fzf reference
`tldr fzf`
