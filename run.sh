#!/bin/bash
MAX_DAYS=100

rm -rf .git
git init
cat  <<EOF > README.md
# Time Traveler

Want to improve your GitHub vanity metrics ?
Run `run.sh`
It will create a commit for every day for the last $MAX_DAYS days.

## Commits for the last $MAX_DAYS

EOF
git add .
git commit --date "$date" -m "$message"

days=$(seq $MAX_DAYS )
for day in $days ;
do 
    date="$day days ago"
    message="Fake commited $date"
    echo "- Added fake commit $message" >> README.md
    git add .
    git commit --date "$date" -m "$message"
done


cat 
git remote add origin https://github.com/guswjd6719/tiemtraveler.git

git branch -M main
git push -u origin main

EOF