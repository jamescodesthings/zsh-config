# bazel

> Bazel builds and tests; `[pkg]` is a package path such as `app/service`.
> Name a package rather than `//...` on a large repo; add a remote cache with `--remote_cache=[url]`.

# Getting started

- `bazel build //[pkg]` - build a package's default targets
- `bazel test //[pkg]/...` - every test under a package
- `bazel run //[pkg]:[target]` - build and run a binary

# Everyday

- `bazel test //[pkg]:[test-target]` - one test target
- `bazel query //[pkg]/...` - every target under a package
- `bazel query 'rdeps(//..., //[pkg]:[target])'` - what depends on a target
- `bazel cquery //[pkg]:[target]` - query the configured build graph
- `bazel info [output_base|bazel-bin]` - paths and settings

# Notes

- `bazel clean` wipes outputs; `bazel shutdown` restarts a confused server
- `--noshow_progress` keeps output short; `--config=[name]` loads a `.bazelrc` config

# See also

- `cheat bazel test` - one target, output, cache
- `cheat buf` - protobuf lint and breaking checks
- `cheat tools` - IDEs and build tools
