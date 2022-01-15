#!/bin/bash  
## git upload auto script - example script
## CLASS_PROGRAMMING 
## command line param, example for a repo:   $1 => username/username.github.io.git

PATH_REPO=$1

git remote set-url origin git@github.com:$1

#cd $PATH_REPO
git add .

currentDate=`date +"%Y-%m-%d %T"`
git commit -m  currentDate
git pull origin master
git push origin master

exit 1
