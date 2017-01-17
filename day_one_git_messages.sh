#!/usr/bin/env sh
repos=`printf "%s\n" ~/projects/*/`
user=''
journal=''
tags=''

formatString="### %s%n%n\`\`\`%n%H%nAuthor: %an (%ae)%nCommitter: %cn (%ce)%nDate: %aD%n%n%b%n\`\`\`%n%n"
journal=""
tags=""
date=`date +%Y-%m-%d`
entry="# Commit log for $date"
hasLog=false
for repoPath in $repos
do
    cd $repoPath
    logs=`GIT_PAGER=cat git log --since=6am --author=$user --pretty=tformat:"${formatString}"`
    if [ -n "$logs" ]; then
        echo "Found logs @ $repoPath"
        entry+="\\n ## $repoPath \\n "
        entry+=`echo "$logs"`
        hasLog=true
    else
        echo "No commits found for $repoPath"
    fi
done
if [ "$hasLog" = true ]; then
    echo "Logs found; adding entry"
    echo "$entry" | dayone2 -d="today" -t="$tags" -j="$journal" new
else
    echo "No logs found; not adding entry"
fi
