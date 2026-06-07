# http

HTTPie — curl replacement with a human-friendly syntax.

## Requests

- GET request:

`http <url>`

- Download file to disk:

`http --download <url>`

- Add custom request header:

`http <url> Header:value`

## Auth

- Basic auth:

`http -a user:pass <url>`

- Bearer token auth:

`http -A bearer -a <token> <url>`

## POST

- String JSON field:

`http POST <url> key=value`

- Non-string field (number, bool, array):

`http POST <url> key:=value`

## Related commands

- Full httpie reference
`tldr httpie`

- curl reference
`tldr curl`
