# md

Create a directory and immediately cd into it.

## Usage

- Create directory and cd into it:

`md <path>`

- Create directory without cd:

`md --no-follow <path>`

## Examples

- New project directory:

`md ~/projects/my-app`

- Nested path (creates all parents):

`md src/components/ui`

- Create without entering:

`md --no-follow dist/assets`
