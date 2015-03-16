#!/bin/bash

source ~/.bashrc
for I in `cat vertx-repo-list.txt | awk -F":" '{print $2}'`
do
    echo "Updating ${I}"
    cd /home/dphillips/Documents/Zanclus/Workspace/${I}
    git checkout master
    git fetch --all
    git reset --hard
    mvn clean
    git merge upstream/master
    git push origin master
    cd /home/dphillips/Documents/Zanclus/Workspace
done
