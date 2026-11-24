# data

> bq, the BigQuery command line, plus common SQL tips.

# Getting started

- `bq query -q "SELECT 1"` - check access
- `bq ls [dataset]` - tables in a dataset
- `bq show --schema [table]` - a table's columns

# Querying

- `bq query --dry_run "[sql]"` - bytes it would scan
- `bq query --format=csv "[sql]"` - csv output
- `bq head -n 10 [dataset.table]` - peek at rows without a query cost

# SQL tips

- `WHERE [partition col] = "2026-11-01"` - filter the partition
- `UNNEST([array col])` - one row per array element
- `APPROX_COUNT_DISTINCT([col])` - fast distinct count

# Loading and export

- `bq load --autodetect --source_format=CSV [dataset.table] [file.csv]` - load a file
- `bq extract [dataset.table] gs://[bucket]/[file]-*.csv` - export to storage

# See also

- `cheat review` - git and code review
- `cheat security` - secrets and access
- `cheat topics` - all work topics
