# http

> HTTPie, a curl replacement. `http` and `https` are aliased with `--verify=no`, so TLS certificates are not checked.

# Usage

- GET a URL:

`http <url>`

- Download to disk:

`http --download <url>`

- Add a header:

`http <url> Header:value`

- Basic auth:

`http -a user:pass <url>`

- Bearer token:

`http -A bearer -a <token> <url>`

- POST a string field:

`http POST <url> key=value`

- POST a non-string field (number, bool, array):

`http POST <url> key:=value`

# Related commands

- `tldr httpie`
- `tldr curl`
