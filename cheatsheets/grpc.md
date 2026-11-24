# grpc

> gRPC from the terminal: which generic client to reach for, and where the proto checks live.

# Getting started

- `grpc [host:port]` - grpcmd: list every service and method over reflection
- `grpcurl -plaintext [host:port] list` - the plain client the others build on
- `buf curl --protocol grpc -d '{}' [url]` - call a method with buf

# Clients

- `grpc [host:port] [Method] {}` - grpcmd: reflection, short names, a request template
- `grpcurl -plaintext [host:port] describe [service]` - grpcurl: show a service or message
- `buf curl` - call over the Connect, gRPC or gRPC-Web protocol
- `grpcui -plaintext [host:port]` - a browser UI for the same calls

# Protos

- `buf lint` - check a proto against the lint rules
- `buf breaking --against '.git#branch=main'` - check a proto change before merging

# See also

- `tldr grpcurl` - the plain client
- `cheat grpcmd` - the grpc command
- `cheat protobuf` - the proto3 language and protoc
- `cheat buf` - lint, format and codegen
