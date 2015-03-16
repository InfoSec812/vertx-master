#!/bin/bash

GITHUB_OTP=$1

for I in `cat vertx-repo-list.txt`
do
    OWNER=`echo ${I} | awk -F":" '{print $1}'`
    REPO=`echo ${I} | awk -F":" '{print $2}'`
    curl -v -X POST -H "Authorization: token d26cf60dcc56613e7be2bcb6ec6c80aeb2d5c8e8" "https://api.github.com/repos/${OWNER}/${REPO}/forks"
done
