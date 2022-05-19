#!/usr/bin/env zsh

# Sets color scheme using zpm-zsh/colors
# cs is c with schemes
declare -Ag cs

# Declares the color shceme
cs[success]="$c[green]"
cs[error]="$c[red]"
cs[warn]="$c[yellow]"
cs[info]="$c[cyan]"
cs[default]="$c[default]"
cs[h1]="$c[bold]"
cs[h2]="$c[dim]$c[bold]"
cs[h3]="$c[dim]"
cs[p]="$c[default]"
cs[flag]="$c[cyan]"
cs[param]="$c[magenta]"
cs[sub]="$c[dim]"
cs[reset]="$c[reset]"
