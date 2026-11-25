# Benchmarks

Two kinds of number here. Measured numbers were timed on one macOS machine and will differ on yours. Estimates are guesses and are labelled as such.

## Measured

Timed with `time`, three runs each, on a warm machine with the cache in place.

| What | Command | Result |
| --- | --- | --- |
| Interactive shell start | `zsh -i -c exit` | 0.20 to 0.22 s total |
| Shell start plus a sheet render | `NO_COLOR=1 zsh -i -c 'cheat help' >/dev/null` | 0.25 to 0.29 s total |

The sheet render adds about 0.05 to 0.07 s on top of the shell start, which is the cost of `cheat-render` reading and drawing one sheet in pure zsh. These runs include the startup of a shell with no terminal, so the prompt's instant prompt is not exercised.

To repeat them:

```sh
for i in 1 2 3; do time zsh -i -c exit; done
```

## Not measured

I did not time `./install` or `update`, because both change the machine. What can be said without a run:

- `update` is dominated by the network and by package managers (brew, asdf, language builds). The zsh-config part, a pull and a few file checks, is small.
- A fresh `./install` on a new machine is dominated by downloads and by compiling language versions through asdf. Estimate: tens of minutes on first install, a few minutes on a re-run. This is a guess.
- A clean `update` with nothing to upgrade is probably one to three minutes, mostly in the package managers. This is a guess.

## Estimated time saved

These are guesses, not measurements. They assume a working day with a few tool lookups, and compare each feature with doing the same thing by hand or by asking an agent to work it out each time.

| Feature | By hand or by agent | With the feature | Guess per use |
| --- | --- | --- | --- |
| New machine setup | A day of installing and remembering settings | `./install`, then `update` | 2 to 4 hours per machine |
| `update` | Running each package manager in turn, a dozen commands | One command | 5 to 10 minutes per run |
| `cheat <tool>` | Searching the web or asking an agent for a flag | One command, a screen of rows | 30 seconds to 2 minutes per lookup |
| `j <name>` | Typing or tab-completing a long path | One short word | 5 to 15 seconds per jump |
| `ctrl+r` and `hist` | Retyping a long command from memory | Fuzzy search | 20 to 60 seconds per use |
| `md-to-pdf -r --combine` | Converting and joining files by hand | One command | 5 to 15 minutes per folder |
| `key` and `wipcrypt` | Hand-copying keys and encrypting files | One command each | 5 minutes per rotation |
| Colour lint and changes reminder | Finding style drift and forgotten changelog rows in review | A warning at commit time | 5 to 10 minutes per catch |

## Cost of asking an agent each time

An agent can answer "what is the flag for this" or "write me a script to update everything". Each answer costs a prompt, a wait of tens of seconds, and tokens, and the result varies from run to run. A local sheet or an `update` script costs nothing per use after it is written, and gives the same answer every time. The saving is mostly idle time and consistency, not money. Treat all the figures above as rough.
