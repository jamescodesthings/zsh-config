# protobuf

> Protobuf proto3 syntax, wire compatibility, protoc and the tools around it.

# Getting started

- `protoc --[lang]_out=[dir] [f].proto` - generate code
- `protoc --decode=[pkg.Msg] [f].proto` - binary on stdin to text
- `protoc --decode_raw`, `--encode=[pkg.Msg]` - no schema, text to binary

# Language

- `message M { string a = 1; }` - fields carry numbers
- `enum E { E_UNKNOWN = 0; }` - first value is 0
- `oneof x { string a = 1; }`, `map<string, M> m = 2;` - one set, keyed map
- `reserved 4, 9 to 11; reserved "old";` - retire numbers and names

# Compatibility

- Safe: add a field or enum value, delete and reserve
- Breaks: change a number or type, reuse a number, rename a package

# Tools

- `buf lint`, `buf curl [url]` - lint and call
- `grpcurl -plaintext [host:port] list` - list services over reflection
- `protoscope -s [f].bin` - brew install protoscope
- `evans -r repl`, `ghz`, `grpcui` - brew install each
- `protolint lint [dir]` - brew install protolint

# See also

- `cheat buf` - lint, format and breaking checks
- `cheat idea` - IntelliJ proto support
