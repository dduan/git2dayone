## Git Commit Logs For Day One

Steps:

1.  Install the [dayone CLI](http://dayoneapp.com/tools/cli-man/) tool.
2.  Put `day_one_git_messages.sh` somewhere permanent in your file system.
    For example, `$HOME/bin/`
3.  Edit `local.git2dayone.plist`. Replace `USERNAME` and
    `PATH/TO/day_one_git_messages.sh` with your system username and the
    path from step 2. Optionally, specify the hour of and minute of the
    day you'd like the script to run (default at 06:00).
4. mv `local.git2dayone.plist` to `$HOME/Library/LaunchAgents/`.
