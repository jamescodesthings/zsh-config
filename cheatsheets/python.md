# python

> Python with ruff for format, lint and imports, mypy for types, pytest for tests and uv for environments.

# Getting started

- `uv sync` - create the virtual environment and install the locked dependencies
- `uv run pytest` - run the tests
- `uv run python [file]` - run a script in the project environment

# Format and lint

- `ruff format [paths]` - format code
- `ruff check --fix [paths]` - lint, sort imports and autofix

# Types

- `mypy [paths]` - type check
- `# type: ignore` - silence one line

# Tests

- `pytest -k [expr] -x` - run matching tests, stop at the first failure
- `pytest --pdb` - drop into the debugger on a failure

# Notes

- `ruff` can ignore E501 (line length) in its config

# See also

- `cheat bazel` - build, test and run around the code
- `cheat idea` - IntelliJ setup and keys
- `cheat testing` - testing across languages
