#!/bin/bash

BASEDIR=${PWD}
for I in `cat vertx-repo-list.txt | awk -F":" '{print $2}'`
do 
	cd ${BASEDIR}/${I}
	git checkout master
	git fetch --all
	git merge upstream/master
	git push origin master
	mvn clean package -DskipTests
	mvn deploy -DskipTests -DaltDeploymentRepository=nexus-snapshots::default::https://home.zanclus.com/nexus/content/repositories/snapshots/
	cd ${BASEDIR}
done
