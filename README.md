# SQL Scripts History

A centralised repository of SQL scripts consolidated from three local sources.

## Sources

| Prefix | Source |
|--------|--------|
| `snowsight_` | Snowflake Snowsight scripts (`/work/sqlcode/`) |
| `OneDrive_` | OneDrive scripts (`/OneDrive/Work/Scripts/`) |
| `Workspace_` | DBeaver workspace scripts (`DBeaverData/workspace6/General/Scripts/`) |

The source prefix is only applied to filenames where the same script name existed in more than one source.

## Naming Conventions

- Spaces and hyphens replaced with underscores
- Only letters, numbers, underscores, and periods in filenames
- Duplicate copy files (e.g. `script (1).sql`) excluded

## Notes

- Hardcoded credentials have been redacted and replaced with `<REDACTED>`
- 540 scripts loaded in total

---

## How to Add New Scripts Manually

Follow these steps to add new SQL files to the repo in future.

### 1. Pre-process files before copying

- **Skip copies** — exclude any files with `(1)`, `(2)` etc. in the name (e.g. `my_script (1).sql`)
- **Normalise filenames** — replace spaces and hyphens with underscores; remove any character that isn't a letter, number, underscore, or period
- **Handle duplicates** — if the same normalised filename comes from more than one source, prefix it with the source label: `snowsight_`, `OneDrive_`, or `Workspace_`
- **Exclude large non-script files** — e.g. full database dumps (`.sql` files over a few MB are likely dumps, not scripts)

### 2. Check for credentials before committing

Search files for patterns like:
- `aws_key_id='...'` / `aws_secret_key='...'`
- `password='...'` / `PASSWORD='...'`
- `azure_sas_token='...'`
- GitHub tokens: `ghp_...`
- AWS access key IDs: `AKIA` followed by 16 uppercase letters/numbers

Replace any found values with `<REDACTED>` before committing.

### 3. Copy files to the local repo

```bash
cp /path/to/new/scripts/*.sql /Users/manleyjs/claude/SQL-Scripts-History/
```

### 4. Commit and push

GitHub will reject a single large push (408 timeout), so push in batches of ~90 files at a time:

```bash
cd /Users/manleyjs/claude/SQL-Scripts-History

# Stage and commit in batches, then push each one
git add file1.sql file2.sql ... file90.sql
git commit -m "Add new scripts: batch 1"
git push origin main

git add file91.sql ... file180.sql
git commit -m "Add new scripts: batch 2"
git push origin main

# repeat as needed
```
