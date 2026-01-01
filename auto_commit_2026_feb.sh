#!/bin/bash
start="2026-01-01"
end="2026-02-28"
current=$start
while [ "$current" != "$(date -I -d "$end + 1 day")" ]
do
  echo "$current commit" >> log.txt
  git add .
  GIT_AUTHOR_DATE="$current 12:00:00" GIT_COMMITTER_DATE="$current 12:00:00" git commit -m "commit for $current"
  current=$(date -I -d "$current + 1 day")
done
