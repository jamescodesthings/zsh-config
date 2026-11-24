# bazel test

> Run tests with Bazel; `[pkg]` is a package path.
> Pick a test target by its label; `--test_filter` narrows a JUnit-style test to one method.

# Usage

- `bazel test //[pkg]/...` - every test under a package
- `bazel test //[pkg]:[test-target]` - one test target
- `bazel test [target] --test_filter=[method]` - one method in that target
- `bazel test //[pkg]:all` - every test target in one package
- `bazel test //... --build_tests_only` - only build what the tests need

# Options

- `--test_output=errors` - print logs only for failures
- `--test_output=streamed` - live output, runs tests one by one
- `--nocache_test_results` - rerun a test that passed from cache
- `--noshow_progress` - keep the output short
- `--runs_per_test=[N]` - repeat a test, to catch flakes

# Examples

- `bazel test //app/service/... --test_output=errors` - the whole package, quietly

# Notes

- Logs land in `bazel-testlogs/[pkg]/[target]/test.log`

# See also

- `cheat bazel` - build, run and query
