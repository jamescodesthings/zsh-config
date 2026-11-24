# buf

> buf for Protobuf; `[dir]` defaults to `.`. Install with `brew install bufbuild/buf/buf`.

# Getting started

- `buf lint` - style and best-practice check
- `buf format [-w|-d]` - print, rewrite, or diff
- `buf breaking --against [ref]` - e.g. `.git#branch=main`

# Everyday

- `buf generate` - run buf.gen.yaml plugins
- `buf dep update` - repin buf.lock
- `buf curl -d '{}' [url]` - call by reflection
- `buf registry login`, `buf push` - BSR sign in, publish

# CI

- `buf breaking --against '.git#branch=main'` - run before merging proto changes
- `buf build -o /dev/null` - fail on a proto that does not compile

# IntelliJ

- Protocol Buffers plugin, Buf plugin - set import paths

# See also

- `tldr grpcurl` - call gRPC services
- `cheat grpc` - gRPC clients
- `cheat idea` - IntelliJ IDEA
- `tldr protoc` - protoc and its plugins
