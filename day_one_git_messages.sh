#!/usr/bin/env sh
repos='path/to/repo1 /path/to/repo2 ...'

for repoPath in $repos
do
    cd $repoPath
    logs=`git log --since=6am`
    if [ -n "$logs" ]; then
        echo "Found logs @ $repoPath"
        echo "Commits for $repoPath\\n $logs" | dayone -d="today" new
    fi
done
