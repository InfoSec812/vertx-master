#!/bin/bash

BASEDIR=${PWD}
for I in `cat vertx-repo-list.txt | awk -F":" '{print $2}'`
do
    echo "Updating ${I}"
    cd ${BASEDIR}/${I}
    git checkout master
    git fetch --all
    git reset --hard
    mvn clean
    git merge upstream/master
    git push origin master
    cd ${BASEDIR}
done
