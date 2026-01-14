#!/bin/bash
set -e

START_DATE="2026-01-01"
END_DATE="2026-01-10"

FILE="activity.log"

current="$START_DATE"

while [[ "$current" < "$END_DATE" || "$current" == "$END_DATE" ]]; do
  echo "Activity on $current" >> "$FILE"

  git add "$FILE"

  GIT_AUTHOR_DATE="${current}T12:00:00" \
  GIT_COMMITTER_DATE="${current}T12:00:00" \
  git commit -m "Activity for $current"

  current=$(date -I -d "$current + 1 day")
done
