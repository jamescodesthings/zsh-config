# http

> HTTPie, a curl replacement. `http` and `https` are aliased with `--verify=no`, so TLS certificates are not checked.

# Getting started

- `http <url>` - GET a URL
- `http POST <url> key=value` - POST a string field
- `http <url> Header:value` - add a header

- Next: `key:=value` posts numbers, bools and arrays.

# Requests

- `http POST <url> key:=value` - POST a non-string field
- `http --download <url>` - download to disk
- `http -a user:pass <url>` - basic auth
- `http -A bearer -a <token> <url>` - bearer token

# See also

- `tldr httpie` - all the options
- `tldr curl` - the thing it replaces
- `cheat zsh-config` - everything zsh-config gives you
