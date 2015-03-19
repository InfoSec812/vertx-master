#!/bin/bash

BASEDIR=${PWD}
for I in `cat pom.xml | grep "module>" | sed 's@>\([^<]*\)<@\1@g'`
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
