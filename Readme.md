# Repo Extractor

Clone GitHub repos listed in `repo_urls.json` and create zipped copies.

## Requirements
- `bash`, `git`, `jq`, `zip`
- Internet access for cloning

## Setup
1. Add your GitHub repo URLs under `repositories` in `repo_urls.json` (one per line).
2. Make the script executable: `chmod +x zip_repos.sh`.

## Usage
1. Run: `./zip_repos.sh`
2. Zipped outputs are written to `zips/` as `<repo>.zip`.

## Notes
- Uses shallow clones (`--depth=1`) and parallel jobs (CPU count).
- Existing zip files with the same name are overwritten.