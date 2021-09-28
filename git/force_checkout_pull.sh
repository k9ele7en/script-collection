# reset change and force checkout
git fetch --all
git reset --hard origin/master
git pull origin master
git checkout -f <target_branch>