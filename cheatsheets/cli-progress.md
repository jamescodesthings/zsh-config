# cli progress

> A spinner with `step X/Y`, the title and the current step's label, and the elapsed time at the end.
> Drawn on stderr. Call it in the shell doing the work, never inside `$(...)`.

# Options

- `progress start <title> <total>` - begin a run of total steps
- `progress step <label>` - move to the next step
- `progress done` - stop with the elapsed time
- `progress fail` - stop and show the step it failed at
- `run-quiet <label> <command...>` - run a command into a child log; advances progress when one is active
- plain mode (`CLI_PLAIN`, `NO_COLOR`, or a stderr that is no terminal) - one `step 2/5 label` line per step, no animation

# Examples

- Five steps:

`progress start "update" 5`

- Run one quietly:

`run-quiet "brew" brew update`

- Finish:

`progress done`

# See also

- `cheat cli` - the top sheet
- `cheat log` - read the child logs
- In kitty the tab shows a progress bar after 2 seconds
- A failed `run-quiet` records a `problem` and a `fix`; print them with `problems`
- Exit: 0 done, 1 no run active, 2 bad arguments
