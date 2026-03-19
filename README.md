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

## How to Replicate This for a Different Repo

Follow these steps to create a new GitHub repo and load files from local folders using the same process.

### 1. Create the GitHub repo

```bash
gh repo create ManleyJS/YOUR-REPO-NAME --public --description "Your description"
```

### 2. Clone it locally

```bash
cd ~/claude
git clone https://github.com/ManleyJS/YOUR-REPO-NAME.git
cd YOUR-REPO-NAME
```

### 3. Pre-process and copy files into the local repo

Before copying, apply these rules:

- **Skip copies** — exclude files with `(1)`, `(2)` etc. in the name
- **Normalise filenames** — replace spaces and hyphens with underscores; remove any character that isn't a letter, number, underscore, or period
- **Handle cross-source duplicates** — if the same normalised filename exists in more than one source folder, prefix each copy with a source label (e.g. `snowsight_`, `OneDrive_`, `Workspace_`)
- **Exclude large non-script files** — `.sql` files over a few MB are likely database dumps, not scripts; skip them

Then copy the processed files into the repo folder.

### 4. Check for credentials before committing

Search files for these patterns and replace any actual values with `<REDACTED>`:

- `aws_key_id='...'` / `aws_secret_key='...'`
- `password='...'` / `PASSWORD='...'`
- `azure_sas_token='...'`
- GitHub tokens: `ghp_...`
- AWS access key IDs: `AKIA` followed by 16 uppercase letters/numbers

### 5. Commit and push in batches

GitHub will reject a single large push with a 408 timeout error if there are many files. Push in batches of ~90 files at a time:

```bash
cd ~/claude/YOUR-REPO-NAME

# First batch — this also creates the main branch on GitHub
git add file1.sql file2.sql ... file90.sql
git commit -m "Batch 1"
git push -u origin HEAD:main

# Subsequent batches
git add file91.sql ... file180.sql
git commit -m "Batch 2"
git push origin HEAD:main

# Repeat until all files are pushed
```

> **Note:** Always use `git push origin HEAD:main` (not just `git push`) if your local branch has a different name to `main`.

### 6. Add a README

```bash
# Create README.md, then:
git add README.md
git commit -m "Add README"
git push origin HEAD:main
```
