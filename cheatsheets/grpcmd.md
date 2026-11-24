# grpcmd

> The `grpc` command: list, describe and call gRPC over reflection, with short method names and completion.
> Address first, `:5990` is localhost on that port.

# Getting started

- `grpc :5990` - every service and method on a local run
- `grpc :5990 Concat` - describe a method, with a request template
- `grpc :5990 Concat '{"string_one":"a"}'` - call it

# Calling

- `grpc :5990 Check {}` - an empty request, here the health check
- `grpc :5990 [Method] 'key: value' {}` - send metadata before the body
- `grpc :5990 [Method] '{"a":1}' '{"a":2}'` - several messages to a streaming method
- `grpc :5990 [pkg.Service.Method] {}` - the full name, when a short one is ambiguous

# Options

- `[-p|--protos a.proto,b.proto]` - proto files instead of reflection
- `[-P|--paths dir]` - import paths for those protos

# Notes

- Output shows headers, each message and the `status-code` trailer
- Exit code is 64 plus the gRPC status on an error, below 64 for a tool error, 1 when it cannot connect
- `grpc server localhost:50051` starts a demo server with reflection to practise on

# See also

- `tldr grpcurl` - the same calls with grpcurl
- `cheat grpc` - which client to use
- `cheat protobuf` - the proto language
- `cheat buf` - lint, format and breaking
