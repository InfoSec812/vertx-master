#!/bin/bash

BASEDIR=${PWD}
for I in `cat pom.xml | grep "module>" | sed 's@^.*module.\([^<]*\)</module.*@\1@g'`
do
    echo "Updating ${I}"
    cd ${BASEDIR}/${I}
    git checkout master
    git fetch --all
    git reset --hard
    mvn clean
    git remote -v | grep upstream && \
        git merge upstream/master || \
        git pull --rebase
    git push origin master
    git pull --rebase origin master
    cd ${BASEDIR}
done
git commit -a -m "Updated submodule references to upstream master's HEAD"
git push origin master
