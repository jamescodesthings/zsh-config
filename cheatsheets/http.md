# httpie

GET request:
`http <url>`

Download file to disk:
`http --download <url>`

Add custom request header:
`http <url> Header:value`

Basic auth:
`http -a user:pass <url>`

Bearer token auth:
`http -A bearer -a <token> <url>`

POST - string JSON field:
`http POST <url> key=val`

POST - non-string field (number / bool / array):
`http POST <url> key:=val`
