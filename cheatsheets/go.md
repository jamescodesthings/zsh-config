# go

> Go with the standard toolchain; gofmt or gofumpt to format, golangci-lint to lint, delve to debug.

# Getting started

- `go build ./...` - build every package
- `go test ./...` - run every test
- `go run .` - run the main package

# Format and lint

- `gofmt -w .` - format Go files in place
- `go vet ./...` - report suspicious constructs
- `golangci-lint run` - run the configured linters

# Debug

- `dlv debug` - build and debug the main package under delve
- `dlv test` - debug a package's tests
- `go test -run [Name] -race -v` - one test, with the race detector

# Modules

- `go mod tidy` - add missing and drop unused dependencies
- `go test -bench . -cpuprofile cpu.out` - benchmark and write a CPU profile

# See also

- `cheat bazel` - build, test and run around the code
- `cheat grpc` - call the service once it runs
- `cheat debugging` - debugging across languages
