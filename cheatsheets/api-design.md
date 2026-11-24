# api-design

> API design: gRPC for service to service, REST for public APIs, and no breaking changes.

# Getting started

- `buf lint` - check a proto against the lint rules
- `buf breaking --against '.git#branch=main'` - catch a breaking change before merging

# gRPC and protos

- Every change to a published proto must be backwards compatible
- A breaking change goes in a new package, such as `shop.orders.v2`
- Add fields, never reuse a number; `reserved` retires numbers and names
- Mark deprecated fields with `[deprecated = true]` and keep serving them for a set period

# Versioning

- Put the major version in the proto package (`shop.orders.v1`)
- Keep HTTP paths aligned with the major version (`/v1/orders`)

# REST

- Pick REST for external, design-first or public-docs APIs; gRPC for simple backend services
- Use nouns in paths and HTTP methods for actions, not `POST /v1/x/{id}/cancel`
- Put a major or minor version in the URI (`/v1/items`), never a patch

# See also

- `cheat grpc` - clients, protos and checks
- `cheat protobuf` - proto3 and wire compatibility
- `cheat buf` - lint, format and breaking
- `cheat http` - HTTP from the terminal
